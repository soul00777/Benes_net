----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2021 04:50:32
-- Design Name: 
-- Module Name: BENES_RAM_WRAP - Behavioral
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

entity BENES_RAM_WRAP is
    port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  data_19x512;
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT data_19x512
	);
end BENES_RAM_WRAP;

architecture Behavioral of BENES_RAM_WRAP is

	component BENES_RAM_01
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_01;

	component BENES_RAM_02
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_02;

	component BENES_RAM_03
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_03;

	component BENES_RAM_04
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_04;

	component BENES_RAM_05
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_05;

	component BENES_RAM_06
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_06;

	component BENES_RAM_07
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_07;

	component BENES_RAM_08
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_08;

	component BENES_RAM_09
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_09;

	component BENES_RAM_10
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_10;

	component BENES_RAM_11
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_11;

	component BENES_RAM_12
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_12;

	component BENES_RAM_13
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_13;

	component BENES_RAM_14
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_14;

	component BENES_RAM_15
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_15;

	component BENES_RAM_16
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_16;

	component BENES_RAM_17
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_17;

	component BENES_RAM_18
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_18;

	component BENES_RAM_19
		port (
			clk   : IN  STD_LOGIC;
			wen   : IN  STD_LOGIC;
			waddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			din   : IN  STD_LOGIC_VECTOR(511 DOWNTO 0);
			ren   : IN  STD_LOGIC;
			raddr : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
			dout  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
	end component BENES_RAM_19;



begin

	BENES_RAM_01_1 : BENES_RAM_01
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(0),
			ren   => ren,
			raddr => raddr,
			dout  => dout(0)
		);

	BENES_RAM_02_1 : BENES_RAM_02
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(1),
			ren   => ren,
			raddr => raddr,
			dout  => dout(1)
		);

	BENES_RAM_03_1 : BENES_RAM_03
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(2),
			ren   => ren,
			raddr => raddr,
			dout  => dout(2)
		);

	BENES_RAM_04_1 : BENES_RAM_04
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(3),
			ren   => ren,
			raddr => raddr,
			dout  => dout(3)
		);

	BENES_RAM_05_1 : BENES_RAM_05
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(4),
			ren   => ren,
			raddr => raddr,
			dout  => dout(4)
		);

	BENES_RAM_06_1 : BENES_RAM_06
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(5),
			ren   => ren,
			raddr => raddr,
			dout  => dout(5)
		);

	BENES_RAM_07_1 : BENES_RAM_07
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(6),
			ren   => ren,
			raddr => raddr,
			dout  => dout(6)
		);

	BENES_RAM_08_1 : BENES_RAM_08
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(7),
			ren   => ren,
			raddr => raddr,
			dout  => dout(7)
		);

	BENES_RAM_09_1 : BENES_RAM_09
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(8),
			ren   => ren,
			raddr => raddr,
			dout  => dout(8)
		);

	BENES_RAM_10_1 : BENES_RAM_10
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(9),
			ren   => ren,
			raddr => raddr,
			dout  => dout(9)
		);

	BENES_RAM_11_1 : BENES_RAM_11
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(10),
			ren   => ren,
			raddr => raddr,
			dout  => dout(10)
		);

	BENES_RAM_12_1 : BENES_RAM_12
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(11),
			ren   => ren,
			raddr => raddr,
			dout  => dout(11)
		);

	BENES_RAM_13_1 : BENES_RAM_13
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(12),
			ren   => ren,
			raddr => raddr,
			dout  => dout(12)
		);

	BENES_RAM_14_1 : BENES_RAM_14
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(13),
			ren   => ren,
			raddr => raddr,
			dout  => dout(13)
		);

	BENES_RAM_15_1 : BENES_RAM_15
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(14),
			ren   => ren,
			raddr => raddr,
			dout  => dout(14)
		);

	BENES_RAM_16_1 : BENES_RAM_16
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(15),
			ren   => ren,
			raddr => raddr,
			dout  => dout(15)
		);

	BENES_RAM_17_1 : BENES_RAM_17
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(16),
			ren   => ren,
			raddr => raddr,
			dout  => dout(16)
		);

	BENES_RAM_18_1 : BENES_RAM_18
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(17),
			ren   => ren,
			raddr => raddr,
			dout  => dout(17)
		);

	BENES_RAM_19_1 : BENES_RAM_19
		port map (
			clk   => clk,
			wen   => wen,
			waddr => waddr,
			din   => din(18),
			ren   => ren,
			raddr => raddr,
			dout  => dout(18)
		);


end Behavioral;
