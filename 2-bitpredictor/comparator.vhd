
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator is 
	Port(	CLK : in std_logic;
		INIT : in std_logic;
		OUTCOME : in std_logic;
		ADD : in std_logic_vector (2 downto 0);
		PREDICT : in std_logic;
		ADD_1 : out std_logic_vector(2 downto 0);
		MISS : out std_logic);
end comparator;

architecture Behavioral of comparator is

begin

process(OUTCOME, PREDICT)
begin

	MISS <= OUTCOME xor PREDICT;

end process;

ADD_1 <= ADD;

end Behavioral;