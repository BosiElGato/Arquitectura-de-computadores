
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
					when "000011" => AluOp <= "000011"; --XOR
					when "000111" =>AluOp <= "000111"; --XNOR
					when others => AluOp <="111111";
			end case;
	when others => AluOp <="111111";
	end case;
end process;

end Behavioral;

