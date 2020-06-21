LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY decoder IS
    PORT (
        X : IN std_logic_vector(2 DOWNTO 0);
        Y : OUT std_logic_vector(7 DOWNTO 0)
    );
END decoder;

ARCHITECTURE decoder_B OF decoder IS
BEGIN
    PROCESS (X)
    BEGIN
        CASE X IS
            WHEN "000" =>
                Y <= "00000001";
            WHEN "001" =>
                Y <= "00000010";
            WHEN "010" =>
                Y <= "00000100";
            WHEN "011" =>
                Y <= "00001000";
            WHEN "100" =>
                Y <= "00010000";
            WHEN "101" =>
                Y <= "00100000";
            WHEN "110" =>
                Y <= "01000000";
            WHEN "111" =>
                Y <= "10000000";
            WHEN OTHERS =>
                NULL;
        END CASE;
    END PROCESS;

END decoder_B;