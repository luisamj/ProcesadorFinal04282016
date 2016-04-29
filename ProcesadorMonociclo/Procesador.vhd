----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:28:16 04/26/2016 
-- Design Name: 
-- Module Name:    ProcesadorM - Arq_ProecesadorM 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProcesadorM is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Pro_out : out  STD_LOGIC_VECTOR (31 downto 0));
end ProcesadorM;

architecture Arq_ProecesadorM of ProcesadorM is

COMPONENT Adder
	PORT(
		NPC_OUT : IN std_logic_vector(31 downto 0);          
		NPC_IN : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
COMPONENT NPC
	PORT(
		Reset : IN std_logic;
		Din : IN std_logic_vector(31 downto 0);
		Clk : IN std_logic;          
		Dout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
		
COMPONENT IM
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;          
		IMOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT UnidadControl
	PORT(
		Op_In : IN std_logic_vector(1 downto 0);
		OP3_In : IN std_logic_vector(5 downto 0);          
		AluOp : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

COMPONENT Register_file
	PORT(
		reset : IN std_logic;
		RS1 : IN std_logic_vector(4 downto 0);
		RS2 : IN std_logic_vector(4 downto 0);
		RD : IN std_logic_vector(4 downto 0);
		DW : IN std_logic_vector(31 downto 0);          
		CRS1 : OUT std_logic_vector(31 downto 0);
		CRS2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Mux
	PORT(
		Seu_out : IN std_logic_vector(31 downto 0);
		CRs2 : IN std_logic_vector(31 downto 0);
		Im : IN std_logic;          
		Mux_Out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Seu
	PORT(
		Seu_in : IN std_logic_vector(12 downto 0);          
		Seu_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU
	PORT(
		Crs1 : IN std_logic_vector(31 downto 0);
		Mux_Out : IN std_logic_vector(31 downto 0);
		Alu_op : IN std_logic_vector(5 downto 0);          
		Alu_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
signal AddertoNPC, NPCtoPC, PCtoIM, IMtoURS, ALUreult,RFtoALU, RFtoMUX, SEUtoMUX, MUXtoALU:STD_LOGIC_VECTOR (31 downto 0);
signal ALUoptoALU:STD_LOGIC_VECTOR (5 downto 0);

begin

Inst_Adder: Adder PORT MAP(
		NPC_OUT => NPCtoPC,
		NPC_IN => AddertoNPC 
	);


Inst_NPC: NPC PORT MAP(
		Reset => reset,
		Din => AddertoNPC,
		Dout => NPCtoPC,
		Clk => Clk
	);
	
Inst_PC: NPC PORT MAP(
		Reset => reset,
		Din => AddertoNPC,
		Dout => PCtoIM,
		Clk => Clk
	);
	

	Inst_IM: IM PORT MAP(
		Address => PCtoIM,
		Reset => reset,
		IMOut => IMtoURS
	);
	
Inst_UnidadControl: UnidadControl PORT MAP(
		Op_In => IMtoURS(31 downto 30),
		OP3_In => IMtoURS(24 downto 19),
		AluOp => ALUoptoALU
	);
	
	Inst_Register_file: Register_file PORT MAP(
		reset =>reset,
		RS1 => IMtoURS(18 downto 14),
		RS2 => IMtoURS(4 downto 0),
		RD => IMtoURS(29 downto 25),
		DW => ALUreult,
		CRS1 => RFtoALU,
		CRS2 => RFtoMUX
	);
	
	Inst_Mux: Mux PORT MAP(
		Seu_out => SEUtoMUX,
		CRs2 => RFtoMUX,
		Im => IMtoURS(13),--Bit "i"
		Mux_Out => MUXtoALU
	);
	
	Inst_Seu: Seu PORT MAP(
		Seu_in => IMtoURS(12 downto 0) ,
		Seu_out =>SEUtoMUX 
	);
	
	Inst_ALU: ALU PORT MAP(
		Crs1 => RFtoALU,
		Mux_Out =>  MUXtoALU,
		Alu_out => ALUreult,
		Alu_op => ALUoptoALU
	);
	
	Pro_out <= ALUreult;

	
	


	
end Arq_ProecesadorM;
	
	
	
	