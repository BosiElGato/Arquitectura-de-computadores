
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
		when "000000" =>
			AluResult <= Op1 + Op2; --ADD
		when "000010" =>
			AluResult <= Op1 or Op2; --OR
		when "000100" =>
			AluResult <= Op1 - Op2; --SuB
		when "000001" =>
			AluResult <= Op1 and Op2; --AND
		when "000101" =>
			AluResult <= Op1 and not(Op2); --ANDN
		when "000110" =>
			AluResult <= Op1 or not(Op2); ---ORN 
		when "000011" =>
			AluResult <= Op1 XOR Op2;--XOR
		when "000111" =>
			AluResult <= Op1 Xnor Op2;--XNOR
		when "010000" =>
			AluResult <= Op1 + Op2; --ADDcc
		when "010100" =>
			AluResult <= Op1 - Op2; --SUBcc
		when "011000" =>
			AluResult <= Op1 + Op2 + carry; --ADDXcc
		when others =>
			 AluResult <= (others => '0');
	end case;
end process;	
	
			
end Behavioral;

