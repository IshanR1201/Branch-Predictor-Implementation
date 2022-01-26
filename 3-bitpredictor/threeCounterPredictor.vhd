library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ThreeCounterPredictor is 
	Port(	CLOCK : in std_logic;
		INIT : in std_logic;
		ADDR : in std_logic_vector (1 downto 0);
		OUTCOME : in std_logic;
		PREDICTION : out std_logic;
		MISSES : out std_logic_vector (7 downto 0));
end ThreeCounterPredictor;

architecture Behavioral of ThreeCounterPredictor is

component counterTwo is
	Port (CLOCK : in STD_LOGIC;
		INIT : in STD_LOGIC;
		OUTCOME : in STD_LOGIC;
		ENABLE : in STD_LOGIC;
		PREDICTION : out STD_LOGIC);
end component;

component Multiplexer is
	Port ( A : std_logic;
		B : std_logic;
		ADDR : in std_logic_vector (1 downto 0);
		OUTPUT : out std_logic);
end component;

component demultiplexer is
port (	enable0 : out std_logic;
	enable1 : out std_logic;
	ADDR : in std_logic_vector(1 downto 0)
     );
end component;

component comparator
	Port(	OUTCOME : in std_logic;
		PREDICTION : in std_logic;
		MISS : out std_logic);
end component;

component counter is 
	Port(	CLOCK : in std_logic;
		INIT : in std_logic;
		MISS : in std_logic;
		MISSES : out std_logic_vector(7 downto 0));
end component;

component MuxTwo is
	Port ( A : in std_logic;
		B :  in std_logic;
		C :  in std_logic;
		D :  in std_logic;
		E :  in std_logic;
		F :  in std_logic;
		G :  in std_logic;
		H :  in std_logic;
		column : in std_logic_vector (2 downto 0);
		OUTPUT : out std_logic);
end component;

component demuxTwo is
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
end component;

component GBH is
	port(   CLOCK : in std_logic;
		INIT : in std_logic;
		OUTCOME : in std_logic;
		column : out std_logic_vector(2 downto 0));
end component;

signal miss_in : std_logic;
signal prediction_out : std_logic;
signal demen0 : std_logic;
signal demen1 : std_logic;

signal dem20o0: std_logic;
signal dem20o1: std_logic;
signal dem20o2: std_logic;
signal dem20o3: std_logic;
signal dem20o4: std_logic;
signal dem20o5: std_logic;
signal dem20o6: std_logic;
signal dem20o7: std_logic;

signal dem20en0: std_logic;
signal dem20en1: std_logic;
signal dem20en2: std_logic;
signal dem20en3: std_logic;
signal dem20en4: std_logic;
signal dem20en5: std_logic;
signal dem20en6: std_logic;
signal dem20en7: std_logic;

signal A0 : std_logic;
signal B0 : std_logic;
signal C0 : std_logic;
signal D0 : std_logic;
signal E0 : std_logic;
signal F0 : std_logic;
signal G0 : std_logic;
signal H0 : std_logic;

signal OUTPUT0 : std_logic;
signal dem21o0: std_logic;
signal dem21o1: std_logic;
signal dem21o2: std_logic;
signal dem21o3: std_logic;
signal dem21o4: std_logic;
signal dem21o5: std_logic;
signal dem21o6: std_logic;
signal dem21o7: std_logic;

signal dem21en0: std_logic;
signal dem21en1: std_logic;
signal dem21en2: std_logic;
signal dem21en3: std_logic;
signal dem21en4: std_logic;
signal dem21en5: std_logic;
signal dem21en6: std_logic;
signal dem21en7: std_logic;

signal A1 : std_logic;
signal B1 : std_logic;
signal C1 : std_logic;
signal D1 : std_logic;
signal E1 : std_logic;
signal F1 : std_logic;
signal G1 : std_logic;
signal H1 : std_logic;

signal OUTPUT1 : std_logic;
signal column : std_logic_vector(2 downto 0);

begin

demux : demultiplexer port map (demen0,
				demen1,
				ADDR);

demux20 : demuxTwo port map ( dem20en0,
	dem20o0,
	dem20en1,
	dem20o1,
	dem20en2,
	dem20o2,
	dem20en3,
	dem20o3,
	dem20en4,
	dem20o4,
	dem20en5,
	dem20o5,
	dem20en6,
	dem20o6,
	dem20en7,
	dem20o7,
	column,
	OUTCOME,
	demen0
     );

count00 : counterTwo port map (CLOCK,
				INIT,
				dem20o0,
				dem20en0,
				A0);

count01 : counterTwo port map (CLOCK,
				INIT,
				dem20o1,
				dem20en1,
				B0);

count02 : counterTwo port map (CLOCK,
				INIT,
				dem20o2,
				dem20en2,
				C0);

count03 : counterTwo port map (CLOCK,
				INIT,
				dem20o3,
				dem20en3,
				D0);

count04 : counterTwo port map (CLOCK,
				INIT,
				dem20o4,
				dem20en4,
				E0);
count05 : counterTwo port map (CLOCK,
				INIT,
				dem20o5,
				dem20en5,
				F0);
count06 : counterTwo port map (CLOCK,
				INIT,
				dem20o6,
				dem20en6,
				G0);
count07 : counterTwo port map (CLOCK,
				INIT,
				dem20o7,
				dem20en7,
				H0);


mux20 : MuxTwo port map (A0,
		B0,
		C0,
		D0,
		E0,
		F0,
		G0,
		H0,
		
		column,
		OUTPUT0);		


demux21 : demuxTwo port map ( dem21en0,
	dem21o0,
	dem21en1,
	dem21o1,
	dem21en2,
	dem21o2,
	dem21en3,
	dem21o3,
	dem21en4,
	dem21o4,
	dem21en5,
	dem21o5,
	dem21en6,
	dem21o6,
	dem21en7,
	dem21o7,

	column,
	OUTCOME,
	demen1
     );

count10 : counterTwo port map (CLOCK,
				INIT,
				dem21o0,
				dem21en0,
				A1);

count11 : counterTwo port map (CLOCK,
				INIT,
				dem21o1,
				dem21en1,
				B1);

count12 : counterTwo port map (CLOCK,
				INIT,
				dem21o2,
				dem21en2,
				C1);

count13 : counterTwo port map (CLOCK,
				INIT,
				dem21o3,
				dem21en3,
				D1);

count14 : counterTwo port map (CLOCK,
				INIT,
				dem21o4,
				dem21en4,
				E1);
count15 : counterTwo port map (CLOCK,
				INIT,
				dem21o5,
				dem21en5,
				F1);
count16 : counterTwo port map (CLOCK,
				INIT,
				dem21o6,
				dem21en6,
				G1);
count17 : counterTwo port map (CLOCK,
				INIT,
				dem21o7,
				dem21en7,
				H1);

mux21 : MuxTwo port map (A1,
		B1,
		C1,
		D1,
		E1,
		F1,
		G1,
		H1,
		column,
		OUTPUT1);		

mux : Multiplexer port map (OUTPUT0,
				OUTPUT1,
				ADDR,
				prediction_out);

comp : comparator port map(OUTCOME,
			prediction_out,
			miss_in);

count : counter port map(CLOCK,
			INIT,
			miss_in,
			MISSES);

global : GBH port map(CLOCK,
			INIT,
			OUTCOME,
			column);

PREDICTION <= prediction_out;

end Behavioral;
