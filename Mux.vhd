
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Mux is
    Port ( Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Imm : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           Mux_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux;

architecture Behavioral of Mux is

begin
process(Crs2,Imm,i)
begin

if (i = '0') then 
	Mux_Out <= Crs2;
else
	Mux_Out <= Imm;
end if;
end process;
end Behavioral;

