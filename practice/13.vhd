-- 2비트 ? 이상의 데이터 저장 구현
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;
ENTITY DDSTORE IS
    PORT (
        D, CLK1, CLK2 : IN std_logic;
        A, B : OUT std_logic
    );
END DDSTORE;

ARCHITECTURE DDSTORE_B OF DDSTORE IS
    SIGNAL REG : std_logic;
BEGIN
    PROCESS (CLK1)
    BEGIN
        IF (CLK1'event AND CLK1 = '1') THEN
            REG <= D;
        END IF;
    END PROCESS;
    A <= REG;
    PROCESS (CLK2)
    BEGIN
        IF (CLK2'event AND CLK2 = '1') THEN
            B <= REG;
        END IF;
    END PROCESS;
END DDSTORE_B;