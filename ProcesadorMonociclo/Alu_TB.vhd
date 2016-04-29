--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:17:22 04/26/2016
-- Design Name:   
-- Module Name:   C:/Users/LuisaM/Documents/Universidad/Arq computadores/ProcesadorMonociclo/Alu_TB.vhd
-- Project Name:  ProcesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Alu_TB IS
END Alu_TB;
 
ARCHITECTURE behavior OF Alu_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Crs1 : IN  std_logic_vector(31 downto 0);
         Mux_Out : IN  std_logic_vector(31 downto 0);
         Alu_out : OUT  std_logic_vector(31 downto 0);
         Alu_op : IN  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Mux_Out : std_logic_vector(31 downto 0) := (others => '0');
   signal Alu_op : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Alu_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
-- 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Crs1 => Crs1,
          Mux_Out => Mux_Out,
          Alu_out => Alu_out,
          Alu_op => Alu_op
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 
			Crs1 <= "00000000000000000000000000000000";
         Mux_Out <= "11111111111111111111111111101100";
         Alu_op <= "000010";
			
			wait for 20 ns;
			Crs1 <= "00000000000000000000000000000000";
         Mux_Out <= "11111111111111111111111111101100";
         Alu_op <= "000100";
			
			
			wait for 20 ns;
			Crs1 <= "00000000000000000000000000000000";
         Mux_Out <= "11111111111111111111111111101100";
         Alu_op <= "000000";
			
			wait for 100 ns;
			Crs1 <= "00000000000000000000000000000000";
         Mux_Out <= "11111111111111111111111111101100";
         Alu_op <= "011100";

      wait;
   end process;

END;
