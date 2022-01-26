library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer is
	Port ( A : std_logic;
		B : std_logic;
		ADDR : in std_logic_vector (1 downto 0);
		OUTPUT : out std_logic);
end entity Multiplexer;

architecture Behavioral of Multiplexer is
begin
	process(A,B,ADDR) is
	begin
		case ADDR is
			when "01" => OUTPUT <= A;
			when "10" => OUTPUT <= B;
			when others => OUTPUT <= '0';
		end case;
	end process;
end architecture Behavioral;
