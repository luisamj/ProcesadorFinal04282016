--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:47:05 04/20/2016
-- Design Name:   
-- Module Name:   C:/Users/LuisaM/Documents/Universidad/Arq computadores/ProcesadorMonociclo/NPC_TB.vhd
-- Project Name:  ProcesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NPC
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
 
ENTITY NPC_TB IS
END NPC_TB;
 
ARCHITECTURE behavior OF NPC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NPC
    PORT(
         Reset : IN  std_logic;
         Din : IN  std_logic_vector(31 downto 0);
         Dout : OUT  std_logic_vector(31 downto 0);
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Din : std_logic_vector(31 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal Dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NPC PORT MAP (
          Reset => Reset,
          Din => Din,
          Dout => Dout,
          Clk => Clk
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		Reset <='1';
      -- hold reset state for 100 ns.
      Din <= "00000000000000000000000000000000"; 
      reset <= '0'; 
		wait for 20 ns;
		Din <= "00000000000000000000000000000001";
		wait for 20 ns;
		Din <= "00000000000000000000000000000010";
		wait for 20 ns;
		Din <= "00000000000000000000000000000011";
--      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
