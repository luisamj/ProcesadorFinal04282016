----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:44:54 04/21/2016 
-- Design Name: 
-- Module Name:    Seu - Seu_Arq 
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

entity Seu is
    Port ( Seu_in : in  STD_LOGIC_VECTOR (12 downto 0);
           Seu_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Seu;

architecture Seu_Arq of Seu is

begin
process(Seu_in)
	begin
		if(Seu_in(12) = '1')then
			Seu_out(12 downto 0) <= Seu_in;
			Seu_out(31 downto 13) <= (others=>'1');
		else
			Seu_out(12 downto 0) <= Seu_in;
			Seu_out(31 downto 13) <= (others=>'0');
		end if;
	end process;
end Seu_Arq;