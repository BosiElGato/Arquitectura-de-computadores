--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:34:10 03/30/2017
-- Design Name:   
-- Module Name:   C:/Users/utp.CRIE/Desktop/Bosielgato/FirstProcessor/TB_MUX.vhd
-- Project Name:  FirstProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux
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
 
ENTITY TB_MUX IS
END TB_MUX;
 
ARCHITECTURE behavior OF TB_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux
    PORT(
         Crs2 : IN  std_logic_vector(31 downto 0);
         Imm : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         Mux_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Imm : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal Mux_Out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux PORT MAP (
          Crs2 => Crs2,
          Imm => Imm,
          i => i,
          Mux_Out => Mux_Out
        );

 
 

   -- Stimulus process
   stim_proc: process
   begin		
	
	    Crs2 <="00000000000000000000000000001001";
       Imm <= "00000000000000000000000000000111";
       i <='1';
		 wait for 10 ns;
		 Crs2 <="00000000000000000000000000001001";
       Imm <= "00000000000000000000000000000111";
       i <='0';
		 wait for 10 ns;
	
	
      wait;
   end process;

END;
