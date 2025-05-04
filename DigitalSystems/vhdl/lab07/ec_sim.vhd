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

entity ec_sim is
    generic(d: positive := 10000); -- Duration of test in clock cycles
end entity ec_sim;

use std.env.all;

library ieee;
use ieee.std_logic_1164.all;

library common;
use common.rnd_pkg.all;

architecture sim of ec_sim is

    signal clk:    std_ulogic;
    signal areset: std_ulogic;
    signal btn:    std_ulogic;
    signal led:    std_ulogic_vector(3 downto 0);

begin

    ec0: entity work.ec(rtl)
    port map(
        clk    => clk,
        areset => areset,
        btn    => btn,
        led    => led
    );

    process
    begin
        clk <= '0';
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
    end process;

    process
        variable r: rnd_generator;
    begin
        areset <= '1';
        btn    <= '0';
        for i in 1 to 10 loop
            wait until rising_edge(clk);
        end loop;
        areset <= '0';
        for i in 1 to d loop
            areset <= '1' when r.get_integer(1, 100) = 1 else '0';
            btn    <= r.get_std_ulogic;
            wait until rising_edge(clk);
        end loop;
        finish;
    end process;

end architecture sim;

-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
