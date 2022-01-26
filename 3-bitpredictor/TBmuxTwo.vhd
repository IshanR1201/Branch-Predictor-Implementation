library IEEE;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY tb_MuxTwo IS
END tb_MuxTwo;
 
ARCHITECTURE behavior OF tb_MuxTwo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MuxTwo
    PORT(
         A : in std_logic;
		B :  in std_logic;
		C :  in std_logic;
		D :  in std_logic;
		E :  in std_logic;
		F :  in std_logic;
		G :  in std_logic;
		H :  in std_logic;
		
		column : in std_logic_vector (2 downto 0);
         OUTPUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
signal C : std_logic := '0';
signal D : std_logic := '0';
signal E : std_logic := '0';
signal F : std_logic := '0';
signal G : std_logic := '0';
signal H : std_logic := '0';

   signal column : std_logic_vector(2 downto 0) := (others => '0');

 	--Output
   signal Output : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MuxTwo PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          E => E,
          F => F,
          G => G,
          H => H,
          
          column => column,
          OUTPUT => OUTPUT
        );

	
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 10 ns;
		column <= "001";
		A <= '1';
		B <= '1';
		wait for 10 ns;
		column <= "100";
		wait for 10 ns;
		column <= "100";
		wait for 10 ns;
		column <= "000";
		wait for 10 ns;
		column <= "001";
		wait for 10 ns;
		column <= "100";
		wait for 10 ns;
		column <= "001";
		wait for 10 ns;
		column <= "010";
		wait for 10 ns;
		column <= "000";
		wait for 10 ns;
		column <= "100";
	wait;
end process;
END;
