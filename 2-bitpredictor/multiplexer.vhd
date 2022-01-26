library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer is
	Port ( A : std_logic;
		B : std_logic;
		ADD : in std_logic_vector (2 downto 0);
		OUT : out std_logic);
end entity Multiplexer;

architecture Behavioral of Multiplexer is
begin
	process(A,B,ADD) is
	begin
		case ADD is
			when "001" => OUT <= A;
			when "010" => OUT <= B;
			when others => OUT <= '0';
		end case;
	end process;
end architecture Behavioral;
