LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY ME_SYSTEM IS
    PORT (

        X, RESETN : IN std_logic;
        Y : OUT std_logic_vector(1 DOWNTO 0)
    );
END ME_SYSTEM;

ARCHITECTURE ME_SYSTEM_B OF ME_SYSTEM IS
    TYPE STATE_TYPE IS (s0, s1);
    SIGNAL STATE, NEXT_STATE : STATE_TYPE;
BEGIN
    PROCESS (RESETN, X)
    BEGIN
        IF RESETN = '1' THEN
            NEXT_STATE <= s0;
        ELSIF X'event AND X = '1' THEN
            CASE STATE IS
                WHEN s0 =>
                    NEXT_STATE <= s1;
                WHEN s1 =>
                    NEXT_STATE <= s0;
                WHEN OTHERS =>
                    NEXT_STATE <= s0;
            END CASE;
        END IF;
    END PROCESS;

    STATE <= NEXT_STATE;

    PROCESS (RESETN, STATE, X)
    BEGIN
        IF RESETN = '1' THEN
            Y <= "00";
        ELSIF STATE = s0 AND X = '1' THEN
            Y <= "10";
        ELSIF STATE = s1 AND X = '1' THEN
            Y <= "01";
        ELSE
            Y <= "00";
        END IF;
    END PROCESS;
END ME_SYSTEM_B;