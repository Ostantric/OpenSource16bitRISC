--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:17:19 04/01/2016
-- Design Name:   
-- Module Name:   C:/Users/MuTe-Desktop/Desktop/ECE368_design_final/Top_LEVEL/Decoder_Test.vhd
-- Project Name:  Top_LEVEL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoding_Unit
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
 
ENTITY Decoder_Test IS
END Decoder_Test;
 
ARCHITECTURE behavior OF Decoder_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoding_Unit
    PORT(
         INPUT : IN  std_logic_vector(15 downto 0);
         CLK : IN  std_logic;
         RA : OUT  std_logic_vector(3 downto 0);
         RB : OUT  std_logic_vector(3 downto 0);
         IMD : OUT  std_logic_vector(3 downto 0);
         OPCODE : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal INPUT : std_logic_vector(15 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal RA : std_logic_vector(3 downto 0);
   signal RB : std_logic_vector(3 downto 0);
   signal IMD : std_logic_vector(3 downto 0);
   signal OPCODE : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoding_Unit PORT MAP (
          INPUT => INPUT,
          CLK => CLK,
          RA => RA,
          RB => RB,
          IMD => IMD,
          OPCODE => OPCODE
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
      INPUT<= "0001010111110100";
		
		
      wait for 100 ns;	
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
