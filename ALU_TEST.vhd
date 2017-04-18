--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:01:20 04/01/2016
-- Design Name:   
-- Module Name:   C:/Users/MuTe-Desktop/Desktop/ECE368_design_final/Top_LEVEL/ALU_TEST.vhd
-- Project Name:  Top_LEVEL
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
 
ENTITY ALU_TEST IS
END ALU_TEST;
 
ARCHITECTURE behavior OF ALU_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         CLK : IN  std_logic;
         RA : IN  std_logic_vector(15 downto 0);
         RB : IN  std_logic_vector(15 downto 0);
         OPCODE : IN  std_logic_vector(3 downto 0);
         ALU_OUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RA : std_logic_vector(15 downto 0) := (others => '0');
   signal RB : std_logic_vector(15 downto 0) := (others => '0');
   signal OPCODE : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_OUT : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          CLK => CLK,
          RA => RA,
          RB => RB,
          OPCODE => OPCODE,
          ALU_OUT => ALU_OUT
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
		RA<= x"0001";
		RB<= x"0001";
		OPCODE<="0000";
		
      wait for 100 ns;	
		wait for CLK_period*10;
		RA<= x"0100";
		RB<= x"0010";
		OPCODE<="0001";
		
      wait for 100 ns;	
      wait for CLK_period*10;
		
		RA<= x"0001";
		RB<= x"0010";
		OPCODE<="0010";
		
      wait for 100 ns;	
      wait for CLK_period*10;
		
		RA<= x"0001";
		RB<= x"0010";
		OPCODE<="0011";
		
      wait for 100 ns;	
      wait for CLK_period*10;
		
		RA<= x"0011";
		RB<= x"0000";
		OPCODE<="0100";
		
      wait for 100 ns;	
      wait for CLK_period*10;
		
		RA<= x"0011";
		RB<= x"0001";
		OPCODE<="0111";
		
      wait for 100 ns;	
      wait for CLK_period*10;
		
		RA<= x"1100";
		RB<= x"0001";
		OPCODE<="1000";
		
      wait for 100 ns;	
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
