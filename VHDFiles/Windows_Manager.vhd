
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity Windows_Manager is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           Cwp : in  STD_LOGIC_VECTOR (1 downto 0);
           Op : in  STD_LOGIC_VECTOR(1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Ncwp : out  STD_LOGIC_VECTOR(1 downto 0);
           Nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           Nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           Nrd : out  STD_LOGIC_VECTOR (5 downto 0);
			  R7  : out  STD_LOGIC_VECTOR (5 downto 0));
end Windows_Manager;

architecture Behavioral of Windows_Manager is
 signal Int_Rs1,Int_Rs2,Int_Rd : integer range 0 to 39;
 signal Aux_R7 : std_logic_vector(6 downto 0);
  signal Aux_Cwp : std_logic_vector(1 downto 0);
begin
	Aux_R7 <= Cwp * "10000";
	R7 <= Aux_R7(5 downto 0) +"001111";
	
	process(Rs1,Rs2,Rd,Cwp,Op,Op3,Cwp,Aux_Cwp)
	begin 
			--Si entra un Save o un Restore entonces:
		if ((Op3 ="111100" or Op3="111101") and Op ="10")then 
			--Si estamos en la ventana cero cambie a la ventana  uno 
			if(Cwp = "00") then
				Aux_Cwp <="01";
				Ncwp <="01";
			-- SI estamos en la ventana cero entonces cambie a la uno 
			elsif(Cwp ="01") then
				Aux_Cwp <= "00";
				Ncwp <="00";
			end if;
		else
		--Si no es el caso de save o restore quedese en la ventana que esta 
		
			Aux_Cwp <= Cwp;
			Ncwp    <= Cwp;
		end if;
		
		if(Rd >="00000" and Rd <="00111") then --Registros Globales
			--Resgistros Globales, permanecen igual 
			Int_Rd <= conv_integer(Rd); 
		elsif(Rd >="01000" and Rd <="01111") then--Registros de Salida
			--Si CWP se modifica, se modifican los resgistros en 16 +
			Int_Rd <= conv_integer(Rd)+(conv_integer(Aux_Cwp)*16);
		elsif(Rd>="10000" and Rd <="10111") then--Registros Locales
			--Si Cwp se modifica estos registros se modifican en 16 +
			Int_Rd <= conv_integer(Rd)+(conv_integer(Aux_Cwp)*16);
		elsif(Rd >="11000" and Rd <="11111") then--Resgistros de entrada 
			--Se Cwp se modifica estos registros se modifican en 16 -
			Int_Rd <= conv_integer(Rd)- (conv_integer(Aux_Cwp)*16);
		end if;
		
		if(Rs1 >="00000" and Rs1 <="00111") then --Registros Globales
			--Resgistros Globales, permanecen igual 
			Int_Rs1 <= conv_integer(Rs1); 
		elsif(Rs1 >="01000" and Rs1 <="01111") then--Registros de Salida
			--Si CWP se modifica, se modifican los resgistros en 16 +
			Int_Rs1 <= conv_integer(Rs1)+(conv_integer(Cwp)*16);
		elsif(Rs1>="10000" and Rs1 <="10111") then--Registros Locales
			--Si Cwp se modifica estos registros se modifican en 16 +
			Int_Rs1 <= conv_integer(Rs1)+(conv_integer(Cwp)*16);
		elsif(Rs1 >="11000" and Rs1 <="11111") then--Resgistros de entrada 
			--Se Cwp se modifica estos registros se modifican en 16 -
				Int_Rs1 <= conv_integer(Rs1)- (conv_integer(Cwp)*16);
		end if;
		
		if(Rs2 >="00000" and Rs2 <="00111") then --Registros Globales
			--Resgistros Globales, permanecen igual 
			Int_Rs2 <= conv_integer(Rs2); 
		elsif(Rs2 >="01000" and Rs2 <="01111") then--Registros de Salida
			--Si CWP se modifica, se modifican los resgistros en 16 +
			Int_Rs2 <= conv_integer(Rs2)+(conv_integer(Cwp)*16);
		elsif(Rs2>="10000" and Rs2 <="10111") then--Registros Locales
			--Si Cwp se modifica estos registros se modifican en 16 +
			Int_Rs2 <= conv_integer(Rs2)+(conv_integer(Cwp)*16);
		elsif(Rs2 >="11000" and Rs2 <="11111") then--Resgistros de entrada 
			--Se Cwp se modifica estos registros se modifican en 16 -
				Int_Rs2 <= conv_integer(Rs2)- (conv_integer(Cwp)*16);
		end if;
	end process;
	Nrd <= conv_std_logic_vector(Int_Rd,6);
	Nrs1 <= conv_std_logic_vector(Int_Rs1,6);
	Nrs2 <= conv_std_logic_vector(Int_Rs2,6);
end Behavioral;

