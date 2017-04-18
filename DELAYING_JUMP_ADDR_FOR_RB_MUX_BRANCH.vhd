----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:22:02 04/18/2016 
-- Design Name: 
-- Module Name:    DELAYING_JUMP_ADDR_FOR_RB_MUX_BRANCH - Behavioral 
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

entity DELAYING_JUMP_ADDR_FOR_RB_MUX_BRANCH is
PORT( CLK_DEC : IN STD_LOGIC;
		JUMP_ADDR_FROM_F_REGISTER : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		JUMP_ADDR_DELAYED: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
end DELAYING_JUMP_ADDR_FOR_RB_MUX_BRANCH;

architecture Behavioral of DELAYING_JUMP_ADDR_FOR_RB_MUX_BRANCH is

begin
PROCESS(CLK_DEC)
BEGIN
IF RISING_EDGe(CLK_DEC) THEN
	JUMP_ADDR_DELAYED<=JUMP_ADDR_FROM_F_REGISTER;
	END IF;
END PROCESS;
end Behavioral;

