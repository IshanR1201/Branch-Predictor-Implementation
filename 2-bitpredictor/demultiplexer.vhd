
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demultiplexer is
port (
	CLK : in std_logic;
      out0 : out std_logic;   --output bit
	enable0 : out std_logic;
      out1 : out std_logic;   --output bit
	enable1 : out std_logic;
	ADD : in std_logic_vector(2 downto 0);
	OUTCOME : in STD_LOGIC
     );
end demultiplexer;

architecture Behavioral of demultiplexer is

begin
process(CLK)
begin
if(CLK'EVENT and CLK = '1') then
	case ADD is
  		when "001" => out0 <= OUTCOME; enable0 <= '1'; out1 <= '0'; enable1 <='0';
  		when "010" => out1 <= OUTCOME; enable1 <= '1'; out0 <= '0'; enable0 <= '0';
  		when others => out0 <= '0'; out1 <= '0'; enable0 <= '0'; enable1 <= '1';
	end case;
end if; 
end process;

end Behavioral;