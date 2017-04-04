
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY TB_IM IS
END TB_IM;
 
ARCHITECTURE behavior OF TB_IM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Instruction_Memory
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         Data_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal Data_Out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Instruction_Memory PORT MAP (
          Address => Address,
          rst => rst,
          Data_Out => Data_Out
        );

 
 

   -- Stimulus process
   stim_proc: process
   begin		
		 rst <= '0';
		Address <="00000000000000000000000000000000";
		wait for 10 ns;
      rst <= '0';
		Address <="00000000000000000000000000000001";
		wait for 10 ns;
		rst <= '0';
		Address <="00000000000000000000000000000010";
		wait for 10 ns;
		rst <= '0';
		Address <="00000000000000000000000000000011";
		wait for 10 ns;
      wait;
   end process;

END;
