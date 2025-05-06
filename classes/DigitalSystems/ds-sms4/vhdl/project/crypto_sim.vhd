library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

library common;
use common.axi_pkg.all;

entity crypto_sim is
end entity crypto_sim;

use std.env.all;

architecture sim of crypto_sim is

    signal aclk: std_ulogic;
    signal aresetn: std_ulogic;
    signal s0_axi_araddr: std_ulogic_vector(11 downto 0);
    signal s0_axi_arvalid: std_ulogic;
    signal s0_axi_arready: std_ulogic;
    signal s0_axi_awaddr: std_ulogic_vector(11 downto 0);
    signal s0_axi_awvalid: std_ulogic;
    signal s0_axi_awready: std_ulogic;
    signal s0_axi_wdata: std_ulogic_vector(31 downto 0);
    signal s0_axi_wstrb: std_ulogic_vector(3 downto 0);
    signal s0_axi_wvalid: std_ulogic;
    signal s0_axi_wready: std_ulogic;
    signal s0_axi_rdata: std_ulogic_vector(31 downto 0);
    signal s0_axi_rresp: std_ulogic_vector(1 downto 0);
    signal s0_axi_rvalid: std_ulogic;
    signal s0_axi_rready: std_ulogic;
    signal s0_axi_bresp: std_ulogic_vector(1 downto 0);
    signal s0_axi_bvalid: std_ulogic;
    signal s0_axi_bready: std_ulogic;
    signal m0_axi_araddr: std_ulogic_vector(31 downto 0);
    signal m0_axi_arvalid: std_ulogic;
    signal m0_axi_arready: std_ulogic;
    signal m0_axi_awaddr: std_ulogic_vector(31 downto 0);
    signal m0_axi_awvalid: std_ulogic;
    signal m0_axi_awready: std_ulogic;
    signal m0_axi_wdata: std_ulogic_vector(31 downto 0);
    signal m0_axi_wstrb: std_ulogic_vector(3 downto 0);
    signal m0_axi_wvalid: std_ulogic;
    signal m0_axi_wready: std_ulogic;
    signal m0_axi_rdata: std_ulogic_vector(31 downto 0);
    signal m0_axi_rresp: std_ulogic_vector(1 downto 0);
    signal m0_axi_rvalid: std_ulogic;
    signal m0_axi_rready: std_ulogic;
    signal m0_axi_bresp: std_ulogic_vector(1 downto 0);
    signal m0_axi_bvalid: std_ulogic;
    signal m0_axi_bready: std_ulogic;
    signal irq: std_ulogic;
    signal sw: std_ulogic_vector(3 downto 0);
    signal btn: std_ulogic_vector(3 downto 0);
    signal led: std_ulogic_vector(3 downto 0);

    procedure s0_axi_write(addr: in natural range 0 to 64; data: in std_ulogic_vector(31 downto 0);
                           signal awvalid: out std_ulogic;
                           signal wvalid: out std_ulogic;
                           signal wdata: out std_ulogic_vector(31 downto 0);
                           signal awaddr: out std_ulogic_vector(11 downto 0)) is
    begin
        awvalid <= '1';
        wvalid  <= '1';
        wdata   <= data;
        awaddr  <= to_stdulogicvector(addr, 12);
        wait until rising_edge(aclk) and (s0_axi_awready = '1' or s0_axi_wready = '1');
        if s0_axi_awready = '0' then
            wvalid  <= '0';
            wait until rising_edge(aclk) and s0_axi_awready = '1';
        elsif s0_axi_wready = '0' then
            awvalid  <= '0';
            wait until rising_edge(aclk) and s0_axi_wready = '1';
        end if;
        awvalid <= '0';
        wvalid  <= '0';
    end procedure s0_axi_write;

    procedure s0_axi_read(addr: in natural range 0 to 64; data: out std_ulogic_vector(31 downto 0);
                          signal arvalid: out std_ulogic;
                          signal araddr: out std_ulogic_vector(11 downto 0)) is
    begin
        arvalid <= '1';
        araddr  <= to_stdulogicvector(addr, 12);
        wait until rising_edge(aclk) and s0_axi_arready = '1';
        arvalid <= '0';
        data := s0_axi_rdata;
    end procedure s0_axi_read;

