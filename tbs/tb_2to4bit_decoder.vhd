library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity decoder_2to4_tb is
end;

architecture bench of decoder_2to4_tb is

    component decoder_2to4
        port (
            a : in std_logic_vector (1 downto 0);
            en : in std_logic;
            bcode : out std_logic_vector (3 downto 0));
    end component;

    signal a : std_logic_vector (1 downto 0);
    signal en : std_logic;
    signal bcode : std_logic_vector (3 downto 0);

begin

    uut : decoder_2to4 port map(
        a => a,
        en => en,
        bcode => bcode);

    stimulus : process
    begin
        for i in std_logic range '0' to '1' loop
            for j in 0 to 3 loop
                en <= i;
                a <= std_logic_vector(to_unsigned(j, a'length));
                wait for 10ns;
            end loop;
        end loop;
        a <= "00";
        en <= '0';
        wait;
    end process;
end;
