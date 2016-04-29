--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:09:14 04/13/2016
-- Design Name:   
-- Module Name:   C:/Users/LuisaM/Documents/Universidad/Arq computadores/ProcesadorMonociclo/RegisterFile_TB.vhd
-- Project Name:  ProcesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegisterFile
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
 
ENTITY RegisterFile_TB IS
END RegisterFile_TB;
 
ARCHITECTURE behavior OF RegisterFile_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         Rs : IN  std_logic_vector(4 downto 0);
         Rt : IN  std_logic_vector(4 downto 0);
         Dw : IN  std_logic_vector(31 downto 0);
         Rw : IN  std_logic_vector(4 downto 0);
         Rf_wr : IN  std_logic;
         Clk : IN  std_logic;
         CRs : OUT  std_logic_vector(31 downto 0);
         Crt : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rs : std_logic_vector(4 downto 0) := (others => '0');
   signal Rt : std_logic_vector(4 downto 0) := (others => '0');
   signal Dw : std_logic_vector(31 downto 0) := (others => '0');
   signal Rw : std_logic_vector(4 downto 0) := (others => '0');
   signal Rf_wr : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal CRs : std_logic_vector(31 downto 0);
   signal Crt : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          Rs => Rs,
          Rt => Rt,
          Dw => Dw,
          Rw => Rw,
          Rf_wr => Rf_wr,
          Clk => Clk,
          CRs => CRs,
          Crt => Crt
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
      -- hold reset state for 100 ns.
      wait for 20 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
