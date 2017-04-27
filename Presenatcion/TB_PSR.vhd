
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY TB_PSR IS
END TB_PSR;
 
ARCHITECTURE behavior OF TB_PSR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         NZVC : IN  std_logic_vector(3 downto 0);
         Rst : IN  std_logic;
         clk : IN  std_logic;
         Carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal NZVC : std_logic_vector(3 downto 0) := (others => '0');
   signal Rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Carry : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          NZVC => NZVC,
          Rst => Rst,
          clk => clk,
          Carry => Carry
        );

   -- Clock process definitions
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
     Rst<= '1';
	  wait for 30 ns;
	  NZVC <="0001";
	  Rst <= '0';
	  wait for 30 ns;
	  NZVC <="0000";
	  Rst <= '0';
	  wait for 30 ns;
	  NZVC <="0001";
	  Rst <= '0';
	  wait for 30 ns;
   end process;

END;
