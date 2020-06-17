library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- decoder3to8

entity decoder3to8 is
	port(
		X: in std_logic_vector(2 downto 0);
		Y: out std_logic_vector(7 downto 0);
	);
end decoder3to8;


architecture B_decoder3to8 of decoder3to8 is
	SIGNAL REG: std_logic_vector(2 downto 0);
begin
	REG <= X(0) & X(1) & X(2);

	process(REG)
	begin
		case REG is
			when "000" => Y <= "00000001";
			when "001" => Y <= "00000010";
			when "011" => Y <= "00000100";
			when "100" => Y <= "00001000";
			when "101" => Y <= "00010000";
			when "110" => Y <= "00100000";
			when "010" => Y <= "01000000";
			when "111" => Y <= "10000000";
			when others => null;
		end case;
	end process;
end B_decoder3to8;




