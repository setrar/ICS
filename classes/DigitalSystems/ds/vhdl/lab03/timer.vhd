library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- For using unsigned arithmetic

entity timer is
    generic(
        f_mhz:  positive range 1 to 1000 := 100; -- Clock frequency in MHz
        max_us: natural := 10 -- Maximum duration in microseconds
    );
    port(
        clk:      in  std_ulogic;  -- Clock signal
        sresetn:  in  std_ulogic;  -- Synchronous reset, active low
        tz:       in  std_ulogic;  -- Timer control signal (assumed as start control)
        t:        out natural range 0 to max_us -- Timer value in microseconds
    );
end entity timer;

architecture rtl of timer is
    -- Constraining integer ranges is important: out of range errors can be
    -- raised during simulation (easier debugging) and logic synthesizers infer
    -- less hardware (smaller, faster, more power efficient results).
    signal cnt: natural range 0 to f_mhz - 1;

begin
    -- The synchronous process is a straightforward VHDL translation of the
    -- natural language specification.
    process(clk)
    begin
        if rising_edge(clk) then
            if sresetn = '0' or tz = '1' then
                cnt <= 0;
                t   <= 0;
            elsif t /= max_us then
                if cnt = f_mhz - 1 then
                    cnt <= 0;
                    t   <= t + 1;
                else
                    cnt <= cnt + 1;
                end if;
            end if;
        end if;
    end process;
end architecture rtl;

