library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lb is
    generic (
        f_mhz    : positive := 100;        -- Clock frequency in MHz
        delay_us : positive := 10          -- Delay in microseconds
    );
    port (
        clk     : in  std_ulogic;          -- Master clock
        areset  : in  std_ulogic;          -- Asynchronous reset (active high)
        led     : out std_ulogic_vector(3 downto 0) -- 4 user LEDs
    );
end entity lb;

architecture rtl of lb is

    -- parallel output of reset resynchronizer
    signal sync:          std_ulogic_vector(1 downto 0);
    -- synchronous active low reset
    alias  sresetn:       std_ulogic is sync(1);
    -- timer output
    signal t:             natural range 0 to delay_us;
    -- set to '1' when timer reaches delay_us
    signal t_eq_delay_us: std_ulogic;
    -- serial input of 4-bits shift register
    signal sr4_in:        std_ulogic;

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

    -- timer
    timer0: entity work.timer(rtl)
    generic map(
        f_mhz  => f_mhz,
        max_us => delay_us
    )
    port map(
        clk     => clk,
        sresetn => sresetn,
        tz      => t_eq_delay_us,
        t       => t
    );

    -- delay_us detector
    t_eq_delay_us <= '1' when t = delay_us else '0';

    -- 2-inputs multiplexer
    sr4_in <= led(3) when or led = '1' else '1';

    -- 4-bits shift register
    sr4: entity work.sr(rtl)
    generic map(n => 4)
    port map(
        clk     => clk,
        sresetn => sresetn,
        shift   => t_eq_delay_us,
        din     => sr4_in,
        dout    => led
    );

end architecture rtl;
