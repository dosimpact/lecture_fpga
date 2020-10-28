LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY MTP IS
    PORT (
        A, B : IN std_logic_vector(1 DOWNTO 0);
        C : OUT std_logic_vector(3 DOWNTO 0)
    );
END MTP;

ARCHITECTURE MTP_B OF MTP IS
    COMPONENT HA IS
        PORT (
            X, Y : IN std_logic;
            S, C : OUT std_logic
        );
    END COMPONENT;
    SIGNAL REG_AB : std_logic_vector(3 DOWNTO 0);
    SIGNAL REG_C : std_logic;
BEGIN
    REG_AB(0) <= A(0) AND B(0);
    REG_AB(1) <= A(0) AND B(1);
    REG_AB(2) <= A(1) AND B(0);
    REG_AB(3) <= A(1) AND B(1);

    HA1 : HA
    PORT MAP(
        X => REG_AB(0),
        Y => REG_AB(1),
        S => C(2),
        C => REG_C
    );

    HA2 : HA
    PORT MAP(
        X => REG_C,
        Y => REG_AB(2),
        C => C(0),
        S => C(1)
    );
    C(3) <= REG_AB(3);
END MTP_B;