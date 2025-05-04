-- stim.vhd
library ieee;
use ieee.std_logic_1164.all;

entity stim is
    port(
        stim_in:   in  std_ulogic_vector(31 downto 0);
        stim_out:  out std_ulogic_vector(31 downto 0)
    );
end entity stim;

architecture rtl of stim is
begin
    stim_out  <= not stim_in;
end architecture rtl;

-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0:
