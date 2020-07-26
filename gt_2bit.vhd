library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity gt_2bit is
    port (
        a : in std_logic_vector (1 downto 0);
        b : in std_logic_vector (1 downto 0);
        agtb : out std_logic);
end gt_2bit;
architecture gate_level of gt_2bit is
    signal e0, e1, e2 : std_logic;
begin
    -- A1B1' + A1B1'B0' + A1A0B1B0'
    -- sum of products
    agtb <= e0 or e1 or e2;
    -- product terms
    e0 <= a(1) and (not b(1));
    e1 <= a(0) and (not b(1)) and (not b(0));
    e2 <= a(1) and a(0) and b(1) and (not b(0));
end gate_level;
