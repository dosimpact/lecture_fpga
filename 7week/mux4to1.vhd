library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- MUX 4 TO 1

entity mux4to1 is
	port(
		i :in std_logic_vector(3 downto 0);
		s :in std_logic_vector(1 downto 0);
		z :out std_logic
	);
end mux4to1;


architecture B_mux4to1 of mux4to1 is
begin

process(i,s)
	case s is
		when "00"=>
			z<=i(0);
		when "01"=>
			z<=i(1);
		when "10"=>
			z<=i(2);
		when "11"=>
			z<=i(3);			
		when others =>
			null;
	end case;
end process;

end B_mux4to1;




