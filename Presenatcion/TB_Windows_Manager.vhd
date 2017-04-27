
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Windows_Manager IS
END TB_Windows_Manager;
 
ARCHITECTURE behavior OF TB_Windows_Manager IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Windows_Manager
    PORT(
         Rs1 : IN  std_logic_vector(4 downto 0);
         Rs2 : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         Cwp : IN  std_logic_vector(1 downto 0);
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         Ncwp : OUT  std_logic_vector(1 downto 0);
         Nrs1 : OUT  std_logic_vector(5 downto 0);
         Nrs2 : OUT  std_logic_vector(5 downto 0);
         Nrd : OUT  std_logic_vector(5 downto 0);
         R7 : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd : std_logic_vector(4 downto 0) := (others => '0');
   signal Cwp : std_logic_vector(1 downto 0) := (others => '0');
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Ncwp : std_logic_vector(1 downto 0);
   signal Nrs1 : std_logic_vector(5 downto 0);
   signal Nrs2 : std_logic_vector(5 downto 0);
   signal Nrd : std_logic_vector(5 downto 0);
   signal R7 : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Windows_Manager PORT MAP (
          Rs1 => Rs1,
          Rs2 => Rs2,
          Rd => Rd,
          Cwp => Cwp,
          Op => Op,
          Op3 => Op3,
          Ncwp => Ncwp,
          Nrs1 => Nrs1,
          Nrs2 => Nrs2,
          Nrd => Nrd,
          R7 => R7
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin	
		
		Op3 <= "111100";
		Op <= "10";
		Cwp <= "00";
		Rs1 <= "10000";
		Rs2 <= "10000";
		Rd <= "10000";
		wait for 40 ns;
		
		Op3 <= "111101";
		Op <= "10";
		Cwp <= "01";
		Rs1 <= "10000";
		Rs2 <= "11111";
		Rd <= "11000";
		wait for 40 ns;
		
		Op3 <= "111100";
		Op <= "10";
		Cwp <= "00";
		Rs1 <= "10000";
		Rs2 <= "11111";
		Rd <= "11000";
		wait for 40 ns;
		
     

      wait;
   end process;

END;
