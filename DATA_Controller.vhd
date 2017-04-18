----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:56 03/31/2016 
-- Design Name: 
-- Module Name:    DATA_COntroller - Behavioral 
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
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DATA_Controller is
port(CLK 	 : in STD_LOGIC;

control_data_hazard 	 : out STD_LOGIC;
Control_RB_mux 	 : out STD_LOGIC_VECTOR(3 DOWNTO 0);
READ_SIGNAL : OUT STD_LOGIC;
READ_SIGNAL_FOR_SHADOW_REGISTER:OUT STD_LOGIC;
OPCODE : in STD_LOGIC_vector(3 downto 0);
ID: IN STD_LOGIC_VECTOR(1 DOWNTO 0)


);
end DATA_Controller;

architecture Behavioral of DATA_Controller is

begin
process(CLK)
begin
if RISING_EDGE(CLK) then
	--LOAD--------------------------------------------------------------------------------------------------------------------------------------------------------
	if(OPCODE="1001") then
	
	control_data_hazard<='1'; --HAZARD WITH LOAD
	control_RB_mux<="0011";

	
	--STORE---------------------------------------------------------------------------------------------------------------------------------------------------------
	elsif (OPCODE="1010") then  
	control_data_hazard<='0';-- NO HAZARD WITH STORE
	control_RB_mux<="0011";

	
	--ADDI,ANDI,SL,SR----------------------------------------------------------------------------------------------------------------------------------------
   elsif(OPCODE="0101") or (OPCODE="0110") or (OPCODE="0111") or (OPCODE="1000") then 
	
	control_RB_mux<="0001";
	
	
	 --BRANCH--------------------------------------------------------------------------------------------------------------------------------------------------
	ELSIF(OPCODE="1111") THEN
	
	CONTROL_RB_MUX<="0010";

	
	
	--LOAD SPECIAL INSTRUCTIONS--------------------------------------------------------------------------------------------------------------------
	ELSIF (OPCODE="1011")  THEN 
	IF (ID="00") THEN --LWV (LOAD WORD VECTOR TO REG_BANK)
		 CONTROL_RB_MUX<="0100";
		
		ELSIF(ID="01") THEN --LWVD (LOAD WORD VECTOR TO DATA_MEMORY)
		  CONTROL_RB_MUX<="0101";
		  
		 
		 ELSIF(ID="10") THEN -- LWVI (LOAD WORD VECTOR TO INSTRUCTION_MEMORY)
		 
		  CONTROL_RB_MUX<="0110";
	
		 ELSE --LWVS LOAD WORD VECTOR TO SHADOW_REGISTER
		 
		  CONTROL_RB_MUX<="0111";
		END IF;
		
		
 --STORE SPECIAL INSTRUCTIONS--------------------------------------------------------------------------------------------------------------------
	ELSIF ( OPCODE="1100") THEN
		IF (ID="00") THEN --SWISTORE WORD VECTOR TO EXTERNAL_MEMORY FROM REG_BANK
		 CONTROL_RB_MUX<="1000";
		 
		ELSIF(ID="01") THEN --SWED(STORE  WORD VECTOR TO EXTERNAL_MEMORY FROM DATA_MEMORY)
		  CONTROL_RB_MUX<="1001";
	
		 ELSIF(ID="10") THEN --SWEI (STORE WORD VECTOR TO EXTERNAL_MEMORY FROM INSTRUCTION_MEMORY)
		  CONTROL_RB_MUX<="1010";
		
		 ELSE -- THIS IS INTERRUPT, 
		  CONTROL_RB_MUX<="1100";
	
		END IF;
	-------------REST----------------------------------------------------------------------------------------------------------------
	else
	
	control_RB_mux<="0000";


	
	end if;
	end if;

	
END PROCESS;

 READ_SIGNAL<='1';
end Behavioral;

