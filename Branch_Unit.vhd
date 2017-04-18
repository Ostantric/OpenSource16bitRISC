----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:19:09 04/20/2016 
-- Design Name: 
-- Module Name:    Branch_Unit - Behavioral 
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

entity Branch_Unit is
PORT( CLK, CLK_MAIN: IN STD_LOGIC; --CLK IS CLK_EX, CLK_MAIN IS CLK IN TOP LEVEL. IT IS CONFUSING, WE WILL CHANGE THIS LATER. LABELS ARE OUR FRIEND, ONCE WE MESS UP THE ORDER, THEY WILL BE OUR ENEMY :)
		MASK : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		FLAG_IN : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		CURRENT_INS_NUMBER: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		LOCATION   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		RESULT_JUMP_OR_NOT : OUT STD_LOGIC_VECTOR ( 7 DOWNTO 0)
		
		);
end Branch_Unit;

architecture Behavioral of Branch_Unit is
SIGNAL FLAG_SIGNAL,MASK1,MASK2,MASK3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL CURRENT_INS_NUMBER_1,CURRENT_INS_NUMBER_2,CURRENT_INS_NUMBER_3,LOCATION_1,LOCATION_2,LOCATION_3: STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
PROCESS(CLK_MAIN)
BEGIN
IF FALLING_EDGE(CLK_MAIN) THEN
MASK1<=MASK;
MASK2<=MASK1;
MASK3<=MASK2;
CURRENT_INS_NUMBER_1<=CURRENT_INS_NUMBER;
CURRENT_INS_NUMBER_2<=CURRENT_INS_NUMBER_1;
CURRENT_INS_NUMBER_3<=CURRENT_INS_NUMBER_2;
LOCATION_1<=LOCATION;
LOCATION_2<=LOCATION_1;
LOCATION_3<=LOCATION_2;
END IF;
END PROCESS;
PROCESS(CLK)
BEGIN
IF FALLING_EDGE(CLK) THEN

	IF(MASK3=FLAG_IN) THEN
		RESULT_JUMP_OR_NOT<=LOCATION_3-"00000001"; --TO SUPPORT JUMP AFTER BRANCH, WE CHECK BRANCHED ADDRS - 1 . WE LOSE ADDTIONAL ONE MORE CYCLE ON TOP OF 3 CYCLE LOSS.
		ELSE
		RESULT_JUMP_OR_NOT<=CURRENT_INS_NUMBER_3;--TO SUPPORT JUMP AFTER BRANCH PLUS CONTUNIE
		END IF;
		END IF;
END PROCESS;

end Behavioral;

