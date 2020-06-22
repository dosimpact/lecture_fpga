LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY MA_SYSTEM IS
    PORT (
        X, RESETN : IN BIT;
        Y : OUT bit_vector(1 DOWNTO 0)
    );
END MA_SYSTEM;

ARCHITECTURE MA_SYSTEM_B OF MA_SYSTEM IS
    TYPE STATE_TYPE IS (s0, s1);
    SIGNAL STATE, NEXT_STATE : STATE_TYPE;
BEGIN
    PROCESS (X, RESETN)
    BEGIN
        IF RESETN = '1' THEN
            STATE <= s0;
        ELSIF X'event AND X = '1' THEN
            CASE STATE IS
                WHEN s0 => NEXT_STATE <= s1;
                WHEN s1 => NEXT_STATE <= s0;
                WHEN OTHERS => NEXT_STATE <= s0;
            END CASE
        END IF;
    END PROCESS;
    STATE <= NEXT_STATE;
    PROCESS (STATE, X)
    BEGIN
        IF RESETN = '1' THEN
            Y <= "00";
        ELSE
            IF X = '1' AND STATE = s0 THEN
                Y <= "10";
            ELSIF X = '1' AND state = s1 THEN
                Y <= "01";
            ELSE
                Y <= "00";
            END IF;
        END IF;
    END PROCESS;
END MA_SYSTEM;