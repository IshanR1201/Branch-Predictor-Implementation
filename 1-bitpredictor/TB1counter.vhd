
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Counter1Test is
end Counter1Test;

architecture behavior of Counter1Test is 

	component counterOne
	Port(	CLK : in std_logic;
		INIT : in std_logic;
		OUTCOME : in STD_LOGIC;
		MISS : in std_logic;
		PREDICT : out std_logic
	);
	end component;


	signal TCLK : std_logic;
	signal TINIT : std_logic;
	signal TOUTCOME : std_logic;
	signal TMISS : std_logic;
	signal TPREDICT : std_logic;

	constant clk_period : time := 10 ns;


begin

	uut: counterOne port map(TCLK, TINIT, TOUTCOME, TMISS, TPREDICT);

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

		TMISS <= '0';
		TOUTCOME <= '0';

		wait for 10 ns;

		TOUTCOME <= '1';
		TMISS <= '1';

		wait for 10 ns;

		TOUTCOME <= '1';
		TMISS <= '0';

		wait for 10 ns;

		

		wait for 10 ns;

		

		wait for 10 ns;

		TOUTCOME <= '0';
		TMISS <= '1';

		wait for 10 ns;

		TOUTCOME <= '0';
		TMISS <= '0';

		wait for 10 ns;

		TOUTCOME <= '1';
		TMISS <= '1';

		wait for 10 ns;

		TOUTCOME <= '1';
		TMISS <= '0';

		wait for 10 ns;

	wait;
	end process;
end behavior;