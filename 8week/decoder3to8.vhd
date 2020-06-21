LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

-- decoder3to8

ENTITY decoder3to8 IS
	PORT (
		X : IN std_logic_vector(2 DOWNTO 0);
		Y : OUT std_logic_vector(7 DOWNTO 0);
	);
END decoder3to8;
ARCHITECTURE B_decoder3to8 OF decoder3to8 IS
	SIGNAL REG : std_logic_vector(2 DOWNTO 0);
BEGIN
	REG <= X(0) & X(1) & X(2);

	PROCESS (REG)
	BEGIN
		CASE REG IS
			WHEN "000" => Y <= "00000001";
			WHEN "001" => Y <= "00000010";
			WHEN "011" => Y <= "00000100";
			WHEN "100" => Y <= "00001000";
			WHEN "101" => Y <= "00010000";
			WHEN "110" => Y <= "00100000";
			WHEN "010" => Y <= "01000000";
			WHEN "111" => Y <= "10000000";
			WHEN OTHERS => NULL;
		END CASE;
	END PROCESS;
END B_decoder3to8;