
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH;
use IEEE.STD_LOGIC_UNSIGNED;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramCounter is
    Port ( clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           EntAddress : in  STD_LOGIC_VECTOR (31 downto 0);
           SalAddress : out  STD_LOGIC_VECTOR (31 downto 0)
			);
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin

	process(clk,Reset,EntAddress)
	
	begin
		if Reset = '1' then
			SalAddress <= "00000000000000000000000000000000";
		elsif (rising_edge(clk) and Reset = '0')then
			SalAddress <= EntAddress;
		end if;
	
	end process;

end Behavioral;

