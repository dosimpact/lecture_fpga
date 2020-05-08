library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- 반가산기 코드

entity CLASS_32160462_FA is
	port(
		X,Y,CIN: in std_logic;
		S,COUT: out std_logic
	);
end CLASS_32160462_FA;


architecture FA_A of CLASS_32160462_FA is
	component CLASS_32160462_HA is
		port(
			X,Y : in std_logic;
			S,C : out std_logic
		);
	end component;
	
	signal REG_FA_C1, REG_FA_C2 : std_logic;
	signal REG_FA_SUM : std_logic;
	
begin

	U1_HA : CLASS_32160462_HA
	port map(
		X=> X,
		Y=> Y,
		S=> REG_FA_SUM,
		C=> REG_FA_C1
	);
	U2_HA : CLASS_32160462_HA
	port map(
		X=> CIN,
		Y=> REG_FA_SUM,
		S=> S,
		C=> REG_FA_C2
	);
	COUT <= REG_FA_C1 or REG_FA_C2;

end FA_A;




