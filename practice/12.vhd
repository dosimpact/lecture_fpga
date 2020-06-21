LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY DFF IS
    PORT (
        D, CLK : IN std_logic;
        Q : BUFFER std_logic
    );
END DFF;

ARCHITECTURE DFF_B OF DFF IS

BEGIN
    PROCESS (CLK)
    BEGIN
        IF CLK'event AND CLK = '1' THEN
            Q <= D;
        END IF;
    END PROCESS;
END DFF_B;