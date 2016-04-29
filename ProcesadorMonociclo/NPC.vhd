----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:55:33 04/05/2016 
-- Design Name: 
-- Module Name:    NPC - Behavioral 
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

entity NPC is
    Port ( Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           Clk : in  STD_LOGIC);
end NPC;

architecture Behavioral of NPC is

begin

	process(Din, Reset, Clk)
	begin
		
		if(Reset = '1')then
			Dout <= "00000000000000000000000000000000";
		elsif(rising_edge(Clk))then
			Dout <= Din;
		end if;
	end process;
		


end Behavioral;

