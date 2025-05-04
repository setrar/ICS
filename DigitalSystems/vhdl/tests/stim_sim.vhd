-- stim_sim.vhd
use std.textio.all; -- for the text file I/O (readline, read...)

library ieee;
use ieee.std_logic_1164.all;

entity stim_sim is
end entity stim_sim;

architecture sim of stim_sim is

    -- input-output signals of design
    signal stim_in, stim_out: std_ulogic_vector(31 downto 0);

begin

    -- instantiation of design to simulate
    u0: entity work.stim(rtl)
    port map(
        stim_in   => stim_in,  -- 32-bits input
        stim_out  => stim_out  -- 32-bits output
    );

    -- input stimulus and output checking process
    process
        variable l: line; -- type line is declared in std.textio
        file f: text;     -- file type text is declared in std.textio
        variable vin:  std_ulogic_vector(31 downto 0); -- temporary variable to read inputs
        variable vout: std_ulogic_vector(31 downto 0); -- temporary variable to read outputs
    begin
        file_open(f, "stim.txt", read_mode); -- open text file stim.txt in read mode
        while not endfile(f) loop -- while not end of file (for all test vectors)
            readline(f, l);       -- read line
            hread(l, vin);  -- read 32-bits input in hex format
            hread(l, vout); -- read 32-bits expected output in hex format
            stim_in <= vin; -- set 32-bits input
            wait for 1 ns;  -- let output propagate
            assert stim_out = vout -- check output
                report "ERROR: EXPECTED " & to_hstring(vout) & " GOT " & to_hstring(stim_out)
                severity failure;
        end loop;
        wait; -- end of simulation
    end process;

end architecture sim;

-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
