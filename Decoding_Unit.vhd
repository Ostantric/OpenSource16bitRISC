----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:44 04/01/2016 
-- Design Name: 
-- Module Name:    D_reg - Behavioral 
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

entity Decoding_Unit is

    Port ( 
	 CLK : in  STD_LOGIC;
	 F_REG_input : in  STD_LOGIC_VECTOR (15 downto 0);
    opcode,ra_addr,rb_addr,rc_addr : out  STD_LOGIC_VECTOR (3 downto 0);
	 data_memory_addr : out  STD_LOGIC_VECTOR (7 downto 0);
    ID,RS_ADDR : OUT STD_LOGIC_VECTOR (1 downto 0));
end Decoding_Unit;


architecture Behavioral of Decoding_Unit is

signal D_reg_signal : STD_LOGIC_VECTOR (15 downto 0);


signal opcode_signal : STD_LOGIC_VECTOR (3 downto 0);
signal rc_addr_signal : STD_LOGIC_VECTOR (3 downto 0);

signal ra_addr_signal : STD_LOGIC_VECTOR (3 downto 0);
signal rb_addr_signal : STD_LOGIC_VECTOR (3 downto 0);





begin
process (CLK)

begin


if RISING_EDGE(CLK) then


Opcode<= F_REG_INPUT(15 downto 12);
Ra_addr<= F_REG_INPUT(11 downto 8);
Rb_addr<= F_REG_INPUT(7 downto 4);
rc_addr<=  F_REG_INPUT(3 downto 0);
RS_ADDR<=F_REG_INPUT(7 DOWNTO 6);
ID<=F_REG_INPUT(5 DOWNTO 4);
data_memory_addr<= F_REG_INPUT(7 downto 0);




--D_reg_output <= D_reg_signal;

end if;
end process;




end Behavioral;

