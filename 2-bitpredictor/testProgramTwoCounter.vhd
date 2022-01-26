library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity TwoBitPredictorProgramTest is
end TwoBitPredictorProgramTest;

architecture behavior of TwoBitPredictorProgramTest is 

	component TwoCounterPredictor
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
	signal TPREDICT : std_logic;
	signal TMISSES : std_logic_vector (15 downto 0);
	signal TOUTCOME : std_logic;

	constant clk_period : time := 10 ns;

	file input : text;
begin

	uut: TwoCounterPredictor port map(TCLK, TINIT, TADD, TOUTCOME, TPREDICT, TMISSES);

	clock_process :process
	begin
		TCLK <= '0';
		wait for clk_period/2;
		TCLK <= '1';
		wait for clk_period/2;
	end process;

	process
	variable v_ILINE : line;
	variable v_ADD : integer;
	variable v_OUTCOME : std_logic;
	variable v_SPACE : character;

	begin
	
		file_open(input, "vhdl_input.txt", read_mode);

		wait for 15 ns;

		TINIT <= '1';

		wait for 10 ns;

		TINIT <= '0';

		while not endfile(input) loop

			readline(input, v_ILINE);
			read(v_ILINE, v_ADD);
			read(v_ILINE, v_SPACE);
			read(v_ILINE, v_OUTCOME);

			TADD <= std_logic_vector(to_unsigned(v_ADD,3));
			TOUTCOME <= v_OUTCOME;

			wait for 10 ns;

		end loop;
		file_close(input);

	wait;
	end process;
end behavior;
