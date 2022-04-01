----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2021 07:45:28
-- Design Name: 
-- Module Name: INPUT_MUX - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
library work;
use work.ARRAYLIST.all;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity INPUT_MUX is
	Port (
		clk: in STD_LOGIC;
		en: in STD_LOGIC_VECTOR(1 DOWNTO 0);
		IN_0: in float_1024;
		IN_1: in float_1024;
		IN_2: in float_1024;
		IN_3: in float_1024;
		MUX_OUT: out float_1024
	);
end INPUT_MUX;

architecture Behavioral of INPUT_MUX is
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if en = "00" then
				MUX_OUT <= IN_0;
			elsif en = "01" then
				MUX_OUT <= IN_1;
			elsif en = "10" then
				MUX_OUT <= IN_2;
			else
				MUX_OUT <= IN_3;
			end if;
		end if;
	end process;

end Behavioral;
