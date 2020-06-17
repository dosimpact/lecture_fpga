library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- 곱셈기 코드

entity multi is
	port(
		A,B : in std_logic_vector(1 downto 0);
		C : out std_logic_vector(3 downto 0);
	);
end multi;


architecture B_multi of multi is

	component half_adder is
		port(
			X,Y: in std_logic;
			S,C: out std_logic
		);
	end component;
	
	signal REG_AND : std_logic_vector(3 downto 0);
	signal REG_C : std_logic_vector(3 downto 0);
	signal REG_SUM : std_logic;

begin

	REG_AND(0) <= A(0) AND B(0);
	REG_AND(1) <= A(0) AND B(1);
	REG_AND(2) <= A(1) AND B(0);
	REG_AND(3) <= A(1) AND B(1);
	
	
	U1_HA : half_adder
	port map(
		X => REG_AND(0),
		Y => REG_AND(1),
		C => REG_SUM,
		S => REG_C(2)
	);
	
	U2_HA : half_adder
	port map(
		X => REG_SUM,
		Y => REG_AND(2),
		C => REG_C(0),
		S => REG_C(1)
	);

	REG_C(3) <= REG_AND(3)
	C <= REG_C;


end B_multi;
