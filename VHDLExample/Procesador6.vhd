
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador6 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           outf : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador6;

architecture Behavioral of Procesador6 is


	COMPONENT UC
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		op2 : IN std_logic_vector(2 downto 0);
		icc : IN std_logic_vector(3 downto 0);
		cond : IN std_logic_vector(3 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0);
		rfdest : OUT std_logic;
		rfsource : OUT std_logic_vector(1 downto 0);
		wrEnMem : OUT std_logic;
		pcSource : OUT std_logic_vector(1 downto 0);
		wrEnRF : OUT std_logic
		);
	END COMPONENT;

	
	COMPONENT ExtenSigno
	PORT(
		Inmediato : IN std_logic_vector(12 downto 0);          
		Out_Exten : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT Multiplexor
	PORT(
		In1 : IN std_logic_vector(31 downto 0);
		In2 : IN std_logic_vector(31 downto 0);
		Sc : IN std_logic;          
		Sout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU22
	PORT(
		Ext_in : IN std_logic_vector(21 downto 0);          
		Ext_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		carry : IN std_logic;
		ALUOP : IN std_logic_vector(5 downto 0);          
		ALUResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PSRModifier
	PORT(
		ALUResult : IN std_logic_vector(31 downto 0);
		oper131 : IN std_logic;
		oper231 : IN std_logic;
		rst : IN std_logic;
		ALUOP : IN std_logic_vector(5 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PSR
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		nzvc : IN std_logic_vector(3 downto 0);
		ncwp : IN std_logic;          
		cwp : OUT std_logic;
		icc : out STD_LOGIC_VECTOR(3 downto 0);
		carry : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT ProgramCounter
	PORT(
		clk : IN std_logic;
		Reset : IN std_logic;
		EntAddress : IN std_logic_vector(31 downto 0);          
		SalAddress : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RegisterFile
	PORT(
		registerSource1 : IN std_logic_vector(5 downto 0);
		registerSource2 : IN std_logic_vector(5 downto 0);
		registerDestination : IN std_logic_vector(5 downto 0);
		reset : IN std_logic;
		writeEnable : IN std_logic;
		dataToWrite : IN std_logic_vector(31 downto 0);          
		contentRegisterSource1 : OUT std_logic_vector(31 downto 0);
		contentRegisterSource2 : OUT std_logic_vector(31 downto 0);
		contentRegisterDestination : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Sumador
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		S : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT WindowsManager
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		cwp : IN std_logic;
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		ncwp : OUT std_logic;
		nrs1 : OUT std_logic_vector(5 downto 0);
		nrs2 : OUT std_logic_vector(5 downto 0);
		nrd : OUT std_logic_vector(5 downto 0);
		RegO7: out  STD_LOGIC_VECTOR (5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT DataMemory
	PORT(
		address : IN std_logic_vector(4 downto 0);
		dato : IN std_logic_vector(31 downto 0);
		WE : IN std_logic;
		rst : IN std_logic;          
		DataToMem : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU30
	PORT(
		Ext_in : IN std_logic_vector(29 downto 0);          
		Ext_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT muxPCSource
	PORT(
		PCDisp30 : IN std_logic_vector(31 downto 0);
		PCDisp22 : IN std_logic_vector(31 downto 0);
		PC4 : IN std_logic_vector(31 downto 0);
		PCAddress : IN std_logic_vector(31 downto 0);
		PCSource : IN std_logic_vector(1 downto 0);          
		PCAddressOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT muxRFDest
	PORT(
		nrd : IN std_logic_vector(5 downto 0);
		registroO7 : IN std_logic_vector(5 downto 0);
		RFDestSel : IN std_logic;          
		RFDest : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT muxRFSource
	PORT(
		DatoFromMem : IN std_logic_vector(31 downto 0);
		AluResult : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);
		RFSource : IN std_logic_vector(1 downto 0);          
		RFData : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
	signal snpc, spc, smpc, ss_1, sim, smrfs, scrs1, scrs2, scrd,
	ses, sma, salu, sseu22, sseu30, ss_2,ss_3, sdm
	: std_logic_vector (31 downto 0);
	
	signal sicc_psr, snzvc 
	: std_logic_vector (3 downto 0);
	
	signal srfs_uc, spcs_uc
	: std_logic_vector (1 downto 0);
	
	signal snrs1, snrs2, sro7_wm, srd, snrd, saluop_uc
	: std_logic_vector (5 downto 0);
	
	signal scwp_pcr, sncwp_wm, srfd_uc, swerf_uc, swem_uc, sc_psr 
	
	: std_logic;
	
	
begin
	
	Inst_ProgramCounter: ProgramCounter PORT MAP(
		clk => clk,
		Reset => reset,
		EntAddress => snpc,
		SalAddress => spc
	);
		
		
	Inst_nProgramCounter: ProgramCounter PORT MAP(
		clk => clk,
		Reset => reset,
		EntAddress => smpc,
		SalAddress => snpc
	);
	
	Inst_Sumador1: Sumador PORT MAP(
		A => x"00000001",
		B => snpc,
		S => ss_1
	);
	
	Inst_instructionMemory: instructionMemory PORT MAP(
		address => spc,
		reset => reset,
		outInstruction => sim
	);
	
	


	Inst_WindowsManager: WindowsManager PORT MAP(
		rs1 => sim(18 downto 14),
		rs2 => sim(4 downto 0),
		rd => sim(29 downto 25),
		cwp => scwp_pcr,
		op => sim(31 downto 30),
		op3 => sim(24 downto 19),
		ncwp => sncwp_wm,
		nrs1 => snrs1,
		nrs2 => snrs2,
		nrd => srd,
		RegO7 => sro7_wm
	);
	
	Inst_muxRFDest: muxRFDest PORT MAP( --MuxRegister
		nrd => srd,
		registroO7 => sro7_wm,
		RFDestSel => srfd_uc,
		RFDest => snrd
	);
	
	Inst_RegisterFile: RegisterFile PORT MAP(
		registerSource1 => snrs1,
		registerSource2 => snrs2,
		registerDestination => snrd,
		reset => reset,
		writeEnable => swerf_uc,
		dataToWrite => smrfs,
		contentRegisterSource1 => scrs1,
		contentRegisterSource2 => scrs2,
		contentRegisterDestination => scrd
	);
	
	Inst_ExtenSigno_im: ExtenSigno PORT MAP(
		Inmediato => sim(12 downto 0),
		Out_Exten =>  ses
	);
	
	
	Inst_Multiplexor: Multiplexor PORT MAP(--MuxAlu
		In1 => scrs2,
		In2 => ses,
		Sc => sim(13),
		Sout => sma
	);
	
	Inst_UC: UC PORT MAP(
		op => sim(31 downto 30),
		op3 => sim(24 downto 19),
		op2 => sim(24 downto 22),
		icc => sicc_psr,
		cond => sim(28 downto 25),
		ALUOP => saluop_uc,
		rfdest => srfd_uc,
		rfsource => srfs_uc,
		wrEnMem => swem_uc,
		pcSource => spcs_uc,
		wrEnRF => swerf_uc
	);
	
	Inst_ALU: ALU PORT MAP(
		A => scrs1,
		B => sma,
		carry => sc_psr ,
		ALUOP => saluop_uc,
		ALUResult => salu
	);

	
	Inst_PSRModifier: PSRModifier PORT MAP(
		ALUResult => salu,
		oper131 => scrs1(31),
		oper231 => sma(31),
		rst => reset,
		ALUOP => saluop_uc,
		nzvc =>  snzvc 
	);
	
	Inst_PSR: PSR PORT MAP(
		rst => reset,
		clk => clk,
		nzvc => snzvc,
		ncwp => sncwp_wm,
		cwp => scwp_pcr,
		icc => sicc_psr,
		carry => sc_psr 
	);
	
	Inst_SEU22: SEU22 PORT MAP(
		Ext_in => sim(21 downto 0),
		Ext_out => sseu22 
	);


	Inst_SEU30: SEU30 PORT MAP(
		Ext_in => sim(29 downto 0),
		Ext_out => sseu30
	);
	
	Inst_Sumador2: Sumador PORT MAP(
		A => spc,
		B => sseu22,
		S => ss_2
	);
	
	Inst_Sumador3: Sumador PORT MAP(
		A => sseu30,
		B => spc,
		S => ss_3
	);
	
	Inst_muxPCSource: muxPCSource PORT MAP(
		PCDisp30 => ss_3,
		PCDisp22 => ss_2,
		PC4 => ss_1,
		PCAddress => salu,
		PCSource => spcs_uc,
		PCAddressOut => smpc
	);
	
	Inst_DataMemory: DataMemory PORT MAP(
		address => salu(4 downto 0),
		dato => scrd,
		WE => swem_uc,
		rst => reset,
		DataToMem => sdm
	);
	
	
	Inst_muxRFSource: muxRFSource PORT MAP(--MuxRfSource
		DatoFromMem => sdm,
		AluResult => salu,
		PC => spc,
		RFSource => srfs_uc,
		RFData => smrfs
	);

outf <= smrfs;

end Behavioral;

