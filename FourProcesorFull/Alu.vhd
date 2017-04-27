
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
			when "100000" => AluResult <= Op1 + Op2;
			-- ADDcc
			when "100001" => AluResult <= Op1 + Op2;
			-- ADDX
			when "100010" => AluResult <= Op1 + Op2 + carry;
			--ADDXcc
			when "100011" => AluResult <= Op1 + Op2 + carry;
			
			-- SUB
			when "100100" => AluResult <= Op1 - Op2;
			-- SUBcc
			when "100101" => AluResult <= Op1 - Op2;
			-- SUBX
			when "100110" => AluResult <= Op1 - Op2 - carry;
			--SUBXcc
			when "100111" => AluResult <= Op1 - Op2 - carry;
			
			-- AND
			when "101000" => AluResult <= Op1 and Op2;
			-- ANDcc
			when "101001" => AluResult <= Op1 and Op2;
			-- ANDN
			when "101010" => AluResult <= Op1 nand Op2;
			-- ANDNcc
			when "101011" => AluResult <= Op1 nand Op2;
			
			-- OR
			when "101100" => AluResult <= Op1 or Op2;
			-- ORcc
			when "101101" => AluResult <= Op1 or Op2;
			-- ORN
			when "101110" => AluResult <= Op1 nor Op2;
			-- ORNcc
			when "101111" => AluResult <= Op1 nor Op2;
			
			-- XOR
			when "110000" => AluResult <= Op1 xor Op2;
			-- XORcc
			when "110001" => AluResult <= Op1 xor Op2;
			-- XNOR
			when "110010" => AluResult <= Op1 xnor Op2;
			-- XNORcc
			when "110011" => AluResult <= Op1 xnor Op2;
			
			--SAVE 57
			when "111001" => AluResult <= Op1 + Op2;
			--RESTORE 58
			when "111010" => AluResult <= Op1 + Op2;
				
			when others => AluResult <= (others=>'1');
	end case;
end process;	
	
			
end Behavioral;

