
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY TB_Register_File IS
END TB_Register_File;
 
ARCHITECTURE behavior OF TB_Register_File IS 
 
 
    COMPONENT Register_File
    PORT(
         Rs1 : IN  std_logic_vector(4 downto 0);
         Rs2 : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         Rst : IN  std_logic;
         Dwr : IN  std_logic_vector(31 downto 0);
         CRs1 : OUT  std_logic_vector(31 downto 0);
         CRs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd : std_logic_vector(4 downto 0) := (others => '0');
   signal Rst : std_logic := '0';
   signal Dwr : std_logic_vector(31 downto 0) := (others => '0');

 	
   signal CRs1 : std_logic_vector(31 downto 0);
   signal CRs2 : std_logic_vector(31 downto 0);
   
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          Rs1 => Rs1,
          Rs2 => Rs2,
          Rd => Rd,
          Rst => Rst,
          Dwr => Dwr,
          CRs1 => CRs1,
          CRs2 => CRs2
        );

   -- Clock process definitions
   --<clock>_process :process
  -- begin
	--	<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
  -- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     Rs1 <= "00001";
	  Rs2 <= "00010";
	  Dwr <= "00000000000000000000000000001000";
	  Rd  <= "00011";
	  Rst <= '0';
		wait for 20 ns ;
		Rst <= '1';
	  wait;
   end process;

END;
