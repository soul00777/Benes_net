----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2021 21:58:33
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( 
    	clk_in1_p : in  STD_LOGIC;
    	clk_in1_n : in  STD_LOGIC;
    	rst   	  : in  STD_LOGIC;
    	dummy     : out STD_LOGIC
    );
end top;

architecture Behavioral of top is
	component clk_gen
		port (
			clk_in1_p   : in  STD_LOGIC;
			clk_in1_n  	: in  STD_LOGIC;
			clk_out1 	: out STD_LOGIC
		);
	end component clk_gen;

	component program_counter
		port (
			clk         : in  STD_LOGIC;
			rst         : in  STD_LOGIC;
			benes_ren   : out STD_LOGIC;
			benes_wen   : out STD_LOGIC;
			data_ren    : out STD_LOGIC;
			data_wen    : out STD_LOGIC;
			FIFO_wen    : out STD_LOGIC;
			FIFO_ren    : out STD_LOGIC;
			ONE         : out STD_LOGIC;
			RELU_en     : out STD_LOGIC;
			compare_en  : out STD_LOGIC;
			input_sel   : out STD_LOGIC_VECTOR(1 DOWNTO 0);
			benes_raddr : out STD_LOGIC_VECTOR(8 DOWNTO 0);
			benes_waddr : out STD_LOGIC_VECTOR(8 DOWNTO 0);
			data_raddr  : out STD_LOGIC_VECTOR(8 DOWNTO 0);
			data_waddr  : out STD_LOGIC_VECTOR(8 DOWNTO 0);
			data_bw     : out STD_LOGIC_VECTOR(1023 DOWNTO 0)
		);
	end component program_counter;

	component compose
		port (
			clk         : in  STD_LOGIC;
			rst         : in  STD_LOGIC;
			benes_ren   : in  STD_LOGIC;
			benes_wen   : in  STD_LOGIC;
			data_ren    : in  STD_LOGIC;
			data_wen    : in  STD_LOGIC;
			FIFO_wen    : in  STD_LOGIC;
			FIFO_ren    : in  STD_LOGIC;
			ONE         : in  STD_LOGIC;
			RELU_en     : in  STD_LOGIC;
			compare_en  : in  STD_LOGIC;
			input_sel   : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
			benes_raddr : in  STD_LOGIC_VECTOR(8 DOWNTO 0);
			benes_waddr : in  STD_LOGIC_VECTOR(8 DOWNTO 0);
			data_raddr  : in  STD_LOGIC_VECTOR(8 DOWNTO 0);
			data_waddr  : in  STD_LOGIC_VECTOR(8 DOWNTO 0);
			data_bw     : in  STD_LOGIC_VECTOR(1023 DOWNTO 0);
			dummy       : out STD_LOGIC
		);
	end component compose;	

	signal clk         : STD_LOGIC;
	signal benes_ren   : STD_LOGIC;
	signal benes_wen   : STD_LOGIC;

	signal data_ren    : STD_LOGIC;
	signal data_wen    : STD_LOGIC;
	signal FIFO_wen    : STD_LOGIC;
	signal FIFO_ren    : STD_LOGIC;
	signal ONE         : STD_LOGIC;
	signal RELU_en     : STD_LOGIC;
	signal compare_en  : STD_LOGIC;
	signal input_sel   : STD_LOGIC_VECTOR(1 DOWNTO 0);
	signal benes_raddr : STD_LOGIC_VECTOR(8 DOWNTO 0);
	signal benes_waddr : STD_LOGIC_VECTOR(8 DOWNTO 0);

	signal data_raddr  : STD_LOGIC_VECTOR(8 DOWNTO 0);
	signal data_waddr  : STD_LOGIC_VECTOR(8 DOWNTO 0);
	signal data_bw     : STD_LOGIC_VECTOR(1023 DOWNTO 0);	
begin
	clk_gen_1 : clk_gen
		port map (
			clk_in1_p   => clk_in1_p,
			clk_in1_n   => clk_in1_n,
			clk_out1 	=> clk
		);

	program_counter_1 : program_counter
		port map (
			clk         => clk,
			rst         => rst,
			benes_ren   => benes_ren,
			benes_wen   => benes_wen,
			data_ren    => data_ren,
			data_wen    => data_wen,
			FIFO_wen    => FIFO_wen,
			FIFO_ren    => FIFO_ren,
			ONE         => ONE,
			RELU_en     => RELU_en,
			compare_en  => compare_en,
			input_sel   => input_sel,
			benes_raddr => benes_raddr,
			benes_waddr => benes_waddr,
			data_raddr  => data_raddr,
			data_waddr  => data_waddr,
			data_bw     => data_bw
		);

	compose_1 : compose
		port map (
			clk          => clk,
			rst          => rst,
			benes_ren    => benes_ren,
			benes_wen    => benes_wen,
			data_ren     => data_ren,
			data_wen     => data_wen,
			FIFO_wen     => FIFO_wen,
			FIFO_ren     => FIFO_ren,
			ONE          => ONE,
			RELU_en      => RELU_en,
			compare_en   => compare_en,
			input_sel    => input_sel,
			benes_raddr  => benes_raddr,
			benes_waddr  => benes_waddr,
			data_raddr   => data_raddr,
			data_waddr   => data_waddr,
			data_bw      => data_bw,
			dummy        => dummy
		);	

end Behavioral;
