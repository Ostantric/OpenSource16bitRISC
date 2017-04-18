----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:27:05 04/14/2016 
-- Design Name: 
-- Module Name:    JUMP_AND_BRANCH_CONTROLLER - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BRANCH_CONTROLLER is
PORT(
--		CLK : IN STD_LOGIC;
	  
--	OPCODE_FOR_BRANCH:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--		JUMP_ADDR_FROM_ALU:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--		PROGRAM_COUNTER_ADDR_CHANGE_BRANCH:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      OPCODE_FROM_F_REGISTER:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		PROGRAM_COUNTER_INTERRUPT_FOR_BRANCH: OUT STD_LOGIC:='0'
		
	  );
end BRANCH_CONTROLLER;

architecture Behavioral of BRANCH_CONTROLLER is
SIGNAL SIGNAL1,SIGNAL2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
begin
	
WITH OPCODE_FROM_F_REGISTER SELECT
				PROGRAM_COUNTER_INTERRUPT_FOR_BRANCH<=
				'1' WHEN "1111", --BRANCH
				'0' WHEN OTHERS;
--PROCESS(CLK)
--BEGIN
--IF RISING_EDGE(CLK) THEN
--SIGNAL1<=OPCODE_FOR_BRANCH;
--SIGNAL2<=SIGNAL1;
--END IF;
--END PROCESS;
--WITH SIGNAL2 SELECT
--				PROGRAM_COUNTER_ADDR_CHANGE_BRANCH<=
--				JUMP_ADDR_FROM_ALU WHEN "1111", --BRANCH
--				"00000000" WHEN OTHERS;
--RESULT_AFTER_CALCULATION<=JUMP_ADDR_FROM_F_REGISTER WHEN CONTROL_FOR_FLAG='1';
--									ADDR_WHERE_BRANCH_LEFT WHEN CONTROL_FOR_FLAG='0';
				


end Behavioral;

