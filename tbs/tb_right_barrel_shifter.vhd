library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity right_barrel_shifter_tb is
end;

architecture bench of right_barrel_shifter_tb is

    component right_barrel_shifter
        generic (N : integer := 8);
        port (
            a : in std_logic_vector(N - 1 downto 0);
            amount : in std_logic_vector(2 downto 0);
            shifted_a : out std_logic_vector(N - 1 downto 0)
        );
    end component;

    signal a : std_logic_vector(7 downto 0);
    signal amount : std_logic_vector(2 downto 0);
    signal shifted_a : std_logic_vector(7 downto 0);

begin

    uut : right_barrel_shifter generic map(N => 8)
    port map(
        a => a,
        amount => amount,
        shifted_a => shifted_a);

    stimulus : process
    begin

        for i in 0 to 255 loop
            for j in 0 to 7 loop
                a <= std_logic_vector(to_unsigned(i, a'length));
                amount <= std_logic_vector(to_unsigned(j, amount'length));
                wait for 10ns;
            end loop;
        end loop;
        a <= "00000000";
        amount <= "000";

        wait;
    end process;
end;
