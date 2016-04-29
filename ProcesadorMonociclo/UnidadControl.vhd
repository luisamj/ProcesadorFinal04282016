----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:37:19 04/21/2016 
-- Design Name: 
-- Module Name:    UnidadControl - UC_Arq 
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
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UnidadControl is
    Port ( Op_In : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3_In : in  STD_LOGIC_VECTOR (5 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0));
end UnidadControl;

architecture UC_Arq of UnidadControl is

begin

process(Op_In ,OP3_In)

	begin

		if (Op_In  = "10") then
		
			case OP3_In is
			
				when "000000" => -- ADD
					AluOp <= "000000";
				
				when "000001" => -- AND
					AluOp <= "000001";
				
				when "000101" => -- AND NEGADO
					AluOp <= "000101";
					
				when "000100" => -- SUBB
					AluOp <= "000100";
				
				when "000010" => -- OR
					AluOp <= "000010";
					
				when "000110" => -- OR NEGADO
					AluOp <= "000110";
				
				when "000011" => -- XOR
					AluOp <= "000011";
				
				when "000111" => -- XOR NEGADO
					AluOp <= "000111";
				
				when others =>
					AluOp <= "111111";
					
			end case;
		
		end if;
		
	end process;
end UC_Arq;

