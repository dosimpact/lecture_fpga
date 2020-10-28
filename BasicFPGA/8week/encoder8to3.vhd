LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

-- encoder3to8

ENTITY encoder8to3 IS
	PORT (
		X : IN std_logic_vector(7 DOWNTO 0);
		Y : OUT std_logic_vector(2 DOWNTO 0);
	);
END encoder8to3;
ARCHITECTURE B_encoder8to3 OF encoder8to3 IS
BEGIN
	PROCESS (X)
	BEGIN
		CASE X IS
			WHEN "00000001" => Y <= "000";
			WHEN "00000010" => Y <= "001";
			WHEN "00000100" => Y <= "011";
			WHEN "00001000" => Y <= "100";
			WHEN "00010000" => Y <= "101";
			WHEN "00100000" => Y <= "110";
			WHEN "01000000" => Y <= "010";
			WHEN "10000000" => Y <= "111";
			WHEN OTHERS => NULL;
		END CASE;
	END PROCESS;
END B_encoder8to3;