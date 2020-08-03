library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity rl_barrel_shifter is
    generic (N : integer := 8); -- default 8 bits
    port (
        a : in std_logic_vector(N - 1 downto 0);
        amount : in std_logic_vector(2 downto 0);
        dir : in std_logic; -- shift direction: 1 = left and 0 = right
        shifted_a : out std_logic_vector(N - 1 downto 0)
    );
end rl_barrel_shifter;

architecture arch of rl_barrel_shifter is
    signal s0, s1 : std_logic_vector(N - 1 downto 0);
    -- from https://groups.google.com/forum/#!msg/comp.lang.vhdl/eBZQXrw2Ngk/4H7oL8hdHMcJ
    function reverse_any_vector (a : in std_logic_vector)
        return std_logic_vector is
        variable result : std_logic_vector(a'REVERSE_RANGE);
    begin
        for i in a'range loop
            result(i) := a(i);
        end loop;
        return result;
    end; -- function reverse_any_vector
begin
    s0 <= reverse_any_vector(a) when dir = '1' else a;
    shift_unit : entity work.right_barrel_shifter(arch)
        generic map(N => N)
        port map(
            a => s0,
            amount => amount,
            shifted_a => s1);
    shifted_a <= reverse_any_vector(s1) when dir = '1' else s1;
end;
