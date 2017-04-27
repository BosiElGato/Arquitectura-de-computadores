
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Register_File is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           Rd : in  STD_LOGIC_VECTOR (5 downto 0);
           Rst : in  STD_LOGIC;
           Dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Behavioral of Register_File is

type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
signal registers : ram_type :=(others => x"00000000");

begin
process(Rs1,Rs2,Rd,Rst,Dwr,registers)
begin
	if(Rst='1')then
		CRs1 <= "00000000000000000000000000000000";
		CRs2 <= "00000000000000000000000000000000";
	else 
		CRs1 <= registers(conv_integer(Rs1));
		CRs2 <= registers(conv_integer(Rs2));
		registers(conv_integer(Rd)) <= Dwr;
	end if;
	
end process;

	

end Behavioral;

