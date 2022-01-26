LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY tb_Multiplexer IS
END tb_Multiplexer;
 
ARCHITECTURE behavior OF tb_Multiplexer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplexer
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         ADD : IN  std_logic_vector(2 downto 0);
         OUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal ADD : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Output : std_logic;
   -- No clks detected in port list. Replace clk below with 
   -- appropriate port name 
 
	signal clk : std_logic;
	constant clk_period : time := 10 ns;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer PORT MAP (
          A => A,
          B => B,
          ADD => ADD,
          OUT => OUT
        );

   -- clk process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

	
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 100 ns;
		ADD <= "001";
		A <= '0';
		B <= '0';
		wait for clk_period;
		ADD <= "010";
		A <= '0';
		B <= '0';
		wait for clk_period;
		ADD <= "010";
		A <= '0';
		B <= '1';
		wait for clk_period;
		ADD <= "010";
		A <= '0';
		B <= '0';
		wait for clk_period;
		ADD <= "001";
		A <= '1';
		B <= '0';
		wait for clk_period;
		ADD <= "010";
		A <= '0';
		B <= '1';
		wait for clk_period;
		ADD <= "001";
		A <= '0';
		B <= '1';
		wait for clk_period;
		ADD <= "001";
		A <= '1';
		B <= '1';
		wait for clk_period;
		ADD <= "001";
		A <= '0';
		B <= '1';
		wait for clk_period;
		ADD <= "010";
		A <= '0';
		B <= '0';
	wait;
end process;
END;
