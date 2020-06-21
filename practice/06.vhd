LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY mux4to1 IS
    PORT (
        i0, i1, i2, i3 : IN std_logic;
        s : IN std_logic_vector(1 DOWNTO 0);
        z : OUT std_logic
    );
END mux4to1;

ARCHITECTURE mux4to1_B OF mux4to1 IS

BEGIN
    PROCESS (s)
    BEGIN
        CASE s IS
            WHEN "00" =>
                z <= i0;
            WHEN "01" =>
                z <= i1;
            WHEN "10" =>
                z <= i2;
            WHEN "1" =>
                z <= i3;
            WHEN OTHERS =>
                NULL;
        END CASE;
    END PROCESS;
END mux4to1_B;