library ieee;
use ieee.std_logic_1164.all;

use work.crypto_pkg.all;

entity crypto_bench is
    generic(
        p_val: w128 := x"0123456789ABCDEFFEDCBA9876543210";
        key_val: w128 := x"0123456789ABCDEFFEDCBA9876543210";
        c_val: w128 := x"681EDF34D206965E86B3E94F536E4246"
    );
end entity crypto_bench;

architecture bench of crypto_bench is

    signal clk: std_ulogic;
    signal sresetn: std_ulogic;
    signal go: std_ulogic;
    signal key: w128;
    signal p: w128;
    signal done: std_ulogic;
    signal c: w128;

begin


    clock0: process
    begin
        clk <= '0';
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
    end process;

    crypto_test0: entity work.crypto_engine(rtl)
        port map(
            clk => clk,
            sresetn => sresetn,
            go => go,
            key => key,
            p => p,
            done => done,
            c => c
        );

    bench0: process
    begin
        -- Reset crypto engine
        sresetn <= '0';
        go <= '0';
        for i in 1 to 10 loop
            wait until rising_edge(clk);
        end loop;

        sresetn <= '1';
        wait until rising_edge(clk);

        -- Loading values for encryption:
        key <= key_val;
        p <= p_val;
        wait until rising_edge(clk);

        -- Encryption test:
        go <= '1';
        wait until rising_edge(clk);
        go <= '0';
        wait until done = '1' and rising_edge(clk);

        for i in 1 to 10 loop
            wait until rising_edge(clk);
        end loop;

        assert c = c_val report "Encryption went wrong: ciphertext not matching expected one" severity failure;

        go <= '1';
        wait until rising_edge(clk);
        go <= '0';
        wait until done = '1' and rising_edge(clk);

        for i in 1 to 10 loop
            wait until rising_edge(clk);
        end loop;

        assert c = c_val report "Encryption went wrong: ciphertext not matching expected one" severity failure;


    end process;

end architecture bench;
