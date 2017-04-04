
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Next_Program_Counter is
Port ( Data_In : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Data_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end Next_Program_Counter;

architecture Behavioral of Next_Program_Counter is
signal Data_aux:STD_LOGIC_VECTOR(31 downto 0);

begin

process (Clk)
begin

if (rising_edge (Clk)) then 
  if(rst = '0') then
		Data_aux <= Data_In;
	else
		Data_aux <= "00000000000000000000000000000000";
	end if;
end if;

end process;
Data_Out <=Data_aux;

end Behavioral;

