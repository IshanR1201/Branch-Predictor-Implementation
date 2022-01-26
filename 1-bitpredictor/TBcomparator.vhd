
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity comparatorTest is
end comparatorTest;

architecture behavior of comparatorTest is 

	component comparator
	Port(	CLK : in std_logic;
		INIT : in std_logic;
		OUTCOME : in std_logic;
		ADD : in std_logic_vector (2 downto 0);
		PREDICT : in std_logic;
		ADD_1 : out std_logic_vector (2 downto 0);
		MISS : out std_logic
	);
	end component;


	signal TCLK : std_logic;
	signal TINIT : std_logic;
	signal TOUTCOME : std_logic;
	signal TMISS : std_logic;
	signal TPREDICT : std_logic;
	signal TADD : std_logic_vector (2 downto 0);
	signal TADD1 : std_logic_vector (2 downto 0);
	constant clk_period : time := 10 ns;


begin

	uut: comparator port map(TCLK, TINIT, TOUTCOME, TADD, TPREDICT, TADD1, TMISS);

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

		TOUTCOME <= '0';
		TPREDICT <= '0';

		wait for 10 ns;

		TOUTCOME <= '0';
		TPREDICT <= '0';

		wait for 10 ns;

		TOUTCOME <= '0';
		TPREDICT <= '0';

		wait for 10 ns;

		TOUTCOME <= '1';
		TPREDICT <= '0';

		wait for 10 ns;

		TOUTCOME <= '0';
		TPREDICT <= '1';

		wait for 10 ns;

		TOUTCOME <= '0';
		TPREDICT <= '0';

		wait for 10 ns;

		TOUTCOME <= '1';
		TPREDICT <= '0';

		wait for 10 ns;

		TOUTCOME <= '1';
		TPREDICT <= '1';

		wait for 10 ns;

		TOUTCOME <= '0';
		TPREDICT <= '1';

		wait for 10 ns;

		TOUTCOME <= '0';
		TPREDICT <= '0';

	wait;
	end process;
end behavior;