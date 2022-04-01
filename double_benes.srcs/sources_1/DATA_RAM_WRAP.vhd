----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2021 20:07:42
-- Design Name: 
-- Module Name: DATA_RAM_WRAP - Behavioral
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

entity DATA_RAM_WRAP is
    Port (
		clk  : IN  STD_LOGIC;
		wen   : IN  STD_LOGIC;
		bw   : IN  STD_LOGIC_VECTOR(1023 DOWNTO 0);
		waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
		din  : IN  float_1024;
		ren   : IN  STD_LOGIC;
		raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
		dout : OUT float_1024
	);
end DATA_RAM_WRAP;

architecture Behavioral of DATA_RAM_WRAP is
	signal bw_sig: STD_LOGIC_VECTOR(2047 DOWNTO 0);
	signal bwa: STD_LOGIC_VECTOR(511 DOWNTO 0);
	signal bwb: STD_LOGIC_VECTOR(511 DOWNTO 0);
	signal bwc: STD_LOGIC_VECTOR(511 DOWNTO 0);
	signal bwd: STD_LOGIC_VECTOR(511 DOWNTO 0);

	signal dina: STD_LOGIC_VECTOR(4095 DOWNTO 0);
	signal dinb: STD_LOGIC_VECTOR(4095 DOWNTO 0);
	signal dinc: STD_LOGIC_VECTOR(4095 DOWNTO 0);
	signal dind: STD_LOGIC_VECTOR(4095 DOWNTO 0);

	signal douta: STD_LOGIC_VECTOR(4095 DOWNTO 0);
	signal doutb: STD_LOGIC_VECTOR(4095 DOWNTO 0);
	signal doutc: STD_LOGIC_VECTOR(4095 DOWNTO 0);
	signal doutd: STD_LOGIC_VECTOR(4095 DOWNTO 0);

	signal din_sig: STD_LOGIC_VECTOR(16383 DOWNTO 0);
	signal dout_sig: STD_LOGIC_VECTOR(16383 DOWNTO 0);

	component DATA_RAM_A
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			bw    : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(4095 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(4095 DOWNTO 0)
		);
	end component DATA_RAM_A;

	component DATA_RAM_B
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			bw    : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(4095 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(4095 DOWNTO 0)
		);
	end component DATA_RAM_B;

	component DATA_RAM_C
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			bw    : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(4095 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(4095 DOWNTO 0)
		);
	end component DATA_RAM_C;

	component DATA_RAM_D
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			bw    : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(4095 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(4095 DOWNTO 0)
		);
	end component DATA_RAM_D;

begin
	dinout_gen:
	for i in 0 to 1023 generate
		din_sig((i*16+15) DOWNTO (i*16)) <= din(i);
		dout(1023-i) <= dout_sig((i*16+15) DOWNTO (i*16));
		bw_sig(i*2) <= bw(i);
		bw_sig(i*2+1) <= bw(i);
	end generate dinout_gen;
	
	bwa <= bw_sig(2047 DOWNTO 1536);
	bwb <= bw_sig(1535 DOWNTO 1024);
	bwc <= bw_sig(1023 DOWNTO 512);
	bwd <= bw_sig(511 DOWNTO 0);

	dina <= din_sig(16383 DOWNTO 12288);
	dinb <= din_sig(12287 DOWNTO 8192);
	dinc <= din_sig(8191 DOWNTO 4096);
	dind <= din_sig(4095 DOWNTO 0);

	dout_sig <= douta & doutb & doutc & doutd;


	DATA_RAM_A_1 : DATA_RAM_A
		port map (
			clk   => clk,
			wen   => wen,
			bw    => bwa,
			waddr => waddr,
			din   => dina,
			ren   => ren,
			raddr => raddr,
			dout  => douta
		);

	DATA_RAM_B_1 : DATA_RAM_B
		port map (
			clk   => clk,
			wen   => wen,
			bw    => bwb,
			waddr => waddr,
			din   => dinb,
			ren   => ren,
			raddr => raddr,
			dout  => doutb
		);

	DATA_RAM_C_1 : DATA_RAM_C
		port map (
			clk   => clk,
			wen   => wen,
			bw    => bwc,
			waddr => waddr,
			din   => dinc,
			ren   => ren,
			raddr => raddr,
			dout  => doutc
		);

	DATA_RAM_D_1 : DATA_RAM_D
		port map (
			clk   => clk,
			wen   => wen,
			bw    => bwd,
			waddr => waddr,
			din   => dind,
			ren   => ren,
			raddr => raddr,
			dout  => doutd
		);


end Behavioral;
