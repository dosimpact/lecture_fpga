library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- 반가산기 코드

entity half_adder is
	port(
		X,Y: in std_logic;
		S,C: out std_logic
	);
end half_adder;

architecture HA_A of half_adder is

begin

	process(X,Y)
	begin
		if X = Y then
			S <= '0';
		else
			S <= '1';
		end if;
	end process;


	process(X,Y)
	begin
		if X = '1' and Y = '1' then
			C <= '1';
		else
			C <= '0';
		end if;
	end process;

end HA_A;
