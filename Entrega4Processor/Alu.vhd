
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Alu is
    Port ( Op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
			  carry : in std_logic;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Behavioral of Alu is

begin
process (Op1,Op2,AluOp)
begin
	case (AluOp) is 
		-- ADD
			when "000000" => AluResult <= Op1 + Op2;
			-- ADDcc
			when "010000" => AluResult <= Op1 + Op2;
			-- ADDX
			when "001000" => AluResult <= Op1 + Op2 + carry;
			--ADDXcc
			when "011000" => AluResult <= Op1 + Op2 + carry;
			
			-- SUB
			when "000100" => AluResult <= Op1 - Op2;
			-- SUBcc
			when "010100" => AluResult <= Op1 - Op2;
			-- SUBX
			when "001100" => AluResult <= Op1 - Op2 - carry;
			--SUBXcc
			when "011100" => AluResult <= Op1 - Op2 - carry;
			
			-- AND
			when "000001" => AluResult <= Op1 and Op2;
			-- ANDcc
			when "010001" => AluResult <= Op1 and Op2;
			-- ANDN
			when "000101" => AluResult <= Op1 nand Op2;
			-- ANDNcc
			when "010101" => AluResult <= Op1 nand Op2;
			
			-- OR
			when "000010" => AluResult <= Op1 or Op2;
			-- ORcc
			when "010010" => AluResult <= Op1 or Op2;
			-- ORN
			when "000110" => AluResult <= Op1 nor Op2;
			-- ORNcc
			when "010110" => AluResult <= Op1 nor Op2;
			
			-- XOR
			when "000011" => AluResult <= Op1 xor Op2;
			-- XORcc
			when "010011" => AluResult <= Op1 xor Op2;
			-- XNOR
			when "000111" => AluResult <= Op1 xnor Op2;
			-- XNORcc
			when "010111" => AluResult <= Op1 xnor Op2;
			
			--SAVE 57
			when "111100" => AluResult <= Op1 + Op2;
			--RESTORE 58
			when "111101" => AluResult <= Op1 + Op2;
				
			when others => AluResult <= (others=>'0');
	end case;
end process;	
	
			
end Behavioral;

