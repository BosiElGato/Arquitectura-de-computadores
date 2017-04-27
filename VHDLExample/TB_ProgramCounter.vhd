
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_ProgramCounter IS
END TB_ProgramCounter;
 
ARCHITECTURE behavior OF TB_ProgramCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProgramCounter
    PORT(
         clk : IN  std_logic;
         Reset : IN  std_logic;
         EntAddress : IN  std_logic_vector(31 downto 0);
         SalAddress : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal EntAddress : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal SalAddress : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter PORT MAP (
          clk => clk,
          Reset => Reset,
          EntAddress => EntAddress,
          SalAddress => SalAddress
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
      
		EntAddress <="00000000000000000000000000000001";
		Reset <='0';
      wait for 40 ns;	
		
		EntAddress <="00010010000010100000000000000001";
		Reset <='1';
      wait for 40 ns;

 

      -- insert stimulus here 

      wait;
   end process;

END;
