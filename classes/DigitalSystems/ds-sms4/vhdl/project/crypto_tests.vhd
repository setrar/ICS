library ieee;
use ieee.std_logic_1164.all;

use work.crypto_pkg.all;

entity crypto_tests is
  port(
    clk:     in  std_ulogic;
    sresetn: in  std_ulogic;
    shift:   in  std_ulogic;
    go:      in  std_ulogic;
    din:     in  std_ulogic;
    dout:    out std_ulogic
);
end entity crypto_tests;

architecture rtl of crypto_tests is

  signal done: std_ulogic;
  signal reg:  w256;
  signal c:    w128;

  alias p:   w128 is reg(255 downto 128);
  alias key: w128 is reg(127 downto 0);

begin

  dout <= reg(255);

  process(clk)
  begin
    if rising_edge(clk) then
      if shift = '1' then
        reg <= reg(254 downto 0) & din;
      end if;
      if done = '1' then
        p <= c;
      end if;
    end if;
  end process;

  u0: entity work.crypto_engine(rtl)
  port map(
    clk     => clk,
    sresetn => sresetn,
    go      => go,
    done    => done,
    key     => key,
    p       => p,
    c       => c
  );

end architecture rtl;

-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
