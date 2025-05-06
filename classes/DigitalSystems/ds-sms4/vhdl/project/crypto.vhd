library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

library common;
use common.axi_pkg.all;

use work.crypto_pkg.all;

entity crypto is
    port(
        aclk:           in  std_ulogic;
        aresetn:        in  std_ulogic;
        s0_axi_araddr:  in  std_ulogic_vector(11 downto 0);
        s0_axi_arvalid: in  std_ulogic;
        s0_axi_arready: out std_ulogic;
        s0_axi_awaddr:  in  std_ulogic_vector(11 downto 0);
        s0_axi_awvalid: in  std_ulogic;
        s0_axi_awready: out std_ulogic;
        s0_axi_wdata:   in  std_ulogic_vector(31 downto 0);
        s0_axi_wstrb:   in  std_ulogic_vector(3 downto 0);
        s0_axi_wvalid:  in  std_ulogic;
        s0_axi_wready:  out std_ulogic;
        s0_axi_rdata:   out std_ulogic_vector(31 downto 0);
        s0_axi_rresp:   out std_ulogic_vector(1 downto 0);
        s0_axi_rvalid:  out std_ulogic;
        s0_axi_rready:  in  std_ulogic;
        s0_axi_bresp:   out std_ulogic_vector(1 downto 0);
        s0_axi_bvalid:  out std_ulogic;
        s0_axi_bready:  in  std_ulogic;
        m0_axi_araddr:  out std_ulogic_vector(31 downto 0);
        m0_axi_arvalid: out std_ulogic;
        m0_axi_arready: in  std_ulogic;
        m0_axi_awaddr:  out std_ulogic_vector(31 downto 0);
        m0_axi_awvalid: out std_ulogic;
        m0_axi_awready: in  std_ulogic;
        m0_axi_wdata:   out std_ulogic_vector(31 downto 0);
        m0_axi_wstrb:   out std_ulogic_vector(3 downto 0);
        m0_axi_wvalid:  out std_ulogic;
        m0_axi_wready:  in  std_ulogic;
        m0_axi_rdata:   in  std_ulogic_vector(31 downto 0);
        m0_axi_rresp:   in  std_ulogic_vector(1 downto 0);
        m0_axi_rvalid:  in  std_ulogic;
        m0_axi_rready:  out std_ulogic;
        m0_axi_bresp:   in  std_ulogic_vector(1 downto 0);
        m0_axi_bvalid:  in  std_ulogic;
        m0_axi_bready:  out std_ulogic;
        irq:            out std_ulogic;
        sw:             in  std_ulogic_vector(3 downto 0);
        btn:            in  std_ulogic_vector(3 downto 0);
        led:            out std_ulogic_vector(3 downto 0)
    );
end entity crypto;

architecture rtl of crypto is

    signal go: std_ulogic;
    signal done: std_ulogic;

    signal launch: std_ulogic;
    
    signal K: w128;
    signal ICB: w128;
    signal IBA: zi;
    signal OBA: zi;
    signal MBL: zi;
    signal CTRL: zi;
    signal STATUS: zi;

    signal RESP: w128; -- Response register for the simple version conatining the processed ciphertext

    alias RST: std_ulogic is CTRL(0);
    alias CE: std_ulogic is CTRL(1);
    alias IE: std_ulogic is CTRL(2);

    alias BSY: std_ulogic is STATUS(0);
    alias EOP: std_ulogic is STATUS(1);
    alias ERR: std_ulogic is STATUS(2);
    alias CAUSE: std_ulogic_vector is STATUS(5 downto 3);

    type crypto_state is (Crypto_idle, Crypto_busy);
    signal CS, NS: crypto_state;

    type type_state is (Idle, Req, Delay);
    signal state_w, state_r: type_state;
