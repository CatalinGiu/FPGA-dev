library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity right_barrel_shifter is
    generic (N : integer := 8); -- block register size
    port (
        a : in std_logic_vector(N - 1 downto 0);
        amount : in std_logic_vector(2 downto 0);
        shifted_a : out std_logic_vector(N - 1 downto 0)
    );
end right_barrel_shifter;

architecture arch of right_barrel_shifter is
    signal s0, s1 : std_logic_vector(N - 1 downto 0);
begin
    s0 <= a(0) & a(N - 1 downto 1) when amount(0) = '1' else a;
    s1 <= s0(1 downto 0) & s0(N - 1 downto 2) when amount(1) = '1' else s0;
    shifted_a <= s1(3 downto 0) & s1(N - 1 downto 4) when amount(2) = '1' else s1;
end arch; -- arch
