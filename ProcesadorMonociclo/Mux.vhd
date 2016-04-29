----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:51:13 04/21/2016 
-- Design Name: 
-- Module Name:    Mux - Mux_Arq 
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

entity Mux is
    Port ( Seu_out : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Im : in  STD_LOGIC;
           Mux_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux;

architecture Mux_Arq of Mux is

begin

process(Seu_out,CRs2,Im)

	begin
		
		if (Im = '0') then
			Mux_Out <= CRs2;
		else
			Mux_Out <= Seu_out;
		end if;

	end process;

end Mux_Arq;