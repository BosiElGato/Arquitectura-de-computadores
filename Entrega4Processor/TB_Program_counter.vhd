
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Program_counter IS
END TB_Program_counter;
 
ARCHITECTURE behavior OF TB_Program_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Program_Counter
    PORT(
         Data_In : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         Clk : IN  std_logic;
         Data_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Data_In : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Data_Out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Program_Counter PORT MAP (
          Data_In => Data_In,
          rst => rst,
          Clk => Clk,
          Data_Out => Data_Out
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
    Data_In <= "00000000000000000000000000000001";
	 rst <= '0';
	 wait for 20 ns;
	 Data_In <= "00000000000000000000000000000010";
	 rst <= '0';
	 wait for 20 ns;
	 Data_In <= "00000000000000000000000000000011";
	 rst <= '0';
	 wait for 20 ns;
	 Data_In <= "00000000000000000000000000000100";
	 rst <= '0';
	 wait for 20 ns;
	 Data_In <= "00000000000000000000000000000101";
	 rst <= '0';
	 wait for 20 ns;
	 Data_In <= "00000000000000000000000000000110";
	 rst <= '0';
	 wait for 20 ns;
	  Data_In <= "00000000000000000000000000000001";
	 rst <= '1';
	 wait for 20 ns;
	 Data_In <= "00000000000000000000000000000010";
	 rst <= '1';
      wait;
   end process;

END;
