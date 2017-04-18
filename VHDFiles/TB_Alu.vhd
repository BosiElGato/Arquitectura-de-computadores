
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY TB_Alu IS
END TB_Alu;
 
ARCHITECTURE behavior OF TB_Alu IS 

 
    COMPONENT Alu
    PORT(
         Op1 : IN  std_logic_vector(31 downto 0);
         Op2 : IN  std_logic_vector(31 downto 0);
         AluOp : IN  std_logic_vector(5 downto 0);
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Op2 : std_logic_vector(31 downto 0) := (others => '0');
   signal AluOp : std_logic_vector(5 downto 0) := (others => '0');

 
   signal AluResult : std_logic_vector(31 downto 0);


 
BEGIN
 
	
   uut: Alu PORT MAP (
          Op1 => Op1,
          Op2 => Op2,
          AluOp => AluOp,
          AluResult => AluResult
        );

 

   stim_proc: process
   begin		
      AluOp <= "000000";
		Op1 <= "00000000000000000000000000000001";
		Op2 <= "00000000000000000000000000000010";
		
		wait for 10 ns;
		  AluOp <= "000001";
		Op1 <= "00000000000000000000000000000001";
		Op2 <= "00000000000000000000000000000010";
		
		wait for 10 ns;
		
		  AluOp <= "000010";
		Op1 <= "00000000000000000000000000000001";
		Op2 <= "00000000000000000000000000000010";
		
		wait for 10 ns;
		
		  AluOp <= "000100";
		Op1 <= "00000000000000000000000000000010";
		Op2 <= "00000000000000000000000000000001";
		
		wait for 10 ns;
		
		  AluOp <= "100000";
		Op1 <= "00000000000000000000000000000001";
		Op2 <= "00000000000000000000000000000010";
		
		wait for 10 ns;
		
      wait;
   end process;

END;
