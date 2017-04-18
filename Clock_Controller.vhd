----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:38 03/31/2016 
-- Design Name: 
-- Module Name:    Clock_Controller - Behavioral 
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
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

--USE ieee.numeric_std.ALL;
--use IEEE.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clock_Controller is
port(ITNERRUPT_SIGNAL_FOR_JUMP_RETURN : in std_logic;
		ITNERRUPT_SIGNAL_FOR_BRANCH : in std_logic;
		SIGNAL_FROM_INTERRUPT_CONTROLLER: IN STD_LOGIC;
		SIGNAL_FROM_INTERRUPT_UNIT : IN STD_LOGIC;
	  CLK 	 : in STD_LOGIC;
	  CLK_F   : out STD_LOGIC;
	  CLK_Dec : out STD_LOGIC;
	  CLK_OP  : out STD_LOGIC;
     CLK_EX  : out STD_LOGIC;
	  CLK_WB  : out STD_LOGIC);

end Clock_Controller;

architecture Behavioral of Clock_Controller is
signal count : integer range 0 to 1500:=0;
signal temp0,temp1,temp2,temp3,temp4 : STD_LOGIC;
signal ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_2,ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_3,ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_4,ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_5 : STD_LOGIC;
SIGNAL ITNERRUPT_SIGNAL_FOR_BRANCH_2,ITNERRUPT_SIGNAL_FOR_BRANCH_3,ITNERRUPT_SIGNAL_FOR_BRANCH_4,ITNERRUPT_SIGNAL_FOR_BRANCH_5: STD_LOGIC;
SIGNAL ITNERRUPT_SIGNAL_FOR_BRANCH_6,ITNERRUPT_SIGNAL_FOR_BRANCH_7,ITNERRUPT_SIGNAL_FOR_BRANCH_8, ITNERRUPT_SIGNAL_FOR_BRANCH_9: STD_LOGIC;
SIGNAL SIGNAL_FROM_INTERRUPT_CONTROLLER_2,SIGNAL_FROM_INTERRUPT_CONTROLLER_3,SIGNAL_FROM_INTERRUPT_CONTROLLER_4,SIGNAL_FROM_INTERRUPT_CONTROLLER_5 : STD_LOGIC;
SIGNAL SIGNAL_FROM_INTERRUPT_UNIT_2,SIGNAL_FROM_INTERRUPT_UNIT_3,SIGNAL_FROM_INTERRUPT_UNIT_4,SIGNAL_FROM_INTERRUPT_UNIT_5 : STD_LOGIC;
begin
Delayer:process(CLK) begin
if rising_edge(CLK) then
	if(count=1500) then
		 count<=0;
		 else
		 count<=count+1;
		  end if;
		  ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_2<=ITNERRUPT_SIGNAL_FOR_JUMP_RETURN;
		  ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_3<=ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_2;
		  ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_4<=ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_3;	  
		  ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_5<=ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_4;
		  
		  SIGNAL_FROM_INTERRUPT_CONTROLLER_2<=SIGNAL_FROM_INTERRUPT_CONTROLLER;
		  SIGNAL_FROM_INTERRUPT_CONTROLLER_3<=SIGNAL_FROM_INTERRUPT_CONTROLLER_2;
		  SIGNAL_FROM_INTERRUPT_CONTROLLER_4<=SIGNAL_FROM_INTERRUPT_CONTROLLER_3;
		  SIGNAL_FROM_INTERRUPT_CONTROLLER_5<=SIGNAL_FROM_INTERRUPT_CONTROLLER_4;
		  
		  SIGNAL_FROM_INTERRUPT_UNIT_2<=SIGNAL_FROM_INTERRUPT_UNIT;
		  SIGNAL_FROM_INTERRUPT_UNIT_3<=SIGNAL_FROM_INTERRUPT_UNIT_2;
		  SIGNAL_FROM_INTERRUPT_UNIT_4<=SIGNAL_FROM_INTERRUPT_UNIT_3;
		  SIGNAL_FROM_INTERRUPT_UNIT_5<=SIGNAL_FROM_INTERRUPT_UNIT_4;
		  
		  ITNERRUPT_SIGNAL_FOR_BRANCH_2<=ITNERRUPT_SIGNAL_FOR_BRANCH;
		  ITNERRUPT_SIGNAL_FOR_BRANCH_3<=ITNERRUPT_SIGNAL_FOR_BRANCH_2;
		  ITNERRUPT_SIGNAL_FOR_BRANCH_4<=ITNERRUPT_SIGNAL_FOR_BRANCH_3;
		  ITNERRUPT_SIGNAL_FOR_BRANCH_5<=ITNERRUPT_SIGNAL_FOR_BRANCH_4;
		  ITNERRUPT_SIGNAL_FOR_BRANCH_6<=ITNERRUPT_SIGNAL_FOR_BRANCH_5;
		  ITNERRUPT_SIGNAL_FOR_BRANCH_7<=ITNERRUPT_SIGNAL_FOR_BRANCH_6;
		  ITNERRUPT_SIGNAL_FOR_BRANCH_8<=ITNERRUPT_SIGNAL_FOR_BRANCH_7;
		  ITNERRUPT_SIGNAL_FOR_BRANCH_9<=ITNERRUPT_SIGNAL_FOR_BRANCH_8;
		  
		  
		  
		  
		  
		  
		  end if;
		  
