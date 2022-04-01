----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.01.2021 10:34:21
-- Design Name: 
-- Module Name: benes_layer - Behavioral
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

entity benes_layer is
	port (
		clk  : in  STD_LOGIC;
		din  : in  float_1024;
		cs   : in  STD_LOGIC_VECTOR(511 downto 0);
		dout : out float_1024
	);
end benes_layer;

architecture Behavioral of benes_layer is
	component xbar
		port (
			clk        : in  STD_LOGIC;
			in_data_A  : in  std_logic_vector(15 downto 0);
			in_data_B  : in  std_logic_vector(15 downto 0);
			sel        : in  std_logic;
			out_data_A : out std_logic_vector(15 downto 0);
			out_data_B : out std_logic_vector(15 downto 0)
		);
	end component xbar;	
begin
	GEN_XBAR:
	for i in 0 to 511 generate
		xbar_1 : xbar
			port map (
				clk        => clk,
				in_data_A  => din(2*i),
				in_data_B  => din(2*i + 1),
				sel        => cs(i),
				out_data_A => dout(2*i),
				out_data_B => dout(2*i + 1)
			);
	end generate GEN_XBAR;


end Behavioral;
