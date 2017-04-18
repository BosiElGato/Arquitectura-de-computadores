
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PSR is
    Port ( NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
			  Rst : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
           Carry : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is
signal PSR_register :STD_LOGIC_VECTOR(31 DOWNTO 0):=(others =>'0');

begin
process(clk)
begin
	if (rising_edge(clk)) then 
		if (Rst = '1') then 
			carry <= '0';
		else
			PSR_register (23 downto 20) <= NZVC;
			carry<=PSR_register(20);
		end if;
	end if;
end process;

end Behavioral;

