----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2021 20:48:31
-- Design Name: 
-- Module Name: ADDER_TREE - Behavioral
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

entity ADDER_TREE is
	Port (
		clk         : in  STD_LOGIC;
		in_data     : in  float_1024;
		out_data 	: out float_1024
	);
end ADDER_TREE;

architecture Behavioral of ADDER_TREE is
	component ADDER
		port (
			clk         : in  STD_LOGIC;
			a_data      : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			b_data      : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			result_data : out STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	end component ADDER;

	signal add_data_512: float_512;
	signal add_data_256: float_256;
	signal add_data_128: float_128;
	signal add_data_64: float_64;
	signal add_data_32: float_32;
	signal add_data_16: float_16;
	signal add_data_8: float_8;
	signal add_data_4: float_4;
	signal add_data_2: float_2;
	signal add_data_1: STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal ZEROS: STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
begin

	out_gen_512:
	for i in 511 downto 0 generate
		out_data(i+512) <= add_data_512(i);
	end generate out_gen_512;

	out_gen_256:
	for i in 255 DOWNTO 0 generate
		out_data(i+256) <= add_data_256(i);
	end generate out_gen_256;

	out_gen_128:
	for i in 127 DOWNTO 0 generate
		out_data(i+128) <= add_data_128(i);
	end generate out_gen_128;

	out_gen_64:
	for i in 63 DOWNTO 0 generate
		out_data(i+64) <= add_data_64(i);
	end generate out_gen_64;

	out_gen_32:
	for i in 31 DOWNTO 0 generate
		out_data(i+32) <= add_data_32(i);
	end generate out_gen_32;

	out_gen_16:
	for i in 15 DOWNTO 0 generate
		out_data(i+16) <= add_data_16(i);
	end generate out_gen_16;

	out_gen_8:
	for i in 7 DOWNTO 0 generate
		out_data(i+8) <= add_data_8(i);
	end generate out_gen_8;

	out_gen_4:
	for i in 3 DOWNTO 0 generate
		out_data(i+4) <= add_data_4(i);
	end generate out_gen_4;

	out_gen_2:
	for i in 1 DOWNTO 0 generate
		out_data(i+2) <= add_data_2(i);
	end generate out_gen_2;

	out_data(1) <= add_data_1;
	out_data(0) <= ZEROS;

	GEN_adder_512:
	for i in 0 to 511 generate
	ADDER_1 : ADDER
		port map (
			clk         => clk,
			a_data      => in_data(2*i),
			b_data      => in_data(2*i + 1),
			result_data => add_data_512(i)
		);
	end generate GEN_adder_512;

	GEN_adder_256:
	for i in 0 to 255 generate
	ADDER_2 : ADDER
		port map (
			clk         => clk,
			a_data      => add_data_512(2*i),
			b_data      => add_data_512(2*i + 1),
			result_data => add_data_256(i)
		);
	end generate GEN_adder_256;

	GEN_adder_128:
	for i in 0 to 127 generate
	ADDER_3 : ADDER
		port map (
			clk         => clk,
			a_data      => add_data_256(2*i),
			b_data      => add_data_256(2*i + 1),
			result_data => add_data_128(i)
		);
	end generate GEN_adder_128;

	GEN_adder_64:
	for i in 0 to 63 generate
	ADDER_4 : ADDER
		port map (
			clk         => clk,
			a_data      => add_data_128(2*i),
			b_data      => add_data_128(2*i + 1),
			result_data => add_data_64(i)
		);
	end generate GEN_adder_64;

	GEN_adder_32:
	for i in 0 to 31 generate
	ADDER_5 : ADDER
		port map (
			clk         => clk,
			a_data      => add_data_64(2*i),
			b_data      => add_data_64(2*i + 1),
			result_data => add_data_32(i)
		);
	end generate GEN_adder_32;

	GEN_adder_16:
	for i in 0 to 15 generate
	ADDER_6 : ADDER
		port map (
			clk         => clk,
			a_data      => add_data_32(2*i),
			b_data      => add_data_32(2*i + 1),
			result_data => add_data_16(i)
		);
	end generate GEN_adder_16;

	GEN_adder_8:
	for i in 0 to 7 generate
	ADDER_7 : ADDER
		port map (
			clk         => clk,
			a_data      => add_data_16(2*i),
			b_data      => add_data_16(2*i + 1),
			result_data => add_data_8(i)
		);
	end generate GEN_adder_8;

	GEN_adder_4:
	for i in 0 to 3 generate
	ADDER_8 : ADDER
		port map (
			clk         => clk,
			a_data      => add_data_8(2*i),
			b_data      => add_data_8(2*i + 1),
			result_data => add_data_4(i)
		);
	end generate GEN_adder_4;

	GEN_adder_2:
	for i in 0 to 1 generate
	ADDER_9 : ADDER
		port map (
			clk         => clk,
			a_data      => add_data_4(2*i),
			b_data      => add_data_4(2*i + 1),
			result_data => add_data_2(i)
		);
	end generate GEN_adder_2;

	ADDER_10 : ADDER
		port map (
			clk         => clk,
			a_data      => add_data_2(0),
			b_data      => add_data_2(1),
			result_data => add_data_1
		);

end Behavioral;
