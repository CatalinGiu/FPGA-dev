library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity eq1 is
    port (
        i0 : in std_logic;
        i1 : in std_logic;
        eq : out std_logic);
end eq1;

architecture Behavioral of eq1 is
    signal p0, p1 : std_logic;
begin
    -- sum of two product terms
    eq <= p0 or p1;
    -- product terms
    p0 <= (not i0) and (not i1);
    p1 <= i0 and i1;
end Behavioral;
