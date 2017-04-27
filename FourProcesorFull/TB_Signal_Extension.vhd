
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Signal_Extension IS
END TB_Signal_Extension;
 
ARCHITECTURE behavior OF TB_Signal_Extension IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Extention_signal
    PORT(
         In1 : IN  std_logic_vector(12 downto 0);
         Out1 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal In1 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal Out1 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Extention_signal PORT MAP (
          In1 => In1,
          Out1 => Out1
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      In1 <= "0111111111111";
      wait for 10 ns;
		In1 <= "1000000000000";
      wait for 10 ns;
   end process;

END;
