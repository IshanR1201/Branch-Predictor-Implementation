
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity counterTest is
end counterTest;

architecture behavior of counterTest is 

	component counter
	Port(	CLK : in std_logic;
		INIT : in std_logic;
		MISS : in std_logic;
		MISSES : out std_logic_vector (15 downto 0)
	);
	end component;


	signal TCLK : std_logic;
	signal TINIT : std_logic;
	signal TMISS : std_logic;
	signal TMISSES : std_logic_vector (15 downto 0);

	constant clk_period : time := 10 ns;


begin

	uut: counter port map(TCLK, TINIT, TMISS, TMISSES);

	clock_process :process
	begin
		TCLK <= '0';
		wait for clk_period/2;
		TCLK <= '1';
		wait for clk_period/2;
	end process;

	process
	begin
	
		wait for 15 ns;

		TINIT <= '1';

		wait for 10 ns;

		TINIT <= '0';

		TMISS<= '0';

		wait for 10 ns;

		TMISS <= '0';
		wait for 10 ns;

		TMISS <= '1';
		wait for 10 ns;

		TMISS<= '0';

		wait for 10 ns;

		TMISS <= '1';

		wait for 10 ns;

		TMISS <= '1';

		wait for 10 ns;

		TMISS <= '0';

	wait;
	end process;
end behavior;