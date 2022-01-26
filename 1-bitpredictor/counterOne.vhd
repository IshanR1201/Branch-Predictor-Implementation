library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counterOne is
	Port (CLK : in STD_LOGIC;
		INIT : in STD_LOGIC;
		OUTCOME : in STD_LOGIC;
		MISS : in STD_LOGIC;
		PREDICT : out STD_LOGIC);
end counterOne;

architecture Behavioral of counterOne is

	signal count : STD_LOGIC := '0';

begin
process(CLK) is
begin

	if(CLK ='1' and CLK'EVENT) then
		if(INIT ='1') then
			count <= '0';
		else 
			if (MISS = '1') then
			count <= not count;			
			end if;
		end if;
	end if;
end process;

PREDICT <= count;

end Behavioral;