begin

    crypto: entity work.crypto(rtl)
    port map(
        aclk           => aclk,
        aresetn        => aresetn,
        s0_axi_araddr  => s0_axi_araddr,
        s0_axi_arvalid => s0_axi_arvalid,
        s0_axi_arready => s0_axi_arready,
        s0_axi_awaddr  => s0_axi_awaddr,
        s0_axi_awvalid => s0_axi_awvalid,
        s0_axi_awready => s0_axi_awready,
        s0_axi_wdata   => s0_axi_wdata,
        s0_axi_wstrb   => s0_axi_wstrb,
        s0_axi_wvalid  => s0_axi_wvalid,
        s0_axi_wready  => s0_axi_wready,
        s0_axi_rdata   => s0_axi_rdata,
        s0_axi_rresp   => s0_axi_rresp,
        s0_axi_rvalid  => s0_axi_rvalid,
        s0_axi_rready  => s0_axi_rready,
        s0_axi_bresp   => s0_axi_bresp,
        s0_axi_bvalid  => s0_axi_bvalid,
        s0_axi_bready  => s0_axi_bready,
        m0_axi_araddr  => m0_axi_araddr,
        m0_axi_arvalid => m0_axi_arvalid,
        m0_axi_arready => m0_axi_arready,
        m0_axi_awaddr  => m0_axi_awaddr,
        m0_axi_awvalid => m0_axi_awvalid,
        m0_axi_awready => m0_axi_awready,
        m0_axi_wdata   => m0_axi_wdata,
        m0_axi_wstrb   => m0_axi_wstrb,
        m0_axi_wvalid  => m0_axi_wvalid,
        m0_axi_wready  => m0_axi_wready,
        m0_axi_rdata   => m0_axi_rdata,
        m0_axi_rresp   => m0_axi_rresp,
        m0_axi_rvalid  => m0_axi_rvalid,
        m0_axi_rready  => m0_axi_rready,
        m0_axi_bresp   => m0_axi_bresp,
        m0_axi_bvalid  => m0_axi_bvalid,
        m0_axi_bready  => m0_axi_bready,
        irq            => irq,
        sw             => sw,
        btn            => btn,
        led            => led
    );

    process
    begin
        aclk <= '0';
        wait for 1 ns;
        aclk <= '1';
        wait for 1 ns;
    end process;

    process
        variable data: std_ulogic_vector(31 downto 0);
    begin
        aresetn        <= '0';
        s0_axi_araddr  <= (others => '0');
        s0_axi_arvalid <= '0';
        s0_axi_awaddr  <= (others => '0');
        s0_axi_awvalid <= '0';
        s0_axi_wdata   <= (others => '0');
        s0_axi_wstrb   <= (others => '1');
        s0_axi_wvalid  <= '0';
        s0_axi_rready  <= '1';
        s0_axi_bready  <= '1';
        m0_axi_arready <= '0';
        m0_axi_awready <= '0';
        m0_axi_wready  <= '0';
        m0_axi_rdata   <= (others => '0');
        m0_axi_rresp   <= axi_resp_okay;
        m0_axi_rvalid  <= '0';
        m0_axi_bresp   <= axi_resp_okay;
        m0_axi_bvalid  <= '0';
        sw             <= (others => '0');
        btn            <= (others => '0');
        for i in 1 to 10 loop
            wait until rising_edge(aclk);
        end loop;
        aresetn <= '1';
        for i in 1 to 10 loop
            wait until rising_edge(aclk);
        end loop;
        s0_axi_write(11*4, x"00000006", s0_axi_awvalid, s0_axi_wvalid, s0_axi_wdata, s0_axi_awaddr);
        for i in 0 to 16 loop
            next when i = 11;
            s0_axi_write(i*4, to_stdulogicvector(i + 1, 32), s0_axi_awvalid, s0_axi_wvalid, s0_axi_wdata, s0_axi_awaddr);
        end loop;
        for i in 0 to 16 loop
            s0_axi_read(i*4, data, s0_axi_arvalid, s0_axi_araddr);
        end loop;
        finish;

    end process;

end architecture sim;

-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
