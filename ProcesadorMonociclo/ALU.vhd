----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:52:53 04/21/2016 
-- Design Name: 
-- Module Name:    ALU - ALU_Arq 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( Crs1 : in  STD_LOGIC_VECTOR (31 downto 0);    -- salida rf
           Mux_Out : in  STD_LOGIC_VECTOR (31 downto 0); -- salida multiplexor
           Alu_out : out  STD_LOGIC_VECTOR (31 downto 0);  -- salida alu
           Alu_op : in  STD_LOGIC_VECTOR (5 downto 0));  -- salida uc, alu op
end ALU;

architecture ALU_Arq of ALU is

begin
	
	
	process(Crs1,Mux_Out,Alu_op)

	begin

		case Alu_op is
		
			when "000000" => -- Add
				Alu_out <= Crs1 + Mux_Out;
			
			when "000001" => -- And
				Alu_out <= Crs1 AND Mux_Out;
			
			when "000101" => -- And Negaado
				Alu_out <= NOT(Crs1 AND Mux_Out);
				
			when "000100" => -- Sub
				Alu_out <= Crs1 - Mux_Out;
			
			when "000010" => -- Or
				Alu_out <= Crs1 OR Mux_Out;
				
			when "000110" => -- Or Negado
				Alu_out <= NOT(Crs1 OR Mux_Out);
			
			when "000011" => -- Xor
				Alu_out <= Crs1 XOR Mux_Out;
			
			when "000111" => -- Xor Negado
				Alu_out <= NOT(Crs1 XOR Mux_Out);
			
			when others =>
				Alu_out <= (others=>'0');
				
		end case;
	end process;

end ALU_Arq;

