----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:11:25 04/23/2016 
-- Design Name: 
-- Module Name:    CALCULATE_EXTERNAL_MEM_ADDR_UNIT - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CALCULATE_EXTERNAL_MEM_ADDR_UNIT is
PORT( DATA_FROM_SHADOW_REGISTER : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			    IMD_VALUE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				 EXTERNAL_MEMORY_READ_ADDR: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
				 );
end CALCULATE_EXTERNAL_MEM_ADDR_UNIT;

architecture COMBINATIONAL of CALCULATE_EXTERNAL_MEM_ADDR_UNIT is

SIGNAL IMD_VALUE_16BIT : STD_LOGIC_VECTOR(15 DOWNTO 0);

begin

IMD_VALUE_16BIT<="000000000000" & IMD_VALUE ;

EXTERNAL_MEMORY_READ_ADDR <= DATA_FROM_SHADOW_REGISTER + IMD_VALUE_16BIT;

end COMBINATIONAL;

