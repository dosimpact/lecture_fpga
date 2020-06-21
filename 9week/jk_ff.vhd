LIBRARY library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY jk_ff IS
    PORT (
        J, K : IN std_logic;
        CLK : IN std_logic;
        Q : BUFFER std_logic
    );
END jk_ff;

ARCHITECTURE jk_ff_body OF jk_ff IS

BEGIN
    PROCESS (CLK)
    BEGIN
        IF CLK'event AND CLK = '1' THEN
            IF J = '0' AND K = '0' THEN
                Q <= Q;
            ELSIF J = '1' AND K = '0' THEN
                Q <= '1';
            ELSIF J = '0' AND K = '1' THEN
                Q <= '0';
            ELSE
                Q <= NOT Q;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE jk_ff_body;