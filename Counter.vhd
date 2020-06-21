LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY counter IS
	PORT (
		clk : IN std_logic;
		reset : IN std_logic;
		enable : IN std_logic;
		count : OUT std_logic_vector(3 DOWNTO 0)
	);
END counter;
ARCHITECTURE behav OF counter IS
	SIGNAL pre_count : std_logic_vector(3 DOWNTO 0);
BEGIN
	PROCESS (clk, enable, reset)
	BEGIN
		IF reset = '1' THEN
			pre_count <= "0000";
		ELSIF (clk = '1' AND clk'event) THEN
			IF enable = '1' THEN
				pre_count <= pre_count + "1";
			END IF;
		END IF
	END PROCESS;
	count <= pre_count;
END behave