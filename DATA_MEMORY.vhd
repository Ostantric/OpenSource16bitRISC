----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:57:13 04/09/2016 
-- Design Name: 
-- Module Name:    DATA_MEMORY - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DATA_MEMORY is
PORT(	
--		RESET: IN STD_LOGIC;
		CLK_READ: IN STD_LOGIC;
		CLK_WRITE: IN STD_LOGIC;
	   WRITE_ENABLE: IN STD_LOGIC;
		READ_ENABLE: IN STD_LOGIC;
		READ_SIGNAL:IN STD_LOGIC;
		WRITE_SIGNAL: IN STD_LOGIC;
		WRITE_ADDR: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		READ_ADDR: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		DATA_IN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		OUTPUT: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		
);
end DATA_MEMORY;

architecture Behavioral of DATA_MEMORY is
type DATA_MEMORY_ARRAY is array (0 to 255) of std_logic_vector(15 downto 0); 
signal DATA_MEMORY_SIGNAL : DATA_MEMORY_ARRAY:=(0=>x"0000", 1=>x"0000", 24=>X"1100", others=>x"0000");
begin
PROCESS(CLK_READ)
BEGIN
IF RISING_EDGE(CLK_READ) THEN
	IF READ_ENABLE='1' THEN
		IF READ_SIGNAL='1' THEN
			OUTPUT<=DATA_MEMORY_SIGNAL(to_integer(unsigned(READ_ADDR)));
			else
			
--			OUTPUT <= (OUTPUT'range => 'Z');

			END IF;
			END IF;
			END IF;
			
END PROCESS;

----Reset signal from interrupt
--process(reset)
--begin
--	IF RESET='1' THEN
--	
--	DATA_MEMORY_SIGNAL<= (others=>(others=>'0'));
--	
--	
--
--	END IF;
--END PROCESS;

process(CLK_WRITE)
begin
	IF RISING_EDGE(CLK_WRITE) then
	IF WRITE_ENABLE='1' THEN
		if WRITE_SIGNAL='1' then
		DATA_MEMORY_SIGNAL(to_integer(unsigned(WRITE_ADDR)))<=DATA_IN;
	

	END IF;
	END IF;
	END IF;
END PROCESS;	

end Behavioral;

