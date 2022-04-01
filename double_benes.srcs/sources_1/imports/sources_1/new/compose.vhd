----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2021 21:48:45
-- Design Name: 
-- Module Name: compose - Behavioral
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

entity compose is
    Port ( 
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
end compose;

architecture Behavioral of compose is
	component BENES_RAM_WRAP
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  data_19x512;
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT data_19x512
		);
	end component BENES_RAM_WRAP;

	component benes_network
		port (
			clk    : in  STD_LOGIC;
			din    : in  float_1024;
			all_cs : in  data_19x512;
			dout   : out float_1024
		);
	end component benes_network;

	component DATA_RAM_WRAP
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			bw    : IN  STD_LOGIC_VECTOR(1023 DOWNTO 0);
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  float_1024;
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT float_1024
		);
	end component DATA_RAM_WRAP;

	component FIFO_module
		port (
			clk   : IN  STD_LOGIC;
			rst   : IN  STD_LOGIC;
			one   : IN  STD_LOGIC;
			din   : IN  float_1024;
			wr_en : IN  STD_LOGIC;
			rd_en : IN  STD_LOGIC;
			dout  : OUT float_1024
		);
	end component FIFO_module;

	component ADDER_TREE
		port (
			clk      : in  STD_LOGIC;
			in_data  : in  float_1024;
			out_data : out float_1024
		);
	end component ADDER_TREE;

	component MULT_module
		port (
			clk         : in  STD_LOGIC;
			a_data      : in  float_1024;
			b_data      : in  float_1024;
			result_data : out float_1024
		);
	end component MULT_module;

	component RELU_module
		port (
			clk      : in  STD_LOGIC;
			en       : in  STD_LOGIC;
			in_data  : in  float_1024;
			out_data : out float_1024
		);
	end component RELU_module;

	component COMPARE_TREE
		port (
			clk      : in  STD_LOGIC;
			in_data  : in  float_1024;
			out_data : out float_1024
		);
	end component COMPARE_TREE;

	component program_counter
		port (
			clk         : in  STD_LOGIC;
			rst         : in  STD_LOGIC;
			benes_ren   : out STD_LOGIC;
			benes_wen   : out STD_LOGIC;
			data_ren    : out STD_LOGIC;
			data_wen    : out STD_LOGIC;
			benes_raddr : out STD_LOGIC_VECTOR(8 DOWNTO 0);
			benes_waddr : out STD_LOGIC_VECTOR(8 DOWNTO 0);
			data_raddr  : out STD_LOGIC_VECTOR(8 DOWNTO 0);
			data_waddr  : out STD_LOGIC_VECTOR(8 DOWNTO 0);
			data_bw     : out STD_LOGIC_VECTOR(1023 DOWNTO 0)
		);
	end component program_counter;

	component bias_adder
		port (
			clk      : in  STD_LOGIC;
			in_data  : in  float_1024;
			bias     : in  float_1024;
			out_data : out float_1024
		);
	end component bias_adder;	

	signal benes_control_bit: data_19x512;
	signal benes_control_bit2: data_19x512;
	signal ram_data: float_1024;
	signal weight: float_1024;
	signal MULT_result: float_1024;
	signal ADD_result: float_1024;
	signal BIAS_result: float_1024;
	signal RELU_result: float_1024;
	signal MP_result: float_1024;
	signal input_data: float_1024;
	signal benes_data_out: float_1024;
	signal benes_data_out2: float_1024;

begin
	dummy <= ram_data(1022)(1);

	BENES_RAM_WRAP_1 : BENES_RAM_WRAP
		port map (
			clk   => clk,
			wen   => benes_wen,
			waddr => benes_waddr,
			din   => ((others=> (others=>'0'))),
			ren   => benes_ren,
			raddr => benes_raddr,
			dout  => benes_control_bit
		);

	benes_network_1 : benes_network
		port map (
			clk    => clk,
			din    => ram_data,
			all_cs => benes_control_bit,
			dout   => benes_data_out
		);

	DATA_RAM_WRAP_1 : DATA_RAM_WRAP
		port map (
			clk   => clk,
			wen   => data_wen,
			bw    => data_bw,
			waddr => data_waddr,
			din   => MP_result,
			ren   => data_ren,
			raddr => data_raddr,
			dout  => ram_data
		);

	FIFO_module_1 : FIFO_module
		port map (
			clk   => clk,
			rst   => rst,
			one   => ONE,
			din   => ram_data,
			wr_en => FIFO_wen,
			rd_en => FIFO_ren,
			dout  => weight
		);

	MULT_module_1 : MULT_module
		port map (
			clk         => clk,
			a_data      => benes_data_out,
			b_data      => weight,
			result_data => MULT_result
		);	

	ADDER_TREE_1 : ADDER_TREE
		port map (
			clk      => clk,
			in_data  => MULT_result,
			out_data => ADD_result
		);

	bias_adder_1 : bias_adder
		port map (
			clk      => clk,
			in_data  => ADD_result,
			bias     => ram_data,
			out_data => BIAS_result
		);	

	RELU_module_1 : RELU_module
		port map (
			clk      => clk,
			en       => RELU_en,
			in_data  => BIAS_result,
			out_data => RELU_result
		);

	benes_network_2 : benes_network
		port map (
			clk    => clk,
			din    => RELU_result,
			all_cs => benes_control_bit,
			dout   => benes_data_out2
		);

	COMPARE_TREE_1 : COMPARE_TREE
		port map (
			clk      => clk,
			in_data  => benes_data_out2,
			out_data => MP_result
		);

end Behavioral;
