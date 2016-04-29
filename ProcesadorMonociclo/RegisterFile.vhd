----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:04:44 04/13/2016 
-- Design Name: 
-- Module Name:    RegisterFile - ArqRegisterFile 
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

entity RegisterFile is
    Port ( Rs : in  STD_LOGIC_VECTOR (4 downto 0);
           Rt : in  STD_LOGIC_VECTOR (4 downto 0);
           Dw : in  STD_LOGIC_VECTOR (31 downto 0);
           Rw : in  STD_LOGIC_VECTOR (4 downto 0);
           Rf_wr : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           CRs : out  STD_LOGIC_VECTOR (31 downto 0);
           Crt : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture ArqRegisterFile of RegisterFile is
Type registro is array (0 to 39)of std_logic_vector (31 downto 0);
signal rg : registro := (others => x"00000000");

begin
	CRs <= rg (conv_integer (Rs)); 
	CRt <= rg (conv_integer (Rt));

	process (clk, RF_WR, RW, DW)
		
		begin

			if rising_edge (clk) then
				if Rf_wr = '1' and Rw /= "00000" then
					rg (conv_integer (Rw)) <= DW;
				end if;
			end if;
			
	end process;

end ArqRegisterFile;

