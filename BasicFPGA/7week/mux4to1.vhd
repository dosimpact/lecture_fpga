LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

-- MUX 4 TO 1

ENTITY mux4to1 IS
	PORT (
		i : IN std_logic_vector(3 DOWNTO 0);
		s : IN std_logic_vector(1 DOWNTO 0);
		z : OUT std_logic
	);
END mux4to1;
ARCHITECTURE B_mux4to1 OF mux4to1 IS
BEGIN
	PROCESS (i, s)
		CASE s IS
			WHEN "00" =>
				z <= i(0);
			WHEN "01" =>
				z <= i(1);
			WHEN "10" =>
				z <= i(2);
			WHEN "11" =>
				z <= i(3);
			WHEN OTHERS =>
				NULL;
		END CASE;
	END PROCESS;

END B_mux4to1;