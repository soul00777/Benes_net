----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2021 19:52:36
-- Design Name: 
-- Module Name: DATA_RAM_B - Behavioral
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

entity DATA_RAM_B is
    Port ( 
		clk  : IN  STD_LOGIC;
		wen   : IN  STD_LOGIC;
		bw   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
		waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
		din  : IN  STD_LOGIC_VECTOR(4095 DOWNTO 0);
		ren   : IN  STD_LOGIC;
		raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
		dout : OUT STD_LOGIC_VECTOR(4095 DOWNTO 0)
	);
end DATA_RAM_B;

architecture Behavioral of DATA_RAM_B is
	component DPRAM_4096x512_B
		port (
			clka  : IN  STD_LOGIC;
			ena   : IN  STD_LOGIC;
			wea   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			addra : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dina  : IN  STD_LOGIC_VECTOR(4095 DOWNTO 0);
			clkb  : IN  STD_LOGIC;
			enb   : IN  STD_LOGIC;
			addrb : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			doutb : OUT STD_LOGIC_VECTOR(4095 DOWNTO 0)
		);
	end component DPRAM_4096x512_B;
begin
	DPRAM_4096x512_B_1 : DPRAM_4096x512_B
		port map (
			clka  => clk,
			ena   => wen,
			wea   => bw,
			addra => waddr,
			dina  => din,
			clkb  => clk,
			enb   => ren,
			addrb => raddr,
			doutb => dout
		);	

end Behavioral;
