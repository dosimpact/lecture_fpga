library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- MUX 2 TO 1

entity demux1to8 is
	port(
		i : in std_logic;
		s : in std_logic_vector(2 downto 0);
		o : out std_logic_vector(7 downto 0);
	);
end demux1to8;


architecture B_demux1to8 of demux1to8 is
begin

o(0) <= i when s="000" else '0';
o(1) <= i when s="001" else '0';
o(2) <= i when s="010" else '0';
o(3) <= i when s="011" else '0';
o(4) <= i when s="100" else '0';
o(5) <= i when s="101" else '0';
o(6) <= i when s="110" else '0';
o(7) <= i when s="111" else '0';

end B_demux1to8;




