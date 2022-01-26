
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demuxTwo is
port (	enable0 : out std_logic;
	out0 : out std_logic;
	enable1 : out std_logic;
	out1 : out std_logic;
	enable2 : out std_logic;
	out2 : out std_logic;
	enable3 : out std_logic;
	out3 : out std_logic;
	enable4 : out std_logic;
	out4 : out std_logic;
	enable5 : out std_logic;
	out5 : out std_logic;
	enable6 : out std_logic;
	out6 : out std_logic;
	enable7 : out std_logic;
	out7 : out std_logic;
	
	column : in std_logic_vector(2 downto 0);
	OUTCOME : in std_logic;
	ENABLE : in std_logic
     );
end demuxTwo;

architecture Behavioral of demuxTwo is

begin
process(ENABLE,column)
begin
	if(ENABLE = '1') then

		if(column = "000") then
			out0 <=OUTCOME;
			enable0<='1';
			enable1 <='0'; out1 <='0';enable2 <='0'; out2 <='0';enable3 <='0'; out3 <='0';enable4 <='0'; out4 <='0';enable5 <='0'; out5 <='0';enable6 <='0'; out6 <='0';enable7 <='0'; out7 <='0';

		elsif(column = "0001") then
			out1 <=OUTCOME;
			enable1<='1';
			enable0 <= '0'; out0 <= '0'; enable2 <='0'; out2 <='0';enable3 <='0'; out3 <='0';enable4 <='0'; out4 <='0';enable5 <='0'; out5 <='0';enable6 <='0'; out6 <='0';enable7 <='0'; out7 <='0';

		elsif(column = "010") then
			out2 <=OUTCOME;
			enable2<='1';
			enable0 <= '0'; out0 <= '0'; enable1 <='0'; out1 <='0';enable3 <='0'; out3 <='0';enable4 <='0'; out4 <='0';enable5 <='0'; out5 <='0';enable6 <='0'; out6 <='0';enable7 <='0'; out7 <='0';
		elsif(column = "011") then
			out3 <=OUTCOME;
			enable3<='1';
			enable0 <= '0'; out0 <= '0'; enable1 <='0'; out1 <='0';enable2 <='0'; out2 <='0';enable4 <='0'; out4 <='0';enable5 <='0'; out5 <='0';enable6 <='0'; out6 <='0';enable7 <='0'; out7 <='0';
		elsif(column = "100") then
			out4 <=OUTCOME;
			enable4<='1';
			enable0 <= '0'; out0 <= '0'; enable1 <='0'; out1 <='0';enable2 <='0'; out2 <='0';enable3 <='0'; out3 <='0';enable5 <='0'; out5 <='0';enable6 <='0'; out6 <='0';enable7 <='0'; out7 <='0';

		elsif(column = "101") then
			out5 <=OUTCOME;
			enable5<='1';
			enable0 <= '0'; out0 <= '0'; enable1 <='0'; out1 <='0';enable2 <='0'; out2 <='0';enable3 <='0'; out3 <='0';enable4 <='0'; out4 <='0';enable6 <='0'; out6 <='0';enable7 <='0'; out7 <='0';
		elsif(column = "110") then
			out6 <=OUTCOME;
			enable6<='1';
			enable0 <= '0'; out0 <= '0'; enable1 <='0'; out1 <='0';enable2 <='0'; out2 <='0';enable3 <='0'; out3 <='0';enable4 <='0'; out4 <='0';enable5 <='0'; out5 <='0';enable7 <='0'; out7 <='0';
		elsif(column = "111") then
			out7 <=OUTCOME;
			enable7<='1';
			enable0 <= '0'; out0 <= '0'; enable1 <='0'; out1 <='0';enable2 <='0'; out2 <='0';enable3 <='0'; out3 <='0';enable4 <='0'; out4 <='0';enable5 <='0'; out5 <='0';enable6 <='0'; out6 <='0';
		
		end if;	
		else
		enable0 <= '0'; out0 <= '0'; enable1 <='0'; out1 <='0';enable2 <='0'; out2 <='0';enable3 <='0'; out3 <='0';enable4 <='0'; out4 <='0';enable5 <='0'; out5 <='0';enable6 <='0'; out6 <='0';enable7 <='0'; out7 <='0';
	end if;
end process;

end Behavioral;