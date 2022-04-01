----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2021 17:17:43
-- Design Name: 
-- Module Name: program_counter - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity program_counter is
    Port ( 
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
end program_counter;

architecture Behavioral of program_counter is
	signal benes_ren_s   : STD_LOGIC;
	signal benes_wen_s   : STD_LOGIC;
	signal data_ren_s    : STD_LOGIC;
	signal data_wen_s    : STD_LOGIC;
	signal FIFO_wen_s    : STD_LOGIC;
	signal FIFO_ren_s    : STD_LOGIC;
	signal ONE_s         : STD_LOGIC;
	signal RELU_en_s     : STD_LOGIC;
	signal compare_en_s  : STD_LOGIC;
	signal input_sel_s   : STD_LOGIC_VECTOR(1 DOWNTO 0);
	signal benes_raddr_s : STD_LOGIC_VECTOR(8 DOWNTO 0);
	signal benes_waddr_s : STD_LOGIC_VECTOR(8 DOWNTO 0);
	signal data_raddr_s  : STD_LOGIC_VECTOR(8 DOWNTO 0);
	signal data_waddr_s  : STD_LOGIC_VECTOR(8 DOWNTO 0);
begin

	benes_ren   <= benes_ren_s;
	benes_wen   <= benes_wen_s;
	data_ren    <= data_ren_s;
	data_wen    <= data_wen_s;
	FIFO_wen    <= FIFO_wen_s;
	FIFO_ren    <= FIFO_ren_s;
	ONE         <= ONE_s;
	RELU_en     <= RELU_en_s;
	compare_en  <= compare_en_s;
	input_sel   <= input_sel_s;
	benes_raddr <= benes_raddr_s;
	benes_waddr <= benes_waddr_s;
	data_raddr  <= data_raddr_s;
	data_waddr  <= data_waddr_s;

	process(clk, rst)
	begin
		if rst = '1' then
			benes_ren_s <= '0';
			benes_wen_s <= '0';
			data_ren_s <= '0';
			data_wen_s <= '0';
			FIFO_wen_s <= '0';
			FIFO_ren_s <= '0';
			ONE_s <= '0';
			RELU_en_s <= '0';
			compare_en_s <= '0';
			input_sel_s <= "00";
			benes_raddr_s <= (others => '0');
			benes_waddr_s <= (others => '0');
			data_raddr_s <= (others => '0');
			data_waddr_s <= (others => '0');
			data_bw <= (others => '0');
		elsif (rising_edge(clk)) then
			benes_ren_s <= not benes_ren_s;
			benes_wen_s <= not benes_wen_s;
			data_ren_s <= not data_ren_s;
			data_wen_s <= not data_wen_s;
			FIFO_wen_s <= not FIFO_wen_s;
			FIFO_ren_s <= not FIFO_ren_s;
			ONE_s <= not ONE_s;
			RELU_en_s <= not RELU_en_s;
			compare_en_s <= not compare_en_s;
			input_sel_s <= input_sel_s + 1;
			benes_raddr_s <= benes_raddr_s + 1;
			benes_waddr_s <= benes_waddr_s + 1;
			data_raddr_s <= data_raddr_s + 1;
			data_waddr_s <= data_waddr_s + 1;
			data_bw <= (others => '1');
		end if;
	end process;

end Behavioral;
