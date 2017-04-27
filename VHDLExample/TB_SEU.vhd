LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_seu IS
END tb_seu;
 
ARCHITECTURE behavior OF tb_seu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ExtenSigno
    PORT(
         Inmediato : IN  std_logic_vector(12 downto 0);
         Out_Exten : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Inmediato : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal Out_Exten : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
 
BEGIN
   uut: ExtenSigno PORT MAP (
          Inmediato => Inmediato,
          Out_Exten => Out_Exten
        );

   stim_proc: process
   begin		
		
		Inmediato <= "1000000000111";		
      wait for 20 ns;	
		
		Inmediato <= "0000000001011";		
      wait for 20 ns;	
      wait;
   end process;

END;