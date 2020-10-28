LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY SFT_RGSTER IS
    PORT (
        DATA_IN, CLK, RESETN : IN std_logic;
        Q : BUFFER std_logic_vetore(3 DOWNTO 0)
    );
END SFT_RGSTER;

ARCHITECTURE SFT_RGSTER_B OF SFT_RGSTER IS
BEGIN
    PROCESS (CLK)
    BEGIN
        IF RESETN = '1' THEN
            Q <= "0000";
        ELSIF CLK'event AND CLK = '1' THEN
            Q(3) <= DATA_IN;
            Q(2) <= Q(3);
            Q(1) <= Q(2);
            Q(0) <= Q(1);
        END IF;
    END PROCESS;
END SFT_RGSTER_B;