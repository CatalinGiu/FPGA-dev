library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity eq2_tb is
end;

architecture bench of eq2_tb is

    component eq2
        port (
            a : in std_logic_vector (1 downto 0);
            b : in std_logic_vector (1 downto 0);
            aeqb : out std_logic);
    end component;

    signal a : std_logic_vector (1 downto 0);
    signal b : std_logic_vector (1 downto 0);
    signal aeqb : std_logic;

begin

    uut : eq2 port map(
        a => a,
        b => b,
        aeqb => aeqb);

    stimulus : process
    begin

        for i in 0 to 3 loop
            for j in 0 to 3 loop
                a <= std_logic_vector(to_unsigned(i, a'length));
                b <= std_logic_vector(to_unsigned(j, b'length));
                wait for 10ns;
            end loop;
        end loop;
        a <= "00";
        b <= "00";
        wait;
    end process;
end;
