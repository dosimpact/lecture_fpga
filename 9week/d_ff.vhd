LIBRARY library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY d_ff IS
    PORT (
        D : IN std_logic;
        CLK : IN std_logic;
        Q : BUFFER std_logic
    );
END d_ff;

ARCHITECTURE d_ff_body OF d_ff IS

BEGIN
    PROCESS (CLK)
    BEGIN
        IF CLK'event AND CLK = '1' THEN
            Q <= D;
        END IF;
    END PROCESS;
END ARCHITECTURE d_ff_body;