--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:35:18 10/24/2016
-- Design Name:   
-- Module Name:   D:/Juan/U/Arquitectura/Procesador4/Procesador4/TB_registerFile.vhd
-- Project Name:  Procesador4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegisterFile
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_registerFile IS
END TB_registerFile;
 
ARCHITECTURE behavior OF TB_registerFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         registerSource1 : IN  std_logic_vector(5 downto 0);
         registerSource2 : IN  std_logic_vector(5 downto 0);
         registerDestination : IN  std_logic_vector(5 downto 0);
         reset : IN  std_logic;
         dataToWrite : IN  std_logic_vector(31 downto 0);
         contentRegisterSource1 : OUT  std_logic_vector(31 downto 0);
         contentRegisterSource2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal registerSource1 : std_logic_vector(5 downto 0) := (others => '0');
   signal registerSource2 : std_logic_vector(5 downto 0) := (others => '0');
   signal registerDestination : std_logic_vector(5 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal dataToWrite : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal contentRegisterSource1 : std_logic_vector(31 downto 0);
   signal contentRegisterSource2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          registerSource1 => registerSource1,
          registerSource2 => registerSource2,
          registerDestination => registerDestination,
          reset => reset,
          dataToWrite => dataToWrite,
          contentRegisterSource1 => contentRegisterSource1,
          contentRegisterSource2 => contentRegisterSource2
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
     	reset <= '1';
		
      wait for 40 ns;
		
		
		--no importan rs1 ni rs2, en registerDestination se guarda lo que esté en dataToWrite
		reset <= '0';
		registerSource1 <= "001000";
		registerSource2 <= "000000";
		registerDestination <= "000001";
		dataToWrite <= "00000000000000000000000000001000";

      wait for 40 ns;	
		
		reset <= '0';
		registerSource1 <= "000001";
		registerSource2 <= "000000";
		registerDestination <= "000010";
		dataToWrite <= "00000000000000000000000000001000";

      wait for 40 ns;

      wait;
   end process;

END;
