LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY HA IS
    PORT (
        A, B : IN BIT;
        S, C : OUT BIT
    );
END HA;

ARCHITECTURE HA_B OF HA IS

BEGIN
    PROCESS (A, B)
    BEGIN
        IF (A = B) THEN
            S <= '0';
        ELSE
            S <= '1';
        END IF;
    END PROCESS;
    PROCESS (A, B)
    BEGIN
        IF (A = '1' AND B = '1') THEN
            C <= '1';
        ELSE
            C <= '0';
        END IF;
    END PROCESS;
END HA_B;