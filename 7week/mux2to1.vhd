library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- MUX 2 TO 1

entity mux2to1 is
	port(
		i0,i1,s:in std_logic;
		z :out std_logic
	);
end mux2to1;


architecture B_mux2to1 of mux2to1 is
begin

process(i0,i1,s)
	case s is
		when '0'=>
			z<=i0;
		when '1'=>
			z<=i1;
		when others =>
			null;
	end case;
end process;

end B_mux2to1;




