--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:11:20 04/25/2016
-- Design Name:   
-- Module Name:   C:/Users/LuisaM/Documents/Universidad/Arq computadores/ProcesadorMonociclo/TB_RF.vhd
-- Project Name:  ProcesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_file
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
 
ENTITY TB_RF IS
END TB_RF;
 
ARCHITECTURE behavior OF TB_RF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_file
    PORT(
         reset : IN  std_logic;
         RS1 : IN  std_logic_vector(4 downto 0);
         RS2 : IN  std_logic_vector(4 downto 0);
         RD : IN  std_logic_vector(4 downto 0);
         DW : IN  std_logic_vector(31 downto 0);
         CRS1 : OUT  std_logic_vector(31 downto 0);
         CRS2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal RS1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RS2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RD : std_logic_vector(4 downto 0) := (others => '0');
   signal DW : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal CRS1 : std_logic_vector(31 downto 0);
   signal CRS2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_file PORT MAP (
          reset => reset,
          RS1 => RS1,
          RS2 => RS2,
          RD => RD,
          DW => DW,
          CRS1 => CRS1,
          CRS2 => CRS2
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
   -- Stimulus process
   stim_proc: process
   begin
	    reset<='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;


		reset<='0';
		
		wait for 30 ns;

      --wait for clk_period*10;
		
		RS1 <="01000";
		RS2 <="10000";
		RD <="00110";
		DW<="00000000000000000000000000000111";

      wait;
   end process;

END;