begin

    crypto_engine0: entity work.crypto_engine(rtl)
    port map(
        clk     => aclk,
        sresetn => (not RST) and aresetn,
        go      => go,
        done    => done,
        key     => K,
        p       => ICB,
        c       => RESP
    );

    write_moore: process(aclk, s0_axi_wvalid, s0_axi_awvalid, s0_axi_bready)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                state_w <= idle;
            else
                case state_w is
                    when idle =>
                        if s0_axi_awvalid = '1' and s0_axi_wvalid = '1' then
                            state_w <= req;
                        end if;
                    when req =>
                        if s0_axi_bready = '1' then
                            state_w <= idle;
                        else
                            state_w <= delay;
                        end if;
                    when delay =>
                        if s0_axi_bready = '1' then
                            state_w <= idle;
                        end if;
                end case;
            end if;
        end if;
    end process write_moore;

    write_reg: process(aclk, s0_axi_bvalid, s0_axi_awaddr, BSY, CE)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                s0_axi_bresp <= axi_resp_okay;
                launch <= '0';
                K <= (others => '0');
                ICB <= (others => '0');
                IBA <= (others => '0');
                OBA <= (others => '0');
                MBL <= (others => '0');
                CTRL <= (others => '0');
                STATUS(31 downto 1) <= (others => '0');  
            elsif s0_axi_bvalid = '0' then
                launch <= '0';
                --Write  the data given by the CPU in the correct register if the chip is enabled
                --If an encryption is runninig, related registers are not rewritten by checking the state of the BSY flag
                case to_integer(unsigned(s0_axi_awaddr)) is
                    when 0 to 3 => 
                        if BSY = '0' and CE = '1' then
                            K(31 downto 0) <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 4 to 7 =>
                        if BSY = '0' and CE = '1' then
                            K(63 downto 32) <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 8 to 11 =>
                        if BSY = '0' and CE = '1' then
                            K(95 downto 64) <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 12 to 15 =>
                        if BSY = '0' and CE = '1' then
                            K(127 downto 96) <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 16 to 19 =>
                        if BSY = '0' and CE = '1' then
                            ICB(31 downto 0) <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 20 to 23 =>
                        if BSY = '0' and CE = '1' then
                            ICB(63 downto 32) <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 24 to 27 =>
                        if BSY = '0' and CE = '1' then
                            ICB(95 downto 64) <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 28 to 31 =>
                        if BSY = '0' and CE = '1' then
                            ICB(127 downto 96) <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 32 to 35 =>
                        if BSY = '0' and CE = '1' then
                            IBA <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 36 to 39 =>
                        if BSY = '0' and CE = '1' then
                            OBA <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 40 to 43 =>
                        if BSY = '0' and CE = '1' then
                            MBL <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 44 to 47 =>
                        CTRL <= s0_axi_wdata;
                        s0_axi_bresp <= axi_resp_okay;
                    when 48 to 51 => -- When the STATUS register is written on by the CPU, the encryption is launched
                        if CE = '1' then
                            launch <= '1';
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 52 to 55 =>
                        if BSY = '0' and CE = '1' then
                            RESP(31 downto 0) <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 56 to 59 =>
                        if BSY = '0' and CE = '1' then
                            RESP(63 downto 32) <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 60 to 63 =>
                        if BSY = '0' and CE = '1' then
                            RESP(95 downto 64) <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when 64 to 67 =>
                        if BSY = '0' and CE = '1' then
                            RESP(127 downto 96) <= s0_axi_wdata;
                        end if;
                        s0_axi_bresp <= axi_resp_okay;
                    when others =>
                        s0_axi_bresp <= axi_resp_decerr;
                end case;
            end if;
        end if;
    end process write_reg;
    
    s0_axi_awready <= '1' when state_w = req else '0';
    s0_axi_wready  <= '1' when state_w = req else '0';
    s0_axi_bvalid  <= '0' when state_w = idle else '1';

    read_moore: process(aclk, state_r, s0_axi_arvalid, s0_axi_rready)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                state_r <= idle;
            else
                case state_r is
                    when idle =>
                        if s0_axi_arvalid = '1' then
                            state_r <= req;
                        end if;
                    when req =>
                        if s0_axi_rready = '1' then
                            state_r <= idle;
                        else
                            state_r <= delay;
                        end if;
                    when delay =>
                        if s0_axi_rready = '1' then
                            state_r <= idle;
                        end if;
                end case;
            end if;
        end if;
    end process read_moore;

    read_reg: process(aclk, s0_axi_rvalid, s0_axi_araddr)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                s0_axi_rdata <= (others => '0');
                s0_axi_rresp <= axi_resp_okay;
            elsif s0_axi_rvalid = '0' then
                case to_integer(unsigned(s0_axi_araddr)) is -- Return to the CPU the asked data
                    when 0 to 3 => 
                        s0_axi_rdata <= K(31 downto 0);
                        s0_axi_rresp <= axi_resp_okay;
                    when 4 to 7 =>
                        s0_axi_rdata <= K(63 downto 32);
                        s0_axi_rresp <= axi_resp_okay;
                    when 8 to 11 =>
                        s0_axi_rdata <= K(95 downto 64);
                        s0_axi_rresp <= axi_resp_okay;
                    when 12 to 15 =>
                        s0_axi_rdata <= K(127 downto 96);
                        s0_axi_rresp <= axi_resp_okay;
                    when 16 to 19 =>
                        s0_axi_rdata <= ICB(31 downto 0);
                        s0_axi_rresp <= axi_resp_okay;
                    when 20 to 23 =>
                        s0_axi_rdata <= ICB(63 downto 32);
                        s0_axi_rresp <= axi_resp_okay;
                    when 24 to 27 =>
                        s0_axi_rdata <= ICB(95 downto 64);
                        s0_axi_rresp <= axi_resp_okay;
                    when 28 to 31 =>
                        s0_axi_rdata <= ICB(127 downto 96);
                        s0_axi_rresp <= axi_resp_okay;
                    when 32 to 35 =>
                        s0_axi_rdata <= IBA;
                        s0_axi_rresp <= axi_resp_okay;
                    when 36 to 39 =>
                        s0_axi_rdata <= OBA;
                        s0_axi_rresp <= axi_resp_okay;
                    when 40 to 43 =>
                        s0_axi_rdata <= MBL;
                        s0_axi_rresp <= axi_resp_okay;
                    when 44 to 47 =>
                        s0_axi_rdata <= CTRL;
                        s0_axi_rresp <= axi_resp_okay;
                    when 48 to 51 =>
                        s0_axi_rdata <= STATUS;
                        s0_axi_rresp <= axi_resp_okay;
                    -- The ciphertext is stored in the RESP register, which can be accessed at offset 52 and is 16 bytes long
                    when 52 to 55 =>
                        s0_axi_rdata <= RESP(31 downto 0);
                        s0_axi_rresp <= axi_resp_okay;
                    when 56 to 59 =>
                        s0_axi_rdata <= RESP(63 downto 32);
                        s0_axi_rresp <= axi_resp_okay;
                    when 60 to 63 =>
                        s0_axi_rdata <= RESP(95 downto 64);
                        s0_axi_rresp <= axi_resp_okay;
                    when 64 to 67 =>
                        s0_axi_rdata <= RESP(127 downto 96);
                        s0_axi_rresp <= axi_resp_okay;
                    when others =>
                        s0_axi_rresp <= axi_resp_decerr;
                end case;
            end if;
        end if;
    end process read_reg;

    s0_axi_arready <= '1' when state_r = req else '0';
    s0_axi_rvalid  <= '0' when state_r = idle else '1';

    -- Put back the EOP and ERR flags to '0' when the STATUS register is read:
    --EOP <= '0' when ((s0_axi_rready = '1' and to_integer(unsigned(s0_axi_araddr)) >= 48 and to_integer(unsigned(s0_axi_araddr)) <= 51) or aresetn = '0' or RST = '1') else '1' when done else EOP;
    --ERR <= '0' when ((s0_axi_rready = '1' and to_integer(unsigned(s0_axi_araddr)) >= 48 and to_integer(unsigned(s0_axi_araddr)) <= 51) or aresetn = '0' or RST = '1') else ERR;

    -- Small FSM to handle signals that must stay high for only one clock period
    crypto_fsm_seq0: process(aclk)
    begin
        if rising_edge(aclk) then
            if(aresetn and (not RST)) then
                CS <= Crypto_idle;
            else
                CS <= NS;
            end if;
        end if;
    end process crypto_fsm_seq0;

    crypto_fsm_com0: process(CS, launch, done, IE)
    begin
        irq <= '0';
        go <= '0';
        BSY <= '0';
        case CS is
            when Crypto_idle =>
                if launch = '1' then
                    NS <= crypto_busy;
                    BSY <= '1';
                    go <= '1'; -- Launch encryption when required by the CPU
                else
                    NS <= Crypto_idle;
                end if;
            when Crypto_busy =>
                if done = '1' then
                    NS <= Crypto_idle;
                    if IE = '1' then
                        irq <= '1'; -- Set interrupt flag to 1 if demanded by the CTRL register
                    end if;
                else
                    NS <= Crypto_busy;
                    BSY <= '1';
                end if;
        end case;
    end process crypto_fsm_com0;

end architecture rtl;

-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
