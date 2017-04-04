
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Extention_signal is
    Port ( In1 : in  STD_LOGIC_VECTOR (12 downto 0);
           Out1 : out  STD_LOGIC_VECTOR (31 downto 0));
end Extention_signal;

architecture Behavioral of Extention_signal is

begin
process(In1)
	begin
		if(In1(12) = '1')then
			Out1(12 downto 0) <= In1;
			Out1(31 downto 13) <= (others=>'1');
		else
			Out1(12 downto 0) <= In1;
			Out1(31 downto 13) <= (others=>'0');
		end if;
	end process;

end Behavioral;

