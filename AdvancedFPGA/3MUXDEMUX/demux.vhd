LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY demux IS
    PORT (
        i : IN STD_LOGIC;
        s : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        o : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END demux;
ARCHITECTURE demux_b OF demux IS

BEGIN
    o(0) <= i WHEN s = "000" ELSE
    '0';
    o(1) <= i WHEN s = "001" ELSE
    '0';
    o(2) <= i WHEN s = "010" ELSE
    '0';
    o(3) <= i WHEN s = "011" ELSE
    '0';
    o(4) <= i WHEN s = "100" ELSE
    '0';
    o(5) <= i WHEN s = "101" ELSE
    '0';
    o(6) <= i WHEN s = "110" ELSE
    '0';
    o(7) <= i WHEN s = "111" ELSE
    '0';

END demux_b;