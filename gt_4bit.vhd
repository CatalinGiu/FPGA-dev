library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity gt_4bit is
    port (
        a : in std_logic_vector (3 downto 0);
        b : in std_logic_vector (3 downto 0);
        agtb : out std_logic);
end gt_4bit;

architecture gate_level of gt_4bit is
    signal msb, lsb, msb_bgta : std_logic;
    signal e0 : std_logic;
begin
    -- instantiate two 1-bit comparators
    gt_msb_unit : entity work.gt_2bit(gate_level)
        port map(
            a => a(3 downto 2),
            b => b(3 downto 2),
            agtb => msb
        );

    gt_lsb_unit : entity work.gt_2bit(gate_level)
        port map(
            a => a(1 downto 0),
            b => b(1 downto 0),
            agtb => lsb
        );

    gt_msb_bgta_unit : entity work.gt_2bit(gate_level)
        port map(
            a => b(3 downto 2),
            b => a(3 downto 2),
            agtb => msb_bgta
        );

    e0 <= lsb and (not msb_bgta);
    agtb <= msb or e0;

end gate_level;
