LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux IS
    PORT (
        i0, i1, s : IN STD_LOGIC;
        z : OUT STD_LOGIC
    );
END mux;

ARCHITECTURE mux_b OF mux IS
BEGIN

    PROCESS (i0, i1, s)
    BEGIN
        CASE s IS
            WHEN '0' => z <= i0;
            WHEN '1' => z <= i1;
        END CASE;
    END PROCESS;
END mux_b;