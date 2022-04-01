----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2021 23:43:59
-- Design Name: 
-- Module Name: MULT_module - Behavioral
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

entity MULT_module is
    Port (
		clk         : in  STD_LOGIC;
		a_data      : in  float_1024;
		b_data      : in  float_1024;
		result_data : out float_1024
    );
end MULT_module;

architecture Behavioral of MULT_module is

	component MULT 
		port (
			clk         : in  STD_LOGIC;
			a_data      : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			b_data      : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			result_data : out STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	end component MULT;

begin
	
	GEN_MULT_1024:
	for i in 0 to 1023 generate
		MULT_1 : MULT
			port map (
				clk         => clk,
				a_data      => a_data(i),
				b_data      => b_data(i),
				result_data => result_data(i)
			);
	end generate GEN_MULT_1024;

end Behavioral;
