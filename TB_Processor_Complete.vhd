
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Processor_Complete IS
END TB_Processor_Complete;
 
ARCHITECTURE behavior OF TB_Processor_Complete IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Process_Complete
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         aluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal aluResult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Process_Complete PORT MAP (
          CLK => CLK,
          RST => RST,
          aluResult => aluResult
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
		RST <= '1';
		wait for 40 ns;
      RST <= '0';
		
      wait;
   end process;

END;
