LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

-- 곱셈기 코드

ENTITY multi IS
	PORT (
		A, B : IN std_logic_vector(1 DOWNTO 0);
		C : OUT std_logic_vector(3 DOWNTO 0);
	);
END multi;
ARCHITECTURE B_multi OF multi IS

	COMPONENT half_adder IS
		PORT (
			X, Y : IN std_logic;
			S, C : OUT std_logic
		);
	END COMPONENT;

	SIGNAL REG_AND : std_logic_vector(3 DOWNTO 0);
	SIGNAL REG_C : std_logic_vector(3 DOWNTO 0);
	SIGNAL REG_SUM : std_logic;

BEGIN

	REG_AND(0) <= A(0) AND B(0);
	REG_AND(1) <= A(0) AND B(1);
	REG_AND(2) <= A(1) AND B(0);
	REG_AND(3) <= A(1) AND B(1);
	U1_HA : half_adder
	PORT MAP(
		X => REG_AND(0),
		Y => REG_AND(1),
		C => REG_SUM,
		S => REG_C(1)
	);

	U2_HA : half_adder
	PORT MAP(
		X => REG_SUM,
		Y => REG_AND(2),
		C => REG_C(3),
		S => REG_C(2)
	);

	REG_C(0) <= REG_AND(3)
	C <= REG_C;
END B_multi;