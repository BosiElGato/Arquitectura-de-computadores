
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MiltiWindow is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR  (4 downto 0);
           Cwp : in  STD_LOGIC;
           Op : in  STD_LOGIC_VECTOR  (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR   (5 downto 0);
           Ncwp : out  STD_LOGIC;
           Nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           Nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           Nrd : out  STD_LOGIC_VECTOR  (5 downto 0));
end MiltiWindow;

architecture Behavioral of MiltiWindow is
--SE CREAN LAS SEÑALES PARA LAS NUEVAS SALIDAS 
signal IntRs1,IntRs2,IntRd: integer range 0 to 39 :=0;
signal InRestore : STD_LOGIC:='0';


begin
process(Rs1,Rs2,Rd,Cwp,op,Op3)
begin



--RESPRESENTA EL NUEVO VALOR DE CWP DEPENDIENDO DE LA OPERACION QUE SE ESTE REALIZANDO

		if(op = "10" and op3 ="111100") then --Save
			Ncwp <= not(Cwp);
		else
			if(op = "10" and op3 ="111101") then --Restore
			Ncwp <= Cwp;
			InRestore <= '1';			
			
			end if;
		end if;
		
		--cuando entra un restore rs1 y rs2 se quedan con el mismo valor que tienen pero 
		--rd toma el nuevo valor para la otra ventana
--REPRESENTA EL NUEVO VALOR DE DE REGISTRO DE SALIDA 1 DEPENDIENDO DE LA VENTANA EN QUE SE ESTE TRABAJANDO
if(Ncwp = '1') then 
	if(Rs1 >="00000" and Rs1 <="00111") then 
		IntRs1 <= conv_integer(Rs1);
	else
		if(Rs1 >="11000" and Rs1 <="11111") then
			IntRs1 <= conv_integer(Rs1)-(conv_integer(Cwp)*16);
		else
			if(Rs1 >="10000" and Rs1 <="10111") then 
				IntRs1 <= conv_integer(Rs1)+(conv_integer(Cwp)*16);
			else
				if(Rs1>="01000" and Rs1 <="01111") then 
					IntRs1 <= conv_integer(Rs1)+(conv_integer(Cwp)*16);
				end if;
			end if;
		end if;
	 end if;

--REPRESENTA EL NUEVO VALOR DE DE REGISTRO DE SALIDA 2 DEPENDIENDO DE LA VENTANA EN QUE SE ESTE TRABAJANDO	
	 if(Rs2 >="00000" and Rs2 <="00111") then 
		IntRs2 <= conv_integer(Rs2);
	else
		if(Rs2 >="11000" and Rs2 <="11111") then
			IntRs2 <= conv_integer(Rs2)-(conv_integer(Cwp)*16);
		else
			if(Rs2 >="10000" and Rs2 <="10111") then 
				IntRs2 <= conv_integer(Rs2)+(conv_integer(Cwp)*16);
			else
				if(Rs2>="01000" and Rs2 <="01111") then 
					IntRs2 <= conv_integer(Rs2)+(conv_integer(Cwp)*16);
				end if;
			end if;
		end if;
	 end if;

--REPRESENTA EL NUEVO VALOR DE DE REGISTRO DE DESTINO  DEPENDIENDO DE LA VENTANA EN QUE SE ESTE TRABAJANDO	
	 if(Rd >="00000" and Rd <="00111") then 
		IntRd <= conv_integer(Rd);
	else
		if(Rd >="11000" and Rd <="11111") then
			IntRd <= conv_integer(Rd)-(conv_integer(Cwp)*16);
		else
			if(Rd >="10000" and Rd <="10111") then 
				IntRd <= conv_integer(Rd)+(conv_integer(Cwp)*16);
			else
				if(Rd >="01000" and Rd <="01111") then 
					IntRd <= conv_integer(Rd)+(conv_integer(Cwp)*16);
				end if;
			end if;
		end if;
	 end if;
else
	IntRs1 <= conv_integer(Rd);
	IntRs2 <= conv_integer(Rd);
	IntRd <= conv_integer(Rd);
end if;
end process;

Nrs1<= conv_std_logic_vector(IntRs1,6);
Nrs2<= conv_std_logic_vector(IntRs2,6);
Nrd<= conv_std_logic_vector(IntRd,6);

end Behavioral;

