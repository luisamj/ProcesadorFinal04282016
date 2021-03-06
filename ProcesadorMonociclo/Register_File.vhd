----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:47:28 04/24/2016 
-- Design Name: 
-- Module Name:    Register_file - Arq_RF 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_file is
    Port ( 
           reset : in  STD_LOGIC;
           RS1 : in  STD_LOGIC_VECTOR (4 downto 0);
           RS2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RD : in  STD_LOGIC_VECTOR (4 downto 0);
			  DW : in STD_LOGIC_VECTOR (31 downto 0);
           CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_file;

architecture Arqui_RF of Register_file is

	type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registers : ram_type :=(others => x"00000000");

begin
	process(reset,RS1,RS2,RD,DW)
	begin
		
			if(reset = '1')then
				CRS1 <= (others=>'0');
				CRS2 <= (others=>'0');
				registers <= (others => x"00000000");
			else
				CRS1 <= registers(conv_integer(RS1));
				CRS2  <= registers(conv_integer(RS2));
				if(RD /= "00000")then
					registers(conv_integer(RD)) <= DW;
				end if;
			end if;
		end process;
end Arqui_RF;