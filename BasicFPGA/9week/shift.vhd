LIBRARY library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY shift IS
    PORT (
        RESETN : IN std_logic;
        DATA_IN : IN std_logic;
        CLK : IN std_logic
        Q : BUFFER std_logic_vector(3 DOWNTO 0)
    );
END shift;

ARCHITECTURE shift_body OF shift IS

BEGIN
    PROCESS (RESETN, CLK)
    BEGIN
        IF RESETN = '1' THEN
            Q <= "0000";
        ELSIF CLK'event AND CLK = '1' THEN
            Q(3) <= DATA_IN;
            Q(2) <= Q(3);
            Q(1) <= Q(2);
            Q(0) <= Q(1);
        END IF;
    END PROCESS;
END ARCHITECTURE shift_body;