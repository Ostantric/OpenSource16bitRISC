----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:41:17 04/26/2016 
-- Design Name: 
-- Module Name:    DATA_MEMORY_WRITE_ADDR_FIXER - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DATA_MEMORY_WRITE_ADDR_FIXER is
PORT
( DATA_MEMORY_ADDR_CURRENT_IN,DATA_MEMORY_ADDR_1_CYCLE_AGO,DATA_MEMORY_ADDR_2_CYCLE_AGO : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
  INSTRUCTION_MEMORY_ADDR_CURRENT_IN, INSTRUCTION_MEMORY_ADDR_1_CYCLE_AGO,INSTRUCTION_MEMORY_ADDR_2_CYCLE_AGO: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  OPCODE_PROCESS_IN: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
  DATA_MEMORY_FIXED_ADDR_CURRENT_IN,DATA_MEMORY_FIXED_ADDR_1_CYCLE_AGO,DATA_MEMORY_FIXED_ADDR_2_CYCLE_AGO : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
);
end DATA_MEMORY_WRITE_ADDR_FIXER;

																							


architecture COMBINATIONAL of DATA_MEMORY_WRITE_ADDR_FIXER is

begin
DATA_MEMORY_FIXED_ADDR_CURRENT_IN <= INSTRUCTION_MEMORY_ADDR_CURRENT_IN(7 DOWNTO 0) WHEN OPCODE_PROCESS_IN="1011" ELSE
 																														INSTRUCTION_MEMORY_ADDR_CURRENT_IN(7 DOWNTO 0) WHEN OPCODE_PROCESS_IN="1100" ELSE
																														DATA_MEMORY_ADDR_CURRENT_IN;

DATA_MEMORY_FIXED_ADDR_1_CYCLE_AGO <= INSTRUCTION_MEMORY_ADDR_1_CYCLE_AGO(7 DOWNTO 0) WHEN OPCODE_PROCESS_IN="1011" ELSE
 																														 INSTRUCTION_MEMORY_ADDR_1_CYCLE_AGO(7 DOWNTO 0) WHEN OPCODE_PROCESS_IN="1100" ELSE
																														 DATA_MEMORY_ADDR_1_CYCLE_AGO;
																														
DATA_MEMORY_FIXED_ADDR_2_CYCLE_AGO <= INSTRUCTION_MEMORY_ADDR_2_CYCLE_AGO(7 DOWNTO 0) WHEN OPCODE_PROCESS_IN="1011" ELSE
 																														 INSTRUCTION_MEMORY_ADDR_2_CYCLE_AGO(7 DOWNTO 0) WHEN OPCODE_PROCESS_IN="1100" ELSE
																														 DATA_MEMORY_ADDR_2_CYCLE_AGO;				

end COMBINATIONAL;

