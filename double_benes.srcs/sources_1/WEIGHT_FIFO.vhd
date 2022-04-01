----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2021 14:57:50
-- Design Name: 
-- Module Name: WEIGHT_FIFO - Behavioral
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

entity WEIGHT_FIFO is
	Port (
		clk         : IN  STD_LOGIC;
		rst         : IN  STD_LOGIC;
		din         : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		wr_en       : IN  STD_LOGIC;
		rd_en       : IN  STD_LOGIC;
		dout        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		full        : OUT STD_LOGIC;
		empty       : OUT STD_LOGIC;
		wr_rst_busy : OUT STD_LOGIC;
		rd_rst_busy : OUT STD_LOGIC
	);
end WEIGHT_FIFO;

architecture Behavioral of WEIGHT_FIFO is
	component bfloat16_fifo
		port (
			clk         : IN  STD_LOGIC;
			srst        : IN  STD_LOGIC;
			din         : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			wr_en       : IN  STD_LOGIC;
			rd_en       : IN  STD_LOGIC;
			dout        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			full        : OUT STD_LOGIC;
			empty       : OUT STD_LOGIC;
			wr_rst_busy : OUT STD_LOGIC;
			rd_rst_busy : OUT STD_LOGIC
		);
	end component bfloat16_fifo;	
begin

	bfloat16_fifo_1 : bfloat16_fifo
		port map (
			clk         => clk,
			srst        => rst,
			din         => din,
			wr_en       => wr_en,
			rd_en       => rd_en,
			dout        => dout,
			full        => full,
			empty       => empty,
			wr_rst_busy => wr_rst_busy,
			rd_rst_busy => rd_rst_busy
		);	

end Behavioral;
