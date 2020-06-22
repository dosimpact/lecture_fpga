LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY MR_SYSTEM IS
    PORT (
        X, RESETN : IN BIT;
        Y : OUT bit_vector(1 DOWNTO 0)
    );
END MR_SYSTEM;

ARCHITECTURE MR_SYSTEM_B OF MR_SYSTEM IS
    TYPE STATE_TYPE IS (s0, s1, s2);
    SIGNAL STATE, NEXT_STATE : STATE_TYPE;
BEGIN
    PROCESS (X, RESETN)
    BEGIN
        IF RESETN = '1' THEN
            STATE <= s0;
        ELSIF X'event AND X = '1' THEN
            CASE STATE IS
                WHEN s0 => NEXT_STATE <= s1;
                WHEN s1 => NEXT_STATE <= s2;
                WHEN s2 => NEXT_STATE <= s0;
                WHEN OTHERS => NEXT_STATE <= s0;
            END CASE
        END IF;
    END PROCESS;
    STATE <= NEXT_STATE;
    PROCESS (STATE, Y)
    BEGIN
        IF RESETN = '1' THEN
            Y <= "00";
        ELSE
            CASE STATE IS
                WHEN s0 => Y <= "00";
                WHEN s1 => Y <= "01";
                WHEN s2 => Y <= "10";
                WHEN OTHERS => Y <= "11";
            END CASE;
        END IF;
    END PROCESS;
END MR_SYSTEM;