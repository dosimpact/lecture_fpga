LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY sync_counter IS
    PORT (
        RESETN, CLK : IN std_logic;
        Q : BUFFER std_logic_vector(3 DOWNTO 0)
    );
END sync_counter;

ARCHITECTURE sync_counter_B OF sync_counter IS
    SIGNAL REG_Q : std_logic_vector(3 DOWNTO 0);
BEGIN
    PROCESS (CLK, RESETN)
    BEGIN
        IF RESETN = '1' THEN
            REG_Q <= "000";
        ELSIF (CLK'event AND CLK = '0') THEN
            IF REG_Q >= "111" THEN
                REG_Q <= "000";
            ELSE
                REG_Q <= REG_Q + 1;
            END IF;
        END IF;
    END PROCESS;
    Q <= REG_Q;
END sync_counter_B;