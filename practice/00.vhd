LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY orgate IS
    PORT (
        A, B : IN BIT;
        O : OUT BIT
    );
END orgate;

ARCHITECTURE orgate_b OF orgate IS

BEGIN
    PROCESS (A, B)
    BEGIN
        IF A = '0' AND B = '0' THEN
            O <= '0';
        ELSE
            O <= '1';
        END IF;
    END PROCESS;
END orgate_b;