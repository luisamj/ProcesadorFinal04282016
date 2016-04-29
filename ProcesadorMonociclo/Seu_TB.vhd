--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:33:19 04/25/2016
-- Design Name:   
-- Module Name:   C:/Users/LuisaM/Documents/Universidad/Arq computadores/ProcesadorMonociclo/Seu_TB.vhd
-- Project Name:  ProcesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Seu
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
 
ENTITY Seu_TB IS
END Seu_TB;
 
ARCHITECTURE Seu_Arq OF Seu_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Seu
    PORT(
         Seu_in : IN  std_logic_vector(12 downto 0);
         Seu_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Seu_in : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal Seu_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Seu PORT MAP (
          Seu_in => Seu_in,
          Seu_out => Seu_out
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
      wait for 30 ns;
			
			seu_in<="1000000000010";

--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
