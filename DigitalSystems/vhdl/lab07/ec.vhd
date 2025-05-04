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
use ieee.numeric_std.all;

entity ec is
    port(
        clk:      in  std_ulogic;
        areset:   in  std_ulogic;
        btn:      in  std_ulogic;
        led:      out std_ulogic_vector(3 downto 0)
    );
end entity ec;

architecture rtl of ec is

    -- max counter value
    constant cmax: natural := 15;

    -- parallel output of reset resynchronizer
    signal sync:          std_ulogic_vector(1 downto 0);
    -- synchronous active low reset
    alias  sresetn:       std_ulogic is sync(1);
    -- counter value
    signal c:             natural range 0 to cmax;
    -- counter force-to-zero
    signal cz:            std_ulogic;
    -- edge detector outputs
    signal re:            std_ulogic;
    signal fe:            std_ulogic;

begin

    -- 2-stages resynchronizer for reset
    sr2: entity work.sr(rtl)
    generic map(n => 2)
    port map(
        clk     => clk,
        sresetn => '1',
        shift   => '1',
        din     => not areset,
        dout    => sync
    );

    -- edge
    edge0: entity work.edge(rtl)
    port map(
        clk     => clk,
        sresetn => sresetn,
        data_in => btn,
        re      => re,
        fe      => fe
    );

    -- counter zero
    cz <= '1' when c = cmax and (re = '1' or fe = '1') else '0';

    counter0: entity work.counter(rtl)
    generic map(
        cmax => cmax
    )
    port map(
        clk     => clk,
        sresetn => sresetn,
        cz      => cz,
        inc     => re or fe,
        c       => c
    );

    led <= std_ulogic_vector(to_unsigned(c, 4));

end architecture rtl;

-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
