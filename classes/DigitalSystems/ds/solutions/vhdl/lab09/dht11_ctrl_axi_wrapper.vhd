-- MASTER-ONLY: DO NOT MODIFY THIS FILE
--
-- Copyright © Telecom Paris
-- Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)
-- 
-- This file must be used under the terms of the CeCILL. This source
-- file is licensed as described in the file COPYING, which you should
-- have received as part of this distribution. The terms are also
-- available at:
-- https://cecill.info/licences/Licence_CeCILL_V2.1-en.html
--

library ieee;
use ieee.std_logic_1164.all;
-- For the vector and arithmetic computations (needed for the addresses
-- comparisons), we use the numeric_std_unsigned package of library ieee. It
-- simply overloads the arithmetic operators (in their unsigned version) for
-- the std_ulogic_vector type.
use ieee.numeric_std_unsigned.all;

-- The common.axi_pkg package declares the AXI4 response constants that we use:
-- axi_resp_okay, axi_resp_slverr, axi_resp_decerr.
library common;
use common.axi_pkg.all;

-- The unisim.vcomponents package declares the "iobuf" tri-state buffer
-- component.
library unisim;
use unisim.vcomponents.all;

-- Immediate translation of the specification.
entity dht11_ctrl_axi_wrapper is
    generic(
        f_mhz:    positive := 100;
        start_us: positive := 18000;
        warm_us:  positive := 1000000
    );
    port(
        aclk:           in    std_ulogic;
        aresetn:        in    std_ulogic;
        s0_axi_araddr:  in    std_ulogic_vector(11 downto 0);
        s0_axi_arvalid: in    std_ulogic;
        s0_axi_arready: out   std_ulogic;
        s0_axi_awaddr:  in    std_ulogic_vector(11 downto 0);
        s0_axi_awvalid: in    std_ulogic;
        s0_axi_awready: out   std_ulogic;
        s0_axi_wdata:   in    std_ulogic_vector(31 downto 0);
        s0_axi_wstrb:   in    std_ulogic_vector(3 downto 0);
        s0_axi_wvalid:  in    std_ulogic;
        s0_axi_wready:  out   std_ulogic;
        s0_axi_rdata:   out   std_ulogic_vector(31 downto 0);
        s0_axi_rresp:   out   std_ulogic_vector(1 downto 0);
        s0_axi_rvalid:  out   std_ulogic;
        s0_axi_rready:  in    std_ulogic;
        s0_axi_bresp:   out   std_ulogic_vector(1 downto 0);
        s0_axi_bvalid:  out   std_ulogic;
        s0_axi_bready:  in    std_ulogic;
        data:           inout std_logic;
        led:            out   std_ulogic_vector(3 downto 0)
    );
end entity dht11_ctrl_axi_wrapper;

architecture rtl of dht11_ctrl_axi_wrapper is

    -- The I/Os of our DHT11 controller
    signal data_in: std_ulogic;
    signal force0:  std_ulogic;
    signal dso:     std_ulogic;
    signal cerr:    std_ulogic;
    signal rh:      std_ulogic_vector(7 downto 0);
    signal tp:      std_ulogic_vector(7 downto 0);
    -- The 3 specified registers
    signal v_reg:   std_ulogic;
    signal rh_reg:  std_ulogic_vector(7 downto 0);
    signal tp_reg:  std_ulogic_vector(7 downto 0);

    -- Our 2 state machines control the AXI4 lite read and write transactions. They have 3 states each:
    --   * idle:  the reset state and the state in which we wait for a request
    --   * req:   the state in which we acknowledge a request and start sending a response
    --   * delay: the state in which we wait until the CPU acknowledges a pending response
    type states is (idle, req, delay);
    -- Two signals for the 2 current states of our 2 state machines
    signal state_r, state_w: states;

