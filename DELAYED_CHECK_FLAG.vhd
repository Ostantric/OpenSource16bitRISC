----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:43:26 04/18/2016 
-- Design Name: 
-- Module Name:    DELAYED_CHECK_FLAG - Behavioral 
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

entity DELAYED_CHECK_FLAG is
PORT(CLK_OP : IN STD_LOGIC;
	  CHECK_FLAG: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	  DELAYED_CHECK_FLAG: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	  );
end DELAYED_CHECK_FLAG;

architecture Behavioral of DELAYED_CHECK_FLAG is

begin
PROCESS(CLK_OP)
BEGIN
IF RISING_EDGE(CLK_OP) THEN
	DELAYED_CHECK_FLAG<=CHECK_FLAG;
	END IF;
	END PROCESS;

end Behavioral;

