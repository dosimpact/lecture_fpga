LIBRARY library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY sync_counter IS
    PORT (
        CLK : IN std_logic;
        resetn : IN std_logic;
        Q : OUT std_logic_vector(2 DOWNTO 0)
    );
END sync_counter;

ARCHITECTURE sync_counter_body OF sync_counter IS
    SIGNAL reg : std_logic_vector(2 DOWNTO 0)
BEGIN
    PROCESS (clk, resetn)
    BEGIN
        IF resetn = '1'THEN
            reg <= "000";
        ELSIF (CLK'event AND CLK = '1') THEN
            IF reg >= "111" THEN
                reg <= "000";
            ELSE
                reg <= reg + 1;
            END IF
        END IF
    END PROCESS
END ARCHITECTURE sync_counter_body;