LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY JKFF IS
    PORT (
        J, K, CLK : IN std_logic;
        Q : BUFFER std_logic
    );
END JKFF;

ARCHITECTURE JKFF_B OF JKFF IS

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
END JKFF_B;