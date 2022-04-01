----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.01.2021 11:26:55
-- Design Name: 
-- Module Name: benes_network - Behavioral
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
use ieee.math_real.all;
use ieee.numeric_std.all;

entity benes_network is
	port (
		clk    : in  STD_LOGIC;
		din    : in  float_1024;
		all_cs : in  data_19x512;
		dout   : out float_1024
	);
end benes_network;

architecture Behavioral of benes_network is
	component benes_layer
		port (
			clk  : in  STD_LOGIC;
			din  : in  float_1024;
			cs   : in  STD_LOGIC_VECTOR(511 downto 0);
			dout : out float_1024
		);
	end component benes_layer;


	signal lout_0 : float_1024;
	signal lout_1 : float_1024;
	signal lout_2 : float_1024;
	signal lout_3 : float_1024;
	signal lout_4 : float_1024;
	signal lout_5 : float_1024;
	signal lout_6 : float_1024;
	signal lout_7 : float_1024;
	signal lout_8 : float_1024;
	signal lout_9 : float_1024;
	signal lout_10 : float_1024;
	signal lout_11 : float_1024;
	signal lout_12 : float_1024;
	signal lout_13 : float_1024;
	signal lout_14 : float_1024;
	signal lout_15 : float_1024;
	signal lout_16 : float_1024;
	signal lout_17 : float_1024;

	signal lin_0 : float_1024;
	signal lin_1 : float_1024;
	signal lin_2 : float_1024;
	signal lin_3 : float_1024;
	signal lin_4 : float_1024;
	signal lin_5 : float_1024;
	signal lin_6 : float_1024;
	signal lin_7 : float_1024;
	signal lin_8 : float_1024;
	signal lin_9 : float_1024;
	signal lin_10 : float_1024;
	signal lin_11 : float_1024;
	signal lin_12 : float_1024;
	signal lin_13 : float_1024;
	signal lin_14 : float_1024;
	signal lin_15 : float_1024;
	signal lin_16 : float_1024;
	signal lin_17 : float_1024;
