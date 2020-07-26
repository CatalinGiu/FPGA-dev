library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity eq1_tb is
end;

architecture bench of eq1_tb is

  component eq1
    port (
      i0 : in std_logic;
      i1 : in std_logic;
      eq : out std_logic);
  end component;

  signal i0, i1 : std_logic;
  signal eq : std_logic;

begin

  uut : eq1 port map(
    i0 => i0,
    i1 => i1,
    eq => eq);

  stimulus : process
  begin

    -- Put initialisation code here
    i0 <= '0';
    i1 <= '0';
    wait for 10 ns;

    i0 <= '0';
    i1 <= '1';
    wait for 10 ns;

    i0 <= '1';
    i1 <= '0';
    wait for 10 ns;

    i0 <= '1';
    i1 <= '1';
    wait for 10 ns;

    i0 <= '0';
    i1 <= '0';
    wait;
  end process;
end;
