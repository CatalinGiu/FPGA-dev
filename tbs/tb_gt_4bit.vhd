library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity gt_4bit_tb is
end;

architecture bench of gt_4bit_tb is

    component gt_4bit
        port (
            a : in std_logic_vector (3 downto 0);
            b : in std_logic_vector (3 downto 0);
            agtb : out std_logic);
    end component;

    signal a : std_logic_vector (3 downto 0);
    signal b : std_logic_vector (3 downto 0);
    signal agtb : std_logic;

begin

    uut : gt_4bit port map(
        a => a,
        b => b,
        agtb => agtb);

    stimulus : process
    begin

        for i in 0 to 15 loop
            for j in 0 to 15 loop
                a <= std_logic_vector(to_unsigned(i, a'length));
                b <= std_logic_vector(to_unsigned(j, b'length));
                wait for 10ns;
            end loop;
        end loop;
        a <= "0000";
        b <= "0000";

        wait;
    end process;
end;