begin
	benes_layer_0 : benes_layer
		port map (
			clk  => clk,
			din  => din,
			cs   => all_cs(0),
			dout => lout_0
		);

	benes_layer_1 : benes_layer
		port map (
			clk  => clk,
			din  => lin_0,
			cs   => all_cs(1),
			dout => lout_1
		);

	benes_layer_2 : benes_layer
		port map (
			clk  => clk,
			din  => lin_1,
			cs   => all_cs(2),
			dout => lout_2
		);

	benes_layer_3 : benes_layer
		port map (
			clk  => clk,
			din  => lin_2,
			cs   => all_cs(3),
			dout => lout_3
		);

	benes_layer_4 : benes_layer
		port map (
			clk  => clk,
			din  => lin_3,
			cs   => all_cs(4),
			dout => lout_4
		);

	benes_layer_5 : benes_layer
		port map (
			clk  => clk,
			din  => lin_4,
			cs   => all_cs(5),
			dout => lout_5
		);

	benes_layer_6 : benes_layer
		port map (
			clk  => clk,
			din  => lin_5,
			cs   => all_cs(6),
			dout => lout_6
		);

	benes_layer_7 : benes_layer
		port map (
			clk  => clk,
			din  => lin_6,
			cs   => all_cs(7),
			dout => lout_7
		);

	benes_layer_8 : benes_layer
		port map (
			clk  => clk,
			din  => lin_7,
			cs   => all_cs(8),
			dout => lout_8
		);

	benes_layer_9 : benes_layer
		port map (
			clk  => clk,
			din  => lin_8,
			cs   => all_cs(9),
			dout => lout_9
		);

	benes_layer_10 : benes_layer
		port map (
			clk  => clk,
			din  => lin_9,
			cs   => all_cs(10),
			dout => lout_10
		);

	benes_layer_11 : benes_layer
		port map (
			clk  => clk,
			din  => lin_10,
			cs   => all_cs(11),
			dout => lout_11
		);

	benes_layer_12 : benes_layer
		port map (
			clk  => clk,
			din  => lin_11,
			cs   => all_cs(12),
			dout => lout_12
		);

	benes_layer_13 : benes_layer
		port map (
			clk  => clk,
			din  => lin_12,
			cs   => all_cs(13),
			dout => lout_13
		);

	benes_layer_14 : benes_layer
		port map (
			clk  => clk,
			din  => lin_13,
			cs   => all_cs(14),
			dout => lout_14
		);

	benes_layer_15 : benes_layer
		port map (
			clk  => clk,
			din  => lin_14,
			cs   => all_cs(15),
			dout => lout_15
		);

	benes_layer_16 : benes_layer
		port map (
			clk  => clk,
			din  => lin_15,
			cs   => all_cs(16),
			dout => lout_16
		);

	benes_layer_17 : benes_layer
		port map (
			clk  => clk,
			din  => lin_16,
			cs   => all_cs(17),
			dout => lout_17
		);

	benes_layer_18 : benes_layer
		port map (
			clk  => clk,
			din  => lin_17,
			cs   => all_cs(18),
			dout => dout
		);

	GEN_CON_0:
	for i in 0 to 511 generate
		lin_0(i) <= lout_0(2*i);
		lin_0(i + 512) <= lout_0(2*i + 1);
	end generate GEN_CON_0;

	GEN_CON_1:
	for i in 0 to 1 generate
		j_loop_1:
		for j in 0 to 255 generate
			lin_1(i*512 + j) <= lout_1(i*512 + 2*j);
			lin_1(i*512 + j + 256) <= lout_1(i*512 + 2*j + 1);
		end generate j_loop_1;
	end generate GEN_CON_1;

	GEN_CON_2:
	for i in 0 to 3 generate
		j_loop_2:
		for j in 0 to 127 generate
			lin_2(i*256 + j) <= lout_2(i*256 + 2*j);
			lin_2(i*256 + j + 128) <= lout_2(i*256 + 2*j + 1);
		end generate j_loop_2;
	end generate GEN_CON_2;

	GEN_CON_3:
	for i in 0 to 7 generate
		j_loop_3:
		for j in 0 to 63 generate
			lin_3(i*128 + j) <= lout_3(i*128 + 2*j);
			lin_3(i*128 + j + 64) <= lout_3(i*128 + 2*j + 1);
		end generate j_loop_3;
	end generate GEN_CON_3;

	GEN_CON_4:
	for i in 0 to 15 generate
		j_loop_4:
		for j in 0 to 31 generate
			lin_4(i*64 + j) <= lout_4(i*64 + 2*j);
			lin_4(i*64 + j + 32) <= lout_4(i*64 + 2*j + 1);
		end generate j_loop_4;
	end generate GEN_CON_4;

	GEN_CON_5:
	for i in 0 to 31 generate
		j_loop_5:
		for j in 0 to 15 generate
			lin_5(i*32 + j) <= lout_5(i*32 + 2*j);
			lin_5(i*32 + j + 16) <= lout_5(i*32 + 2*j + 1);
		end generate j_loop_5;
	end generate GEN_CON_5;

	GEN_CON_6:
	for i in 0 to 63 generate
		j_loop_6:
		for j in 0 to 7 generate
			lin_6(i*16 + j) <= lout_6(i*16 + 2*j);
			lin_6(i*16 + j + 8) <= lout_6(i*16 + 2*j + 1);
		end generate j_loop_6;
	end generate GEN_CON_6;

	GEN_CON_7:
	for i in 0 to 127 generate
		j_loop_7:
		for j in 0 to 3 generate
			lin_7(i*8 + j) <= lout_7(i*8 + 2*j);
			lin_7(i*8 + j + 4) <= lout_7(i*8 + 2*j + 1);
		end generate j_loop_7;
	end generate GEN_CON_7;

	GEN_CON_8:
	for i in 0 to 255 generate
		j_loop_8:
		for j in 0 to 1 generate
			lin_8(i*4 + j) <= lout_8(i*4 + 2*j);
			lin_8(i*4 + j + 2) <= lout_8(i*4 + 2*j + 1);
		end generate j_loop_8;
	end generate GEN_CON_8;

	GEN_CON_9:
	for i in 0 to 255 generate
		j_loop_9:
		for j in 0 to 1 generate
			lin_9(i*4 + j) <= lout_9(i*4 + 2*j);
			lin_9(i*4 + j + 2) <= lout_9(i*4 + 2*j + 1);
		end generate j_loop_9;
	end generate GEN_CON_9;

	GEN_CON_10:
	for i in 0 to 127 generate
		j_loop_10:
		for j in 0 to 3 generate
			lin_10(i*8 + 2*j) <= lout_10(i*8 + j);
			lin_10(i*8 + 2*j + 1) <= lout_10(i*8 + j + 4);
		end generate j_loop_10;
	end generate GEN_CON_10;

	GEN_CON_11:
	for i in 0 to 63 generate
		j_loop_11:
		for j in 0 to 7 generate
			lin_11(i*16 + 2*j) <= lout_11(i*16 + j);
			lin_11(i*16 + 2*j + 1) <= lout_11(i*16 + j + 8);
		end generate j_loop_11;
	end generate GEN_CON_11;

	GEN_CON_12:
	for i in 0 to 31 generate
		j_loop_12:
		for j in 0 to 15 generate
			lin_12(i*32 + 2*j) <= lout_12(i*32 + j);
			lin_12(i*32 + 2*j + 1) <= lout_12(i*32 + j + 16);
		end generate j_loop_12;
	end generate GEN_CON_12;

	GEN_CON_13:
	for i in 0 to 15 generate
		j_loop_13:
		for j in 0 to 31 generate
			lin_13(i*64 + 2*j) <= lout_13(i*64 + j);
			lin_13(i*64 + 2*j + 1) <= lout_13(i*64 + j + 32);
		end generate j_loop_13;
	end generate GEN_CON_13;

	GEN_CON_14:
	for i in 0 to 7 generate
		j_loop_14:
		for j in 0 to 63 generate
			lin_14(i*128 + 2*j) <= lout_14(i*128 + j);
			lin_14(i*128 + 2*j + 1) <= lout_14(i*128 + j + 64);
		end generate j_loop_14;
	end generate GEN_CON_14;

	GEN_CON_15:
	for i in 0 to 3 generate
		j_loop_15:
		for j in 0 to 127 generate
			lin_15(i*256 + 2*j) <= lout_15(i*256 + j);
			lin_15(i*256 + 2*j + 1) <= lout_15(i*256 + j + 128);
		end generate j_loop_15;
	end generate GEN_CON_15;

	GEN_CON_16:
	for i in 0 to 1 generate
		j_loop_16:
		for j in 0 to 255 generate
			lin_16(i*512 + 2*j) <= lout_16(i*512 + j);
			lin_16(i*512 + 2*j + 1) <= lout_16(i*512 + j + 256);
		end generate j_loop_16;
	end generate GEN_CON_16;

	GEN_CON_17:
	for i in 0 to 511 generate
		lin_17(2*i) <= lout_17(i);
		lin_17(2*i + 1) <= lout_17(i + 512);
	end generate GEN_CON_17;


end Behavioral;
