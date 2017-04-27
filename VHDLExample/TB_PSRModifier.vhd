--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:33:44 10/25/2016
-- Design Name:   
-- Module Name:   D:/Juan/U/Arquitectura/Procesador4/Procesador4/TB_PSRModifier.vhd
-- Project Name:  Procesador4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSRModifier
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
 
ENTITY TB_PSRModifier IS
END TB_PSRModifier;
 
ARCHITECTURE behavior OF TB_PSRModifier IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSRModifier
    PORT(
         ALUResult : IN  std_logic_vector(31 downto 0);
         oper131 : IN  std_logic;
         oper231 : IN  std_logic;
         rst : IN  std_logic;
         ALUOP : IN  std_logic_vector(5 downto 0);
         nzvc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALUResult : std_logic_vector(31 downto 0) := (others => '0');
   signal oper131 : std_logic := '0';
   signal oper231 : std_logic := '0';
   signal rst : std_logic := '0';
   signal ALUOP : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal nzvc : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSRModifier PORT MAP (
          ALUResult => ALUResult,
          oper131 => oper131,
          oper231 => oper231,
          rst => rst,
          ALUOP => ALUOP,
          nzvc => nzvc
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
		oper131 <= '1';
		oper231 <= '1';
		ALUOP <= "001001";
		ALUResult <= X"00000011";
      wait for 100 ns;
		
		--sumas
		rst <= '0';
		oper131 <= '1';
		oper231 <= '1';
		ALUOP <= "001001";
		ALUResult <= X"00000011";
      wait for 100 ns;
		
		rst <= '0';
		oper131 <= '1';
		oper231 <= '1';
		ALUOP <= "000000";
		ALUResult <= X"00000011";
      wait for 100 ns;
		
		oper131 <= '1';
		oper231 <= '1';
		ALUOP<= "001010";
		ALUResult <= X"00000011";
      wait for 100 ns;
		
		--restas
		oper131 <= '1';
		oper231 <= '0';
		ALUOP <= "001100";
		ALUResult <= X"00000011";
      wait for 100 ns;
		
		oper131 <= '0';
		oper231 <= '1';
		ALUOP <= "001101";
		ALUResult <= X"00000011";
      wait for 100 ns;
		
		--logicos
		oper131 <= '1';
		oper231 <= '1';
		ALUOP <= "001110";
		ALUResult <= X"00000011";
      wait for 100 ns;
		
		oper131 <= '1';
		oper231<= '0';
		ALUOP <= "010010";
		ALUResult <= X"00000011";
      wait for 100 ns;
      wait;
   end process;

END;
