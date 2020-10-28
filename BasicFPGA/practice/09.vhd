LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY encoder IS
    PORT (
        X : IN std_logic_vector(7 DOWNTO 0);
        Y : OUT std_logic_vector(2 DOWNTO 0)
    );
END encoder;

ARCHITECTURE encoder_B OF encoder IS

BEGIN
    PROCESS (X)
    BEGIN
        CASE X IS
            WHEN "00000001" =>
                Y <= "000";
            WHEN "00000010" =>
                Y <= "001";
            WHEN "00000100" =>
                Y <= "010";
            WHEN "00001000" =>
                Y <= "011";
            WHEN "00010000" =>
                Y <= "100";
            WHEN "00100010" =>
                Y <= "101";
            WHEN "01000100" =>
                Y <= "110";
            WHEN "10001000" =>
                Y <= "111";
            WHEN OTHERS =>
                NULL;
        END CASE;
    END PROCESS
END encoder_B;