
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity GBH is
	port(   CLOCK : in std_logic;
		INIT : in std_logic;
		OUTCOME : in std_logic;
		column : out std_logic_vector(2 downto 0));
end GBH;

architecture Behavioral of GBH is

signal temp : std_logic_vector (2 downto 0);

begin
	process(CLOCK)
	begin
		if rising_edge(CLOCK) then
			if(INIT='1') then
				temp <= "000";
			else
				column <= temp;
				temp(2 downto 1) <= temp(1 downto 0);
				temp(0) <= OUTCOME;
			end if;
		end if;
	end process;
end Behavioral;
