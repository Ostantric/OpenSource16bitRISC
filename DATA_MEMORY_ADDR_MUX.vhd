----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:04:22 04/26/2016 
-- Design Name: 
-- Module Name:    DATA_MEMORY_ADDR_MUX - Behavioral 
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

entity DATA_MEMORY_ADDR_MUX is
PORT(
OPCODE_READ : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
OPCODE_WRITE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
RA_VALUE_IN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);

MEM_ADDR_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

RA_VALUE_FOR_PROCESS_IN: IN STD_LOGIC_VECTOR(15 DOWNTO 0); --THIS SIGNAL SEEMS LIKE ITS COMING FROM INSTRUCTION MEMORY ADDR. RA_VALUE RULES BOTH THEM, I DIDN'T WANT TO MAKE ANOTHER STORAGE UNIT.
MEM_ADDR_FOR_PROCESS_IN: IN STD_LOGIC_VECTOR(7 DOWNTO 0);

READ_ADDR_OUT: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
WRITE_ADDR_OUT:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
end DATA_MEMORY_ADDR_MUX;

architecture COMBINATIONAL of DATA_MEMORY_ADDR_MUX is
begin

READ_ADDR_OUT <= RA_VALUE_IN(7 DOWNTO 0) WHEN OPCODE_READ= "1100" ELSE -- WE WASTE STORAGE INSTEAD OF STORING 8 BIT WE STORE 15 THEN WE TAKE 8 BIT OUT OF.BAD HABBIT (7 DOWNTO 0). ITWE WILL CHANGE THIS LATER
													 RA_VALUE_IN(7 DOWNTO 0) WHEN OPCODE_READ= "1011" ELSE -- SAME HABBIT
													 MEM_ADDR_IN;

WRITE_ADDR_OUT<=RA_VALUE_FOR_PROCESS_IN(7 DOWNTO 0) WHEN OPCODE_WRITE="1100" ELSE -- SAME HABBIT
													  RA_VALUE_FOR_PROCESS_IN(7 DOWNTO 0) WHEN OPCODE_WRITE="1011" ELSE -- SAME HABBIT
													  MEM_ADDR_FOR_PROCESS_IN;

end COMBINATIONAL;

