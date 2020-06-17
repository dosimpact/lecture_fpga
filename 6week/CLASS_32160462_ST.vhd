library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- 반가산기 코드

entity CLASS_32160462_ST is
	port(
		X,Y : in std_logic_vector(3 downto 0);
		M : in std_logic;
		S : out std_logic_vector(3 downto 0);
		COUT: out std_logic
	);
end CLASS_32160462_ST;


architecture ST_A of CLASS_32160462_ST is

	component CLASS_32160462_FA is
		port(
			X,Y,CIN:in std_logic;
			S,COUT:out std_logic
		);
	end component;
	
	signal REG_C : std_logic_vector(3 downto 0);
	signal REG_Y : std_logic_vector(3 downto 0);
	signal REG_SUM : std_logic_vector(3 downto 0);

begin

	REG_Y(0) <= Y(0) XOR M;
	REG_Y(1) <= Y(1) XOR M;
	REG_Y(2) <= Y(2) XOR M;
	REG_Y(3) <= Y(3) XOR M;
	
	
	U1_FA : CLASS_32160462_FA
	port map(
		X => X(0),
		Y => REG_Y(0),
		CIN => M,
		S => REG_SUM(0),
		COUT => REG_C(0)
	);
	
	U2_FA : CLASS_32160462_FA
	port map(
		X => X(1),
		Y => REG_Y(1),
		CIN => REG_SUM(0),
		S => REG_SUM(1),
		COUT => REG_C(1)
	);
	
	U3_FA : CLASS_32160462_FA
	port map(
		X => X(2),
		Y => REG_Y(2),
		CIN => REG_SUM(1),
		S => REG_SUM(2),
		COUT => REG_C(2)
	);
	
	U4_FA : CLASS_32160462_FA
	port map(
		X => X(3),
		Y => REG_Y(3),
		CIN => REG_SUM(2),
		S => REG_SUM(3),
		COUT => REG_C(3)
	);
	
	S(0) <= REG_SUM(0);
	S(1) <= REG_SUM(1);
	S(2) <= REG_SUM(2);
	S(3) <= REG_SUM(3);
	COUT <= REG_C(3);


end ST_A;








