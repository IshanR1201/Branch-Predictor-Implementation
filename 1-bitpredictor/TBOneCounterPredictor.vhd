library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity OneCounterPredictorTest is
end OneCounterPredictorTest;

architecture behavior of OneCounterPredictorTest is 

	component OneCounterPredictor
	Port(	CLK : in std_logic;
		INIT : in std_logic;
		ADD : in std_logic_vector (2 downto 0);
		OUTCOME : in std_logic;
		PREDICT : out std_logic;
		MISSES : out std_logic_vector (15 downto 0));
	end component;


	signal TCLK : std_logic;
	signal TINIT : std_logic;
	signal TADD : std_logic_vector (2 downto 0);
	signal TMISS : std_logic;
	signal TPREDICT : std_logic;
	signal TMISSES : std_logic_vector (15 downto 0);
	signal TOUTCOME : std_logic;

	constant clk_period : time := 10 ns;


begin

	uut: OneCounterPredictor port map(TCLK, TINIT, TADD, TOUTCOME, TPREDICT, TMISSES);

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

		TADD <= "001";
		TOUTCOME <= '1';

		wait for 10 ns;

		TADD <= "010";
		TOUTCOME <= '1';

		wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '0';

		wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '0';

		wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '0';

		wait for 10 ns;

		TADD <= "010";
		TOUTCOME <= '0';
		wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '1';
		wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '1';
		wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '0';
		wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '0';
		wait for 10 ns;

		TADD <= "010";
		TOUTCOME <= '1';
		wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '0';
		wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '0';
		wait for 10 ns;

		TADD <= "010";
		TOUTCOME <= '1';
		wait for 10 ns;

		TADD <= "010";
		TOUTCOME <= '0';
		wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '0';
		wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '1';

wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '0';

wait for 10 ns;

		TADD <= "001";
		TOUTCOME <= '0';


	wait;
	end process;
end behavior;