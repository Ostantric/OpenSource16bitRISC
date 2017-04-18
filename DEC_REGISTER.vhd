----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:51 04/06/2016 
-- Design Name: 
-- Module Name:    DEC_REGISTER - Behavioral 
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

entity DEC_REGISTER is
PORT(
		CLK_DEC  : in std_logic;
		OPCODE_IN,RA_ADDR_IN,RB_ADDR_IN,IMD_VALUE_IN : In std_logic_vector (3 downto 0);
		ID_IN: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	
		OPCODE_OUT,RA_ADDR_OUT,RB_ADDR_OUT,IMD_VALUE_OUT: out std_logic_vector(3 downto 0);
		ID_OUT: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		
		MEM_ADDR_IN: in std_logic_vector(7 downto 0);
		MEM_ADDR_OUT: out std_logic_vector(7 downto 0));
end DEC_REGISTER;

architecture Behavioral of DEC_REGISTER is

begin
process (CLK_DEC)
begin
if FALLING_EDGE(CLK_DEC) then

	OPCODE_OUT <= OPCODE_IN;
	
	
	RA_ADDR_OUT <= RA_ADDR_IN;
	
	
	RB_ADDR_OUT <= RB_ADDR_IN;
--	RS_ADDR_OUT<=RS_ADDR_IN;
	ID_OUT<=ID_IN;

	IMD_VALUE_OUT <= IMD_VALUE_IN;
	MEM_ADDR_OUT<=MEM_ADDR_IN;
	
	END IF;
	END PROCESS;

end Behavioral;

