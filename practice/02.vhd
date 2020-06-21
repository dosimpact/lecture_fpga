LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY FA IS
    PORT (
        A, B, CIN : IN BIT;
        S, COUT : OUT BIT
    );
END FA;

ARCHITECTURE FA_B OF FA IS
    COMPONENT HA IS
        PORT (
            A, B : IN BIT;
            S, C : OUT BIT
        );
    END COMPONENT;
    SIGNAL REG_C1, REG_C2 : BIT;
    SIGNAL REG_S : BIT;
BEGIN
    U1 : HA
    PORT MAP(
        A => A,
        B => B,
        S => REG_S,
        C => REG_C1
    );
    U2 : HA
    PORT MAP(
        A => REG_S,
        B => CIN,
        S => S,
        C => REG_C2
    );
    C <= REG_C1 OR REG_C2;

END FA_B;