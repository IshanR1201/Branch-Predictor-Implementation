library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MuxTwo is
	Port ( A : in std_logic;
		B :  in std_logic;
		C :  in std_logic;
		D :  in std_logic;
		E :  in std_logic;
		F :  in std_logic;
		G :  in std_logic;
		H :  in std_logic;
		
		column : in std_logic_vector (2 downto 0);
		OUTPUT : out std_logic);
end entity MuxTwo;

architecture Behavioral of MuxTwo is
begin
	process(A,B,C,D,E,F,G,H,column) is
	begin
		case column is
			when "000" => OUTPUT <= A;
			when "001" => OUTPUT <= B;
			when "010" => OUTPUT <= C;
			when "011" => OUTPUT <= D;
			when "100" => OUTPUT <= E;
			when "101" => OUTPUT <= F;
			when "110" => OUTPUT <= G;
			when "111" => OUTPUT <= H;
			when others => OUTPUT <= '0';
			
		end case;
	end process;
end architecture Behavioral;