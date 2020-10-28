LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

-- MUX 2 TO 1

ENTITY mux2to1 IS
	PORT (
		i0, i1, s : IN std_logic;
		z : OUT std_logic
	);
END mux2to1;
ARCHITECTURE B_mux2to1 OF mux2to1 IS
BEGIN

	PROCESS (i0, i1, s)
		CASE s IS
			WHEN '0' =>
				z <= i0;
			WHEN '1' =>
				z <= i1;
			WHEN OTHERS =>
				NULL;
		END CASE;
	END PROCESS;

END B_mux2to1;