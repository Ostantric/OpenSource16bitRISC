----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:49:42 03/30/2016 
-- Design Name: 
-- Module Name:    ALU_MUX_UNIT - Behavioral 
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

entity ALU_MUX_UNIT is
port(Ar_Result_in,Log_Result_in,Shift_Result_in,LoSt_Result_in,LoSt_Vector_result_IN: in STD_LOGIC_VECTOR(15 downto 0);
	  COM : in STD_LOGIC_VECTOR(2 downto 0);
	  FLAGS_FROM_LOGIC,FLAGS_FROM_ARITHMETIC,FLAGS_FROM_SHIFT: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	  FLAGS_OUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	  Calculation_OUT : out STD_LOGIC_VECTOR(15 downto 0));


end ALU_MUX_UNIT;

architecture Combinational of ALU_MUX_UNIT is
begin
with COM select
			Calculation_OUT <=
									Ar_Result_in    WHEN "000", --add,addi,sub
									Log_Result_in   WHEN "001", --and,or,andi
									Shift_Result_in WHEN "010", --shiftleft,shift right
									LoSt_Result_in  WHEN "011", --store,load,mov
									LoSt_VECTOR_result_in when others; -- special vector instructions
									
WITH COM SELECT
		   FLAGS_OUT <=
							FLAGS_FROM_ARITHMETIC WHEN "000",
							FLAGS_FROM_LOGIC      WHEN "001",
							FLAGS_FROM_SHIFT		 WHEN "010",
							"0000"                WHEN OTHERS; --CLEARING FLAGS FOR OTHERS
			
			
end combinational;

