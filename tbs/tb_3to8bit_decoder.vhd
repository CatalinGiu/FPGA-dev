library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity decoder_3to8_tb is
end;

architecture bench of decoder_3to8_tb is

    component decoder_3to8
        port (
            a : in std_logic_vector (2 downto 0);
            en : in std_logic;
            bcode : out std_logic_vector (7 downto 0));
    end component;

    signal a : std_logic_vector (2 downto 0);
    signal en : std_logic;
    signal bcode : std_logic_vector (7 downto 0);

begin

    uut : decoder_3to8 port map(
        a => a,
        en => en,
        bcode => bcode);

    stimulus : process
    begin
        for i in std_logic range '0' to '1' loop
            for j in 0 to 7 loop
                en <= i;
                a <= std_logic_vector(to_unsigned(j, a'length));
                wait for 10ns;
            end loop;
        end loop;
        a <= "000";
        en <= '0';

        wait;
    end process;
end;
