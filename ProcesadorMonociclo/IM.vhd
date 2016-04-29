----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:42:15 04/13/2016 
-- Design Name: 
-- Module Name:    IM - InstructionMemory 
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
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IM is
    Port ( 
			  --Clk : in STD_LOGIC;
			  Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           IMOut : out  STD_LOGIC_VECTOR (31 downto 0));
end IM;

architecture InstructionMemory of IM is

	type rom_type is array (0 to 31) of std_logic_vector (31 downto 0);
		
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom_type;
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;
	
	signal instructions : rom_type := InitRomFromFile("prueba.data");
	
begin
--Reset,Address, instructions)
	process(Reset,Address, instructions)--clk)
	begin
		--if(rising_edge(clk))then
			if(Reset = '1')then
				IMOut <= (others=>'0');
			else
				IMOut <= instructions(conv_integer(address(4 downto 0)));
			end if;
		--end if;
	end process;
end InstructionMemory;