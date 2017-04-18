----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:33:52 03/28/2016 
-- Design Name: 
-- Module Name:    Reg_Bank - BehavioRBl 
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


-- Uncomment the following libRBry declaRBtion if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following libRBry declaRBtion if instantiating
-- any Xilinx primitives in this code.
--libRBry UNISIM;
--use UNISIM.VComponents.all;

entity Reg_Bank is
GENERIC ( N : INTEGER := 16);
	PORT(RA_addr, RB_addr, WR_addr : IN STD_LOGIC_VECTOR(3 downto 0) ;

			DATA_IN : IN STD_LOGIC_VECTOR(N-1 downto 0) ;
--			CLK :IN STD_LOGIC;
			RESET:IN STD_LOGIC;
			WRITE_SIGNAL,READ_SIGNAL,WRITE_ENABLE,READ_ENABLE,CLK_READ,CLK_WRITE: IN STD_LOGIC ;

			RB, RA, RA_USED_AS_ADDR: OUT STD_LOGIC_VECTOR(N - 1 downto 0 )) ;
end Reg_Bank;

architecture Behavioral of Reg_Bank is

type reg_bank_array is array (0 to 15) of std_logic_vector(N-1 downto 0); 
signal reg_bank_signal : reg_bank_array:=(0=>X"0000", OTHERS=>X"0000");
begin

--Writing
process(CLK_WRITE,RESET)
begin
	IF RISING_EDGE(CLK_WRITE) then
	IF RESET='0' THEN
	IF WRITE_ENABLE='1' THEN
	if WRITE_SIGNAL='1' then
	reg_bank_signal(to_integer(unsigned(wr_addr)))<=data_in;
		END IF;
	END IF;
	ELSE
	reg_bank_signal<= (others=>(others=>'0'));
	END IF;


	END IF;
END PROCESS;	
--reading RA and RB
	RA<=reg_bank_signal(to_integer(unsigned(Ra_addr)));
	RB<=reg_bank_signal(to_integer(unsigned(Rb_addr)));
 
end Behavioral;

