LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY demux8to1 IS
    PORT (
        i : IN std_logic;
        s : IN std_logic_vector(2 DOWNTO 0);
        o : OUT std_logic_vector(7 DOWNTO 0)
    );
END demux8to1;

ARCHITECTURE demux8to1_B OF demux8to1 IS
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

END demux8to1_B;