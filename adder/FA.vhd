library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity counter is
port(
	clk : in std_logic;
	reset : in std_logic;
	enable : in std_logic;
	count : out ENTITY Full_adder IS
	PORT(
		A,B,CIN:IN BIT;
		S,COUT:OUT BIT
	);
	END Full_adder;
	
	ARCHITECTURE ADDER OF Full_adder IS
		COMPONENT half_adder IS
		PORT(
		A,B:IN BIT;
		S,C:OUT BIT
		);
		END COMPONENT;
		
		SIGNAL REG_C1,REG_C2 : BIT;
		SIGNAL REG_SUM : BIT;
	BEGIN
	U1_HA: half_adder
	PORT MAP(
		A=>A,
		B=>B,
		S=> REG_SUM,
		C=>REG_C1
	);
	
	U2_HA: half_adder
	PORT MAP(
		A=>CIN,
		B=>REG_SUM,
		S=> S,
		C=>REG_C2
	);
	
	COUT <=REG_C1 OR REG_C2;
	
	END ADDER;
	(3 downto 0) 
);
end counter;


architecture behav of counter is
signal pre_count: std_logic_vector(3 downto 0);
begin
	process(clk, enable, reset)
	begin
		if reset = '1' then
			pre_count <= "0000";
		elsif (clk='1' and clk'event) then
            if enable = '1' then
                pre_count <= pre_count + "1";
            end if;
        end if
    end process;
    count <= pre_count;
end behave