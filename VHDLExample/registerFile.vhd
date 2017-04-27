library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;


entity RegisterFile is
    Port ( registerSource1 : in  STD_LOGIC_VECTOR (5 downto 0);
           registerSource2 : in  STD_LOGIC_VECTOR (5 downto 0);
           registerDestination : in  STD_LOGIC_VECTOR (5 downto 0);
           reset : in  STD_LOGIC;
			  writeEnable : in STD_LOGIC;
           dataToWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           contentRegisterSource1 : out  STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
           contentRegisterSource2 : out  STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
			  contentRegisterDestination : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
signal registros : ram_type := (others => x"00000000");

begin
	process(reset, registerSource1, registerSource2, registerDestination, dataToWrite)
		begin
			if reset = '1' then
				contentRegisterSource1 <= (others => '0');
				contentRegisterSource2 <= (others => '0');
				registros <= (others => x"00000000");
			else
				if (writeEnable = '1' and registerDestination/= "00000") then
					contentRegisterSource1 <= registros(conv_integer(registerSource1));
					contentRegisterSource2 <= registros(conv_integer(registerSource2));
					contentRegisterDestination <= registros(conv_integer(registerDestination));					
					registros(conv_integer(registerDestination)) <= dataToWrite;
				else
					contentRegisterSource1 <= registros(conv_integer(registerSource1));
					contentRegisterSource2 <= registros(conv_integer(registerSource2));
					contentRegisterDestination <= registros(conv_integer(registerDestination));
				end if;
			end if;
	end process;

end Behavioral;