begin

    -- Instance of our DHT11 controller
    u0: entity work.dht11_ctrl(rtl)
    generic map(
        f_mhz    => f_mhz,
        start_us => start_us,
        warm_us  => warm_us
    )
    port map(
        clk      => aclk,
        sresetn  => aresetn,
        data_in  => data_in,
        force0   => force0,
        dso      => dso,
        cerr     => cerr,
        rh       => rh,
        tp       => tp
    );

    -- Tri-state buffer. Component instantiation (not "entity")
    u1 : iobuf
    generic map (
        drive      => 12,
        iostandard => "lvcmos33",
        slew       => "slow")
    port map (
        o  => data_in,
        io => data,
        i  => '0',
        t  => force0
    );

    -- According the specifications
    led <= v_reg & '0' & rh_reg(0) & tp_reg(0);

    -- According the specifications
    process(aclk)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                v_reg  <= '0';
                rh_reg <= (others => '0');
                tp_reg <= (others => '0');
            elsif dso = '1' and cerr = '0' then
                v_reg  <= '1';
                rh_reg <= rh;
                tp_reg <= tp;
            end if;
        end if;
    end process;

    -- The state evolution part of the AXI4 lite write state machine
    process(aclk)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                -- idle is the reset state
                state_w <= idle;
            else
                case state_w is
                    when idle =>
                        -- When in "idle" state we wait until there is an address
                        -- write request ("awvalid" = '1') and a data write
                        -- request ("wvalid" = '1') at the same time.
                        if s0_axi_awvalid = '1' and s0_axi_wvalid = '1' then
                            -- If it happens we go in "req" state
                            state_w <= req;
                        end if;
                    when req =>
                        -- When in "req" state we go back to "idle" if our
                        -- response is acknowledged ("bready" = '1'), else in
                        -- "delay" state (we cannot stay in "req" because
                        -- "awready" and "wready" must be changed from '1' to
                        -- '0').
                        if s0_axi_bready = '1' then
                            state_w <= idle;
                        else
                            state_w <= delay;
                        end if;
                    when delay =>
                        -- When in "delay" state we maintain our response until
                        -- it is finally acknowledged ("bready" = '1'). When it
                        -- happens we go back to "idle".
                        if s0_axi_bready = '1' then
                            state_w <= idle;
                        end if;
                end case;
            end if;
        end if;
    end process;

    -- The "bresp" write response cannot change while we submit a write
    -- response ("bvalid" = '1'). So we need a register to maintain it.
    process(aclk)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                -- As we do not submit a write response during reset ("bvalid"
                -- = '0') we can use any reset value for "bresp", it is ignored
                -- by the CPU. So, why not "okay"?
                s0_axi_bresp <= axi_resp_okay;
            elsif s0_axi_bvalid = '0' then
                -- It is only when we do not submit a write response ("bvalid"
                -- = '0') that we can change "bresp".
                if s0_axi_awaddr < 4 then
                    -- According the specifications: "slverr" response if the
                    -- write address is 0, 1, 2 or 3. Else "decerr". Note that
                    -- our write response is computed (from the "awaddr" write
                    -- address), even when there is no write request. This does
                    -- not matter because our write responses are considered by
                    -- the CPU only when we submit a write response ("bvalid" =
                    -- '1').
                    s0_axi_bresp <= axi_resp_slverr;
                else
                    s0_axi_bresp <= axi_resp_decerr;
                end if;
            end if;
        end if;
    end process;

    -- We acknowledge the address write and the data write requests while in
    -- state "req" (during one clock cycle only because our state machine stays
    -- in "req" during only one clock cycle).
    s0_axi_awready <= '1' when state_w = req else '0';
    s0_axi_wready  <= '1' when state_w = req else '0';
    -- We submit a write response when not in "idle" state (that is, when in
    -- "req" or "delay" states).
    s0_axi_bvalid  <= '0' when state_w = idle else '1';

    -- The state evolution part of the AXI4 lite read state machine
    process(aclk)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                -- idle is the reset state
                state_r      <= idle;
            else
                case state_r is
                    when idle =>
                        -- When in "idle" state we wait until there is an address
                        -- read request ("arvalid" = '1').
                        if s0_axi_arvalid = '1' then
                            -- If it happens we go in "req" state
                            state_r <= req;
                        end if;
                    when req =>
                        -- When in "req" state we go back to "idle" if our
                        -- response is acknowledged ("rready" = '1'), else in
                        -- "delay" state (we cannot stay in "req" because
                        -- "arready" must be changed from '1' to '0').
                        if s0_axi_rready = '1' then
                            state_r <= idle;
                        else
                            state_r <= delay;
                        end if;
                    when delay =>
                        -- When in "delay" state we maintain our response until
                        -- it is finally acknowledged ("rready" = '1'). When it
                        -- happens we go back to "idle".
                        if s0_axi_rready = '1' then
                            state_r <= idle;
                        end if;
                end case;
            end if;
        end if;
    end process;

    -- The "rresp" read response and the "rdata" read data cannot change while
    -- we submit a read response ("rvalid" = '1'). So we need registers to
    -- maintain it.
    process(aclk)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                -- As we do not submit a read response and data during reset
                -- ("rvalid" = '0') we can use any reset value for "rdata" and
                -- "rresp", they are ignored by the CPU. So, why not all zero
                -- and "okay"?
                s0_axi_rdata <= (others => '0');
                s0_axi_rresp <= axi_resp_okay;
            elsif s0_axi_rvalid = '0' then
                -- It is only when we do not submit a read response ("rvalid"
                -- = '0') that we can change "rdata" and "rresp". "rdata" shall
                -- be as specified.
                s0_axi_rdata <= v_reg & "000000000000000" & rh_reg & tp_reg;
                if s0_axi_araddr < 4 then
                    -- According the specifications: "okay" response if the
                    -- read address is 0, 1, 2 or 3. Else "decerr". Note that
                    -- our read response is computed (from the "araddr" read
                    -- address), even when there is no read request. This does
                    -- not matter because our read responses are considered by
                    -- the CPU only when we submit a read response ("rvalid" =
                    -- '1').
                    s0_axi_rresp <= axi_resp_okay;
                else
                    s0_axi_rresp <= axi_resp_decerr;
                end if;
            end if;
        end if;
    end process;

    -- We acknowledge the address read requests while in -- state "req" (during
    -- one clock cycle only because our state machine stays in "req" during
    -- only one clock cycle).
    s0_axi_arready <= '1' when state_r = req else '0';
    -- We submit a read response when not in "idle" state (that is, when in
    -- "req" or "delay" states).
    s0_axi_rvalid  <= '0' when state_r = idle else '1';

end architecture rtl;

-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
