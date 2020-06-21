LIBRARY library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY async_counter IS
    PORT (
        CLK : IN std_logic;
        Q : BUFFER std_logic_vector(3 DOWNTO 0)
    );
END async_counter;

ARCHITECTURE async_counter_body OF async_counter IS

BEGIN
    PROCESS (clk)
    BEGIN
        IF (clk'event AND clk = '0') THEN
            IF Q(0) = '0' THEN
                Q(0) <= '1';
            ELSE
                Q(0) <= '0';
            END IF
        END IF
    END PROCESS

    PROCESS (Q(0))
    BEGIN
        IF ((Q(0)'event AND (Q(0) = '0') THEN
            IF Q(1) = '0' THEN
                Q(1) <= '1';
            ELSE
                Q(1) <= '0';
            END IF
        END IF
    END PROCESS

    PROCESS (Q(1))
    BEGIN
        IF ((Q(1)'event AND (Q(1) = '0') THEN
            IF Q(2) = '0' THEN
                Q(2) <= '1';
            ELSE
                Q(2) <= '0';
            END IF
        END IF
    END PROCESS

    PROCESS (Q(2))
    BEGIN
        IF ((Q(2)'event AND (Q(2) = '0') THEN
            IF Q(3) = '0' THEN
                Q(3) <= '1';
            ELSE
                Q(3) <= '0';
            END IF
        END IF
    END PROCESS
END ARCHITECTURE async_counter_body;