library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder_3to8 is
    port (
        a : in std_logic_vector (2 downto 0);
        en : in std_logic;
        bcode : out std_logic_vector (7 downto 0));
end decoder_3to8;

architecture gate_level of decoder_3to8 is
    signal d_lsb, d_msb : std_logic_vector(3 downto 0);
    signal lsb_en : std_logic;
begin
    decoder_2to4_lsb : entity work.decoder_2to4(gate_level)
        port map(
            a => a(1 downto 0),
            en => lsb_en,
            bcode => d_lsb
        );
    decoder_2to4_msb : entity work.decoder_2to4(gate_level)
        port map(
            a => a(1 downto 0),
            en => a(2),
            bcode => d_msb
        );
    lsb_en <= not a(2);
    bcode <=
        d_msb & d_lsb when en = '1' else
        "00000000";

end gate_level;