if(count>=0) then
		temp0<=CLK;
		else
		temp0<='0';
		end if;
		IF SIGNAL_FROM_INTERRUPT_UNIT='1' THEN
		TEMP0<='0';
		END IF;
		IF SIGNAL_FROM_INTERRUPT_CONTROLLER='1' THEN
		TEMP0<='0';
		end if;
		IF ITNERRUPT_SIGNAL_FOR_JUMP_RETURN='1' THEN
		TEMP0<='0';
		end if;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH='1' THEN
		TEMP0<='0';
		end if;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_2='1' THEN
		TEMP0<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_3='1' THEN
		TEMP0<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_4='1' THEN
		TEMP0<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_5='1' THEN
		TEMP0<='0';
		END IF;

if(count>0) then
		temp1<=CLK;
		else
		temp1<='0';
		end if;
		IF SIGNAL_FROM_INTERRUPT_UNIT_2='1' THEN
		TEMP1<='0';
		END IF;
		IF SIGNAL_FROM_INTERRUPT_CONTROLLER_2='1' THEN
		TEMP1<='0';
		end if;
		IF ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_2='1' THEN
		TEMP1<='0';
		end if;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_2='1' THEN
		TEMP1<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_3='1' THEN
		TEMP1<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_4='1' THEN
		TEMP1<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_5='1' THEN
		TEMP1<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_6='1' THEN
		TEMP1<='0';
		END IF;

if(count>1) then
		temp2<=CLK;
		else
		temp2<='0';
		end if;
		IF SIGNAL_FROM_INTERRUPT_UNIT_3='1' THEN
		TEMP2<='0';
		END IF;
		IF SIGNAL_FROM_INTERRUPT_CONTROLLER_3='1' THEN
		TEMP2<='0';
		end if;
		IF ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_3='1' THEN
		TEMP2<='0';
		end if;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_3='1' THEN
		TEMP2<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_4='1' THEN
		TEMP2<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_5='1' THEN
		TEMP2<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_6='1' THEN
		TEMP2<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_7='1' THEN
		TEMP2<='0';
		END IF;
if(count>2) then
		temp3<=CLK;
		else
		temp3<='0';
		end if;
		IF SIGNAL_FROM_INTERRUPT_UNIT_4='1' THEN
		TEMP3<='0';
		END IF;
		IF SIGNAL_FROM_INTERRUPT_CONTROLLER_4='1' THEN
		TEMP3<='0';
		end if;
		IF ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_4='1' THEN
		TEMP3<='0';
		end if;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_4='1' THEN
		TEMP3<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_5='1' THEN
		TEMP3<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_6='1' THEN
		TEMP3<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_7='1' THEN
		TEMP3<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_8='1' THEN
		TEMP3<='0';
		END IF;
if(count>3) then
		temp4<=CLK;
		else
		temp4<='0';
		end if; 
		IF SIGNAL_FROM_INTERRUPT_UNIT_5='1' THEN
		TEMP4<='0';
		END IF;
		IF SIGNAL_FROM_INTERRUPT_CONTROLLER_5='1' THEN
		TEMP4<='0';
		end if;
		IF ITNERRUPT_SIGNAL_FOR_JUMP_RETURN_5='1' THEN
		TEMP4<='0';
		end if;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_5='1' THEN
		TEMP4<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_6='1' THEN
		TEMP4<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_7='1' THEN
		TEMP4<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_8='1' THEN
		TEMP4<='0';
		END IF;
		IF ITNERRUPT_SIGNAL_FOR_BRANCH_9='1' THEN
		TEMP4<='0';
		END IF;
end process;
       CLK_F<=temp0;
		 CLK_DEC<=temp1;
		 CLK_OP<=temp2;
		 CLK_EX<=temp3;
		 CLK_WB<=temp4;




--if rising_edge(CLK) then
--	count<=count+1;
--	end if;
--	
--end process;
--
--process (count,clk)
--
--begin 
--CLK_DEC <=clk;
--case count is
--	when "00001" => CLK_DEC <= CLK; --add
--	when others => clk_dec <='0';
--	end case;
--	end process;
--	WHEN count="00010" then
--	CLK_dec<=CLK;
--	CLK_OP<=CLK;
--	CLK_EX<=CLK;
--	CLK_WB<=CLK;
--	else
--	CLK_dec<=CLK;
--	CLK_OP<=CLK;
--	CLK_EX<=CLK;
--	CLK_WB<=CLK;
--	
	
		
		
	
	
										
											





end Behavioral;
