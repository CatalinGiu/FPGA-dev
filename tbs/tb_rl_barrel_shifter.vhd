-- right and left barrel shifter test bench
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity rl_barrel_shifter_tb is
end;

architecture bench of rl_barrel_shifter_tb is

    component rl_barrel_shifter
        generic (N : integer := 8);
        port (
            a : in std_logic_vector(N - 1 downto 0);
            amount : in std_logic_vector(2 downto 0);
            dir : in std_logic;
            shifted_a : out std_logic_vector(N - 1 downto 0)
        );
    end component;

    signal a : std_logic_vector(7 downto 0);
    signal amount : std_logic_vector(2 downto 0);
    signal dir : std_logic;
    signal shifted_a : std_logic_vector(7 downto 0);

begin

    -- Insert values for generic parameters !!
    uut : rl_barrel_shifter generic map(N => 8)
    port map(
        a => a,
        amount => amount,
        dir => dir,
        shifted_a => shifted_a);

    stimulus : process
    begin
        for i in 0 to 255 loop
            for j in std_logic range '0' to '1' loop
                for k in 0 to 7 loop
                    a <= std_logic_vector(to_unsigned(i, a'length));
                    amount <= std_logic_vector(to_unsigned(k, amount'length));
                    dir <= j;
                    wait for 10ns;
                end loop;
            end loop;
        end loop;
        a <= "00000000";
        amount <= "000";
        dir <= '0';
        wait;
    end process;
end;
