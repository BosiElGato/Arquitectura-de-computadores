
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unity is
    Port ( Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Op : in  STD_LOGIC_VECTOR (1 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0));
end Control_Unity;

architecture Behavioral of Control_Unity is

begin

process(Op3,Op)

begin

case(Op) is
	when ("10") =>
			case(Op3) is 
					when "000000" => AluOp <= "000000"; --ADD
					when "000010"=> AluOp <= "000010"; --OR
					when "000100" =>AluOp <= "000100"; --SUB
					when "000001"=> AluOp <= "000001"; --AND
					when "000101" =>AluOp <= "000101"; --ANDN
					when "000110" =>AluOp <= "000110"; --ORn
					when "000011" => AluOp <="000011"; --XOR
					when "000111" =>AluOp <= "000111"; --XNOR
					when "010001" =>AluOp <= "010001"; --ANDcc
					when "010000" =>AluOp <= "010000"; --ADDcc
					when "010100" =>AluOp <= "010100"; --SUBcc
					when "011000" =>AluOp <= "011000"; --ADDXcc
					when "011100" =>AluOp <= "011100";--SUBxcc
					when "001000" =>AluOp <= "001000";--ADDx
					when "001100" =>AluOp <= "001100";--SUBx
					when "010101" =>AluOp <= "010101";--ANDNcc
					when "010010" =>AluOp <= "010010"; --ORcc
					when "010110" =>AluOp <= "010110"; --ORNcc
					when "010011" =>AluOp <= "010011"; --XORcc
					when "010111" =>AluOp <= "010111"; --XNORcc
					when "100101" =>AluOp <= "100101";--SLL Shift Left Logical 
					when "100110" =>AluOp <= "100110";--SRL Shift Right Logical 
					when "111100" =>AluOp <= "111100";--Save
					when "111101" =>AluOp <= "111101";--RESTORE
					when others => AluOp <="111111";
			end case;
	when others => AluOp <="111111";
	end case;
end process;

end Behavioral;

