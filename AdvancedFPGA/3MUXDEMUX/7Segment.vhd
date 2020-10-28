LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY seg8 IS
    PORT (
        sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        seg_com : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        seg_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );

END seg8;
ARCHITECTURE seg8_b OF seg8 IS
    -- before begin , declare  signal variable

    SIGNAL data_0 = STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_1 = STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_2 = STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_3 = STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_4 = STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_5 = STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_6 = STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_7 = STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

    data_0 <= "11111110";
    data_1 <= "11111101";
    data_2 <= "11111011";
    data_3 <= "11110111";
    data_4 <= "11101111";
    data_5 <= "11011111";
    data_6 <= "10111111";
    data_7 <= "01111111";

    seg_com <=
        "01111111" WHEN sel = "000" ELSE
        "10111111" WHEN sel = "001" ELSE
        "11011111" WHEN sel = "010" ELSE
        "11101111" WHEN sel = "100" ELSE
        "11110111" WHEN sel = "100" ELSE
        "11111011" WHEN sel = "101" ELSE
        "11111101" WHEN sel = "110" ELSE
        "11111110" WHEN sel = "111" ELSE
        "11111111";
    seg_data <=
        data_0 WHEN sel = "000" ELSE
        data_1 WHEN sel = "001" ELSE
        data_2 WHEN sel = "010" ELSE
        data_3 WHEN sel = "100" ELSE
        data_4 WHEN sel = "100" ELSE
        data_5 WHEN sel = "101" ELSE
        data_6 WHEN sel = "110" ELSE
        data_7 WHEN sel = "111" ELSE
        (OTHERS => '0');
END seg8_b;