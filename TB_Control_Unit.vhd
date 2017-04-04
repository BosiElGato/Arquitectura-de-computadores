
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY TB_Control_Unit IS
END TB_Control_Unit;
 
ARCHITECTURE behavior OF TB_Control_Unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control_Unity
    PORT(
         Op3 : IN  std_logic_vector(5 downto 0);
         Op : IN  std_logic_vector(1 downto 0);
         AluOp : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal Op : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal AluOp : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control_Unity PORT MAP (
          Op3 => Op3,
          Op => Op,
          AluOp => AluOp
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
		op <="01";
     Op3 <= "000000";
	  
	  wait for 10 ns;
	  op <="01";
     Op3 <= "000010";
	  wait for 10 ns;
	  op <="01";
     Op3 <= "000100";
	  wait for 10 ns;
	  op <="00";
     Op3 <= "000000";
	  wait for 10 ns;
	  op <="01";
     Op3 <= "000000";
	  
	  wait for 10 ns;
	  op <="01";
     Op3 <= "100000";
	  
      wait;
   end process;

END;
