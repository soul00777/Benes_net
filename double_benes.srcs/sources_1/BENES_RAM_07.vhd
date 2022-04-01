----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2021 04:29:11
-- Design Name: 
-- Module Name: BENES_RAM_07 - Behavioral
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

entity BENES_RAM_07 is
	port (
		clk  : IN  STD_LOGIC;
		wen   : IN  STD_LOGIC;
		waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
		din  : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
		ren   : IN  STD_LOGIC;
		raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
		dout : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
	);
end BENES_RAM_07;

architecture Behavioral of BENES_RAM_07 is
	component DPRAM_512x512_BENES_7
		port (
			clka  : IN  STD_LOGIC;
			ena   : IN  STD_LOGIC;
			wea   : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
			addra : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dina  : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			clkb  : IN  STD_LOGIC;
			enb   : IN  STD_LOGIC;
			addrb : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			doutb : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component DPRAM_512x512_BENES_7;

	signal wea: STD_LOGIC_VECTOR(0 DOWNTO 0);
begin
	wea(0) <= wen;
	DPRAM_512x512_BENES_7_1 : DPRAM_512x512_BENES_7
		port map (
			clka  => clk,
			ena   => wen,
			wea   => wea,
			addra => waddr,
			dina  => din,
			clkb  => clk,
			enb   => ren,
			addrb => raddr,
			doutb => dout
		);	

end Behavioral;
