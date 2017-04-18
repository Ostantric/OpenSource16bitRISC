----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:23:11 04/06/2016 
-- Design Name: 
-- Module Name:    ALU_RESULT_STORAGE - Behavioral 
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
use ieee.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_RESULT_STORAGE is
PORT (CLK_F,CLK_DEC,CLK_OP,CLK_EX,CLK_WB	 : in STD_LOGIC;
		COUNTER_FOR_WRITING_DATA : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		COUNTER_FOR_OUTPUT_TO_1_CYCLE_AGO: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		COUNTER_FOR_OUTPUT_TO_2_CYCLE_AGO:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	   ALU_RESULT_IN :in STD_LOGIC_vector(15 downto 0);
		ALU_RESULT_OUT_FOR_DATA_1_CYCLE_AGO :out STD_LOGIC_vector(15 downto 0);
		ALU_RESULT_OUT_FOR_DATA_2_CYCLE_AGO:out STD_LOGIC_vector(15 downto 0)
		);
end ALU_RESULT_STORAGE;

architecture Behavioral of ALU_RESULT_STORAGE is
type ALU_ARRAY is array (0 to 7) of std_logic_vector(15 downto 0); 
signal ALU_SIGNAL : ALU_ARRAY:=(x"0000",x"0000",x"0000",x"0000",x"0000",x"0000",x"0000",x"0000");
signal ALU_INTERNAL_SIGNAL_SIGNAL_FOR_1_CYCLE_AGO,ALU_INTERNAL_SIGNAL_SIGNAL_FOR_2_CYCLE_AGO :STD_LOGIC_VECTOR(15 DOWNTO 0);
signal CORRECTED_COUNTER_FOR_OUTPUT_TO_1_CYCLE_AGO : STD_LOGIC_VECTOR(2 DOWNTO 0);
begin
PROCESS(CLK_OP)
BEGIN

--CORRECTED_COUNTER_FOR_OUTPUT_TO_1_CYCLE_AGO<=COUNTER_FOR_OUTPUT_TO_1_CYCLE_AGO+"001";


if FALLING_EDGE(CLK_OP) then
		ALU_signal(to_integer(unsigned(COUNTER_FOR_WRITING_DATA)))<=ALU_RESULT_IN;
		
end if;
end process;

with COUNTER_FOR_OUTPUT_TO_1_CYCLE_AGO select
			ALU_INTERNAL_SIGNAL_SIGNAL_FOR_1_CYCLE_AGO <=
			 ALU_SIGNAL(to_integer(unsigned(COUNTER_FOR_OUTPUT_TO_1_CYCLE_AGO)))WHEN "000",
			 ALU_SIGNAL(to_integer(unsigned(COUNTER_FOR_OUTPUT_TO_1_CYCLE_AGO)))WHEN OTHERS;
			 
with COUNTER_FOR_OUTPUT_TO_2_CYCLE_AGO select
			ALU_INTERNAL_SIGNAL_SIGNAL_FOR_2_CYCLE_AGO <=
			 ALU_SIGNAL(to_integer(unsigned(COUNTER_FOR_OUTPUT_TO_2_CYCLE_AGO)))WHEN "000",
			 ALU_SIGNAL(to_integer(unsigned(COUNTER_FOR_OUTPUT_TO_2_CYCLE_AGO)))WHEN OTHERS;

PROCESS(CLK_OP)
BEGIN
if RISING_EDGE(CLK_OP) then
ALU_RESULT_OUT_FOR_DATA_1_CYCLE_AGO<=ALU_INTERNAL_SIGNAL_SIGNAL_FOR_1_CYCLE_AGO;
end if;
end process;

PROCESS(CLK_EX)
BEGIN
if RISING_EDGE(CLK_EX) then
ALU_RESULT_OUT_FOR_DATA_2_CYCLE_AGO<=ALU_INTERNAL_SIGNAL_SIGNAL_FOR_2_CYCLE_AGO;
end if;
end process;




end Behavioral;

