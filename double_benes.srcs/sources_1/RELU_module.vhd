----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2021 19:06:08
-- Design Name: 
-- Module Name: RELU_module - Behavioral
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

entity RELU_module is
	Port (
		clk         : in  STD_LOGIC;
		en 			: in  STD_LOGIC;
		in_data     : in  float_1024;
		out_data 	: out float_1024
	);
end RELU_module;

architecture Behavioral of RELU_module is
	component RELU
		port (
			clk      : in  STD_LOGIC;
			en       : in  STD_LOGIC;
			in_data  : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			out_data : out STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	end component RELU;	
begin
	GEN_RELU_1024:
	for i in 0 to 1023 generate
	RELU_1 : RELU
		port map (
			clk      => clk,
			en       => en,
			in_data  => in_data(i),
			out_data => out_data(i)
		);
	end generate GEN_RELU_1024;

end Behavioral;
