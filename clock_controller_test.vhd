--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:09:17 04/17/2016
-- Design Name:   
-- Module Name:   C:/Users/User/Desktop/MURAT/Top_LEVEL/CLOCK_CONTROLLER_TEST.vhd
-- Project Name:  Top_LEVEL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Clock_Controller
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
 
ENTITY CLOCK_CONTROLLER_TEST IS
END CLOCK_CONTROLLER_TEST;
 
ARCHITECTURE behavior OF CLOCK_CONTROLLER_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Clock_Controller
    PORT(
         ITNERRUPT_SIGNAL_FOR_JUMP_RETURN : IN  std_logic;
         ITNERRUPT_SIGNAL_FOR_BRANCH : IN  std_logic;
         CLK : IN  std_logic;
         CLK_F : OUT  std_logic;
         CLK_Dec : OUT  std_logic;
         CLK_OP : OUT  std_logic;
         CLK_EX : OUT  std_logic;
         CLK_WB : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ITNERRUPT_SIGNAL_FOR_JUMP_RETURN : std_logic := '0';
   signal ITNERRUPT_SIGNAL_FOR_BRANCH : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal CLK_F : std_logic;
   signal CLK_Dec : std_logic;
   signal CLK_OP : std_logic;
   signal CLK_EX : std_logic;
   signal CLK_WB : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Clock_Controller PORT MAP (
          ITNERRUPT_SIGNAL_FOR_JUMP_RETURN => ITNERRUPT_SIGNAL_FOR_JUMP_RETURN,
          ITNERRUPT_SIGNAL_FOR_BRANCH => ITNERRUPT_SIGNAL_FOR_BRANCH,
          CLK => CLK,
          CLK_F => CLK_F,
          CLK_Dec => CLK_Dec,
          CLK_OP => CLK_OP,
          CLK_EX => CLK_EX,
          CLK_WB => CLK_WB
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 45 ns;	
		ITNERRUPT_SIGNAL_FOR_JUMP_RETURN<='1';
		WAIT FOR 10 NS;
		ITNERRUPT_SIGNAL_FOR_JUMP_RETURN<='0';
		WAIT FOR 30 NS;
		ITNERRUPT_SIGNAL_FOR_BRANCH<='1';
		WAIT FOR 10 NS;
		ITNERRUPT_SIGNAL_FOR_BRANCH<='0';

      -- insert stimulus here 

      wait;
   end process;

END;
