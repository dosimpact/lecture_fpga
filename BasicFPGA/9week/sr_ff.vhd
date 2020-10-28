LIBRARY library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY sr_ff IS
    PORT (
        S, R : IN std_logic;
        CLK : IN std_logic;
        Q : BUFFER std_logic
    );
END sr_ff;

ARCHITECTURE sr_ff_body OF sr_ff IS

BEGIN
    PROCESS (CLK)
    BEGIN
        IF CLK'event AND CLK = '1' THEN
            IF S = '0' AND R = '0' THEN
                Q <= Q;
            ELSIF S = '1' AND R = '0' THEN
                Q <= '1';
            ELSIF S = '0' AND R = '1' THEN
                Q <= '0';
            ELSE
                NULL;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE sr_ff_body;