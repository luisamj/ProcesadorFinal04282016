----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:40 04/20/2016 
-- Design Name: 
-- Module Name:    Adder - Sum 
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

entity Adder is
    Port ( NPC_OUT : in  STD_LOGIC_VECTOR (31 downto 0);
           NPC_IN : out  STD_LOGIC_VECTOR (31 downto 0));
end Adder;

architecture Sum of Adder is

begin
	process(NPC_OUT)
	
	begin
		NPC_IN <= "0001" + NPC_OUT;
	end process;

end Sum;

