library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder_2to4 is
    port (
        a : in std_logic_vector (1 downto 0);
        en : in std_logic;
        bcode : out std_logic_vector (3 downto 0));
end decoder_2to4;

architecture gate_level of decoder_2to4 is
begin
    bcode(0) <= en and (not a(1)) and (not a(0));
    bcode(1) <= en and (not a(1)) and a(0);
    bcode(2) <= en and a(1) and (not a(0));
    bcode(3) <= en and a(1) and a(0);
end gate_level;
