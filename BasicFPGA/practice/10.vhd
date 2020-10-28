LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;
ENTITY srff IS
    PORT (
        S, R : IN std_logic;
        CLK : IN std_logic;
        Q : BUFFER std_logic
    );
END srff;

ARCHITECTURE srff_B OF srff IS

BEGIN
    PROCESS (CLK)
    BEGIN
        IF CLK'event AND CLK = '1' THEN
            IF S = '0' AND R = '0' THEN
                Q <= Q;
            ELSIF S = '0' AND R = '1' THEN
                Q <= '0';
            ELSIF S = '1' AND R = '0' THEN
                Q <= '1';
            ELSE
                NULL;
            END IF;
        END IF;
    END PROCESS;

END srff_B;