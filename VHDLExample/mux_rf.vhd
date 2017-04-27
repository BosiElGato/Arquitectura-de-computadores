
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity muxRFDest is
    Port ( nrd : in  STD_LOGIC_VECTOR (5 downto 0);
           registroO7 : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDestSel : in  STD_LOGIC;
           RFDest : out  STD_LOGIC_VECTOR (5 downto 0));
end muxRFDest;

architecture arqMuxRFDest of muxRFDest is

begin
	process(nrd,registroO7,RFDestSel)
	begin
		if(RFDestSel = '1')then
			RFDest <= registroO7;
		else
			if(RFDestSel = '0')then
				RFDest <= nrd;
			end if;
		end if;
	end process;
end arqMuxRFDest;