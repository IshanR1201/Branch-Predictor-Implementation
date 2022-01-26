
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity counter is 
	Port(	CLK : in std_logic;
		INIT : in std_logic;
		MISS : in std_logic;
		MISSES : out std_logic_vector(15 downto 0));
end counter;

architecture Behavioral of counter is

signal temp : std_logic_vector (15 downto 0);

begin

process(CLK) is

begin

	if(CLK ='1' and CLK'EVENT) then
		if(INIT = '1') then
			temp <= "0000000000000000";
		else
			if(MISS = '1') then
				if(temp = "111111111111111") then
					temp <= "0000000000000000";
				else
					temp <= temp + 1;
				end if;
			end if;
		end if;
	end if;
end process;

MISSES <= temp;

end Behavioral;