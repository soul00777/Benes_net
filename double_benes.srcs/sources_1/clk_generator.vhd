----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2021 17:09:16
-- Design Name: 
-- Module Name: clk_generator - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_generator is
    Port (
		clk_p   	: in  STD_LOGIC;
		clk_n  		: in  STD_LOGIC;
		clk_out 	: out STD_LOGIC
    );
end clk_generator;

architecture Behavioral of clk_generator is
	component clk_gen
		port (
			clk_in1_p   : in  STD_LOGIC;
			clk_in1_n  	: in  STD_LOGIC;
			clk_out1 	: out STD_LOGIC
		);
	end component clk_gen;
begin
	clk_gen_1 : clk_gen
		port map (
			clk_in1_p   => clk_p,
			clk_in1_n   => clk_n,
			clk_out1 	=> clk_out
		);

end Behavioral;
