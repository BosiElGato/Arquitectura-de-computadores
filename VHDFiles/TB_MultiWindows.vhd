
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY TB_MultiWindows IS
END TB_MultiWindows;
 
ARCHITECTURE behavior OF TB_MultiWindows IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MiltiWindow
    PORT(
         Rs1 : IN  std_logic_vector(4 downto 0);
         Rs2 : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         Cwp : IN  std_logic;
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         Ncwp : OUT  std_logic;
         Nrs1 : OUT  std_logic_vector(5 downto 0);
         Nrs2 : OUT  std_logic_vector(5 downto 0);
         Nrd : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd : std_logic_vector(4 downto 0) := (others => '0');
   signal Cwp : std_logic:='0';
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Ncwp : std_logic:='0';
   signal Nrs1 : std_logic_vector(5 downto 0);
   signal Nrs2 : std_logic_vector(5 downto 0);
   signal Nrd : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MiltiWindow PORT MAP (
          Rs1 => Rs1,
          Rs2 => Rs2,
          Rd => Rd,
          Cwp => Cwp,
          Op => Op,
          Op3 => Op3,
          Ncwp => Ncwp,
          Nrs1 => Nrs1,
          Nrs2 => Nrs2,
          Nrd => Nrd
        );



   -- Stimulus process
   stim_proc: process
   begin	
     Cwp <= '1';	
     Op <= "10";
	 Op3 <= "111100";
	 Rs1 <= "10000";
	 Rs2 <= "10001";
	 Rd <=  "10010";
	wait for 10 ns;
	
	Cwp <= '1';	
	Op <= "10";
	 Op3 <= "111101";
	  Op3 <= "111100";
	 Rs1 <= "10000";
	 Rs2 <= "10001";
	 Rd <=  "10010";
	wait for 10 ns;

      wait;
   end process;

END;
