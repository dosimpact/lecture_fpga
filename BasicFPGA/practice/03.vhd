LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY SBT IS
    PORT (
        M : IN std_logic;
        X, Y : IN std_logic_vector(3 DOWNTO 0);
        C : OUT std_logic;
        S : OUT std_logic_vector(3 DOWNTO 0)
    );
END SBT;

ARCHITECTURE SBT_B OF SBT IS
    COMPONENT FA IS
        PORT (
            A, B, CIN : IN std_logic;
            S, COUT : OUT std_logic
        );
    END COMPONENT;
    SIGNAL REG_Y, REG_C, REG_S : std_logic_vector(3 DOWNTO 0);
BEGIN
    REG_Y(0) <= Y(0) XOR M;
    REG_Y(1) <= Y(1) XOR M;
    REG_Y(2) <= Y(2) XOR M;
    REG_Y(3) <= Y(3) XOR M;

    FA0 : FA
    PORT MAP(
        A => X(0),
        B => REG_Y(0),
        CIN => M,
        S => REG_S(0),
        COUT => REG_C(0)
    );
    FA1 : FA
    PORT MAP(
        A => X(1),
        B => REG_Y(1),
        CIN => REG_C(0),
        S => REG_S(1),
        COUT => REG_C(1)
    );
    FA2 : FA
    PORT MAP(
        A => X(2),
        B => REG_Y(2),
        CIN => REG_C(1),
        S => REG_S(2),
        COUT => REG_C(2)
    );
    FA3 : FA
    PORT MAP(
        A => X(3),
        B => REG_Y(3),
        CIN => REG_C(2),
        S => REG_S(3),
        COUT => REG_C(3)
    );
    C <= REG_C(3);
    S(0) <= REG_S(0);
    S(1) <= REG_S(1);
    S(2) <= REG_S(2);
    S(3) <= REG_S(3);
END SBT_B;