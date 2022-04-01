----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2021 15:27:33
-- Design Name: 
-- Module Name: FIFO_module - Behavioral
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

entity FIFO_module is
    Port (
		clk   : IN  STD_LOGIC;
		rst   : IN  STD_LOGIC;
		one   : IN  STD_LOGIC;
		din   : IN  float_1024;
		wr_en : IN  STD_LOGIC;
		rd_en : IN  STD_LOGIC;
		dout  : OUT float_1024
    );
end FIFO_module;

architecture Behavioral of FIFO_module is
	component FIFO_MUX
		port (
			clk   : IN  STD_LOGIC;
			rst   : IN  STD_LOGIC;
			one   : IN  STD_LOGIC;
			din   : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			wr_en : IN  STD_LOGIC;
			rd_en : IN  STD_LOGIC;
			dout  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	end component FIFO_MUX;	
begin

	GEN_FIFO_MUX_1024:
	for i in 0 to 1023 generate
	FIFO_MUX_1 : FIFO_MUX
		port map (
			clk   => clk,
			rst   => rst,
			one   => one,
			din   => din(i),
			wr_en => wr_en,
			rd_en => rd_en,
			dout  => dout(i)
		);
	end generate GEN_FIFO_MUX_1024;


end Behavioral;
