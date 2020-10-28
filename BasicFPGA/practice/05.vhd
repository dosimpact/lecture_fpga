LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY mux2to1 IS
    PORT (
        i0, i1, s : IN std_logic;
        z : OUT std_logic
    );
END mux2to1;

ARCHITECTURE mux2to1_B OF mux2to1 IS
BEGIN
    PROCESS (s)
    BEGIN
        CASE s IS
            WHEN '0' =>
                z <= i0;
            WHEN '1' =>
                z <= i1;
            WHEN OTHERS =>
                NULL;
        END CASE;
    END PROCESS;
END mux2to1_B;