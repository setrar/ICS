library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

library common;
use common.axi_pkg.all;

use work.crypto_pkg.all;
use std.env.all;

entity axi_sim is
    generic(
        f_mhz:    positive := 1
    );
    port(
        s0_axi_arready: out   std_ulogic;
        s0_axi_awready: out   std_ulogic;
        s0_axi_wready:  out   std_ulogic;
        s0_axi_rdata:   out   std_ulogic_vector(31 downto 0);
        s0_axi_rresp:   out   std_ulogic_vector(1 downto 0);
        s0_axi_rvalid:  out   std_ulogic;
        s0_axi_bresp:   out   std_ulogic_vector(1 downto 0);
        s0_axi_bvalid:  out   std_ulogic
    );
end entity axi_sim;

architecture sim of axi_sim is

    constant axi_resp_okay:   std_ulogic_vector(1 downto 0) := "00";
    constant axi_resp_exokay: std_ulogic_vector(1 downto 0) := "01";
    constant axi_resp_slverr: std_ulogic_vector(1 downto 0) := "10";
    constant axi_resp_decerr: std_ulogic_vector(1 downto 0) := "11";

    constant period:          time := (1.0e3 * 1 ns) / real(f_mhz);

    signal aclk:            std_ulogic;
    signal aresetn:         std_ulogic;
    signal s0_axi_araddr:   std_ulogic_vector(11 downto 0);
    signal s0_axi_arvalid:  std_ulogic;
    signal s0_axi_rready:   std_ulogic;
    signal s0_axi_awaddr:   std_ulogic_vector(11 downto 0);
    signal s0_axi_awvalid:  std_ulogic;
    signal s0_axi_wdata:    std_ulogic_vector(31 downto 0);
    signal s0_axi_wstrb:    std_ulogic_vector(3 downto 0);
    signal s0_axi_wvalid:   std_ulogic;
    signal s0_axi_bready:   std_ulogic;

    signal led:   std_ulogic_vector(3 downto 0);
    signal m0_axi_araddr:   std_ulogic_vector(31 downto 0);
    signal m0_axi_arvalid:   std_ulogic;
    signal m0_axi_arready:   std_ulogic;
    signal m0_axi_awaddr:   std_ulogic_vector(31 downto 0);
    signal m0_axi_awvalid:   std_ulogic;
    signal m0_axi_awready:   std_ulogic;
    signal m0_axi_wdata:   std_ulogic_vector(31 downto 0);
    signal m0_axi_wstrb:   std_ulogic_vector(3 downto 0);
    signal m0_axi_wvalid:   std_ulogic;
    signal m0_axi_wready:   std_ulogic;
    signal m0_axi_rdata:   std_ulogic_vector(31 downto 0);
    signal m0_axi_rresp:   std_ulogic_vector(1 downto 0);
    signal m0_axi_rvalid:   std_ulogic;
    signal m0_axi_rready:   std_ulogic;
    signal m0_axi_bresp:   std_ulogic_vector(1 downto 0);
    signal m0_axi_bvalid:   std_ulogic;
    signal m0_axi_bready:   std_ulogic;
    signal irq:   std_ulogic;
    signal sw:   std_ulogic_vector(3 downto 0);
    signal btn:   std_ulogic_vector(3 downto 0);





begin

    process
    begin
        aclk <= '0';
        wait for period / 2;
        aclk <= '1';
        wait for period / 2;
    end process;

    crypto: entity work.crypto(rtl)
    port map(
        aclk           => aclk,
        aresetn        => aresetn,
        s0_axi_araddr  => s0_axi_araddr,
        s0_axi_arvalid => s0_axi_arvalid,
        s0_axi_rready  => s0_axi_rready,
        s0_axi_awaddr  => s0_axi_awaddr,
        s0_axi_awvalid => s0_axi_awvalid,
        s0_axi_wdata   => s0_axi_wdata,
        s0_axi_wstrb   => s0_axi_wstrb,
        s0_axi_wvalid  => s0_axi_wvalid,
        s0_axi_bready  => s0_axi_bready,
        s0_axi_arready => s0_axi_arready,
        s0_axi_rdata   => s0_axi_rdata,
        s0_axi_rresp   => s0_axi_rresp,
        s0_axi_rvalid  => s0_axi_rvalid,
        s0_axi_awready => s0_axi_awready,
        s0_axi_wready  => s0_axi_wready,
        s0_axi_bresp   => s0_axi_bresp,
        s0_axi_bvalid  => s0_axi_bvalid,
        led            => led,
        m0_axi_araddr => m0_axi_araddr,
        m0_axi_arvalid => m0_axi_arvalid,
        m0_axi_arready => m0_axi_arready,
        m0_axi_awaddr => m0_axi_awaddr,
        m0_axi_awvalid => m0_axi_awvalid,
        m0_axi_awready => m0_axi_awready,
        m0_axi_wdata => m0_axi_wdata,
        m0_axi_wstrb => m0_axi_wstrb,
        m0_axi_wvalid => m0_axi_wvalid,
        m0_axi_wready => m0_axi_wready,
        m0_axi_rdata => m0_axi_rdata,
        m0_axi_rresp => m0_axi_rresp,
        m0_axi_rvalid => m0_axi_rvalid,
        m0_axi_rready => m0_axi_rready,
        m0_axi_bresp => m0_axi_bresp,
        m0_axi_bvalid => m0_axi_bvalid,
        m0_axi_bready => m0_axi_bready,
        irq => irq,
        sw => sw,
        btn => btn
    );

    -- Submit random AXI4 lite requests
    process
    begin
        aresetn        <= '0';
        s0_axi_araddr  <= x"030";
        s0_axi_arvalid <= '0';
        s0_axi_rready  <= '0';
        s0_axi_awaddr  <= x"02C";
        s0_axi_awvalid <= '0';
        s0_axi_wdata   <= x"00000002";
        s0_axi_wstrb   <= (others => '0');
        s0_axi_wvalid  <= '0';
        s0_axi_bready  <= '0';
        for i in 1 to 10 loop
            wait until rising_edge(aclk);
        end loop;
        aresetn <= '1';
        wait until rising_edge(aclk);
        s0_axi_awvalid <= '1';
        s0_axi_wvalid <= '1';
        s0_axi_bready <= '1';
        wait until rising_edge(aclk);
        s0_axi_awvalid <= '0';
        s0_axi_wvalid <= '0';
        wait until s0_axi_bvalid = '1';

        for i in 1 to 10 loop
            wait until rising_edge(aclk);
        end loop;

        s0_axi_arvalid <= '1';
        s0_axi_rready <= '1';

        wait until rising_edge(aclk);
        s0_axi_arvalid <= '0';
        wait until s0_axi_rvalid = '1';
    end process;

end architecture sim;

-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
