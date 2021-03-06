
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demultiplexer is
port (	enable0 : out std_logic;
	enable1 : out std_logic;
	ADDR : in std_logic_vector(1 downto 0)
     );
end demultiplexer;

architecture Behavioral of demultiplexer is

begin
process(ADDR)
begin
	case ADDR is
  		when "01" => enable0 <= '1'; enable1 <='0';
  		when "10" => enable1 <= '1'; enable0 <= '0';
  		when others => enable0 <= '0'; enable1 <= '1';
	end case;
end process;

end Behavioral;