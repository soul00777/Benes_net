----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2021 15:11:15
-- Design Name: 
-- Module Name: FIFO_MUX - Behavioral
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

entity FIFO_MUX is
    Port (
    	clk         : IN  STD_LOGIC;
		rst         : IN  STD_LOGIC;
		one			: IN  STD_LOGIC;
		din         : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		wr_en       : IN  STD_LOGIC;
		rd_en       : IN  STD_LOGIC;
		dout        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
end FIFO_MUX;

architecture Behavioral of FIFO_MUX is
	component WEIGHT_FIFO
		port (
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
	end component WEIGHT_FIFO;

	signal fifo_dout: STD_LOGIC_VECTOR(15 DOWNTO 0);
begin

	process(clk, rst)
	begin
		if(rst = '1') then
			dout <= (others => '0');
		elsif (rising_edge(clk)) then
			if(one = '1') then
				dout <= x"3f80";
			else
				dout <= fifo_dout;
			end if;
		end if;
	end process;

	WEIGHT_FIFO_1 : WEIGHT_FIFO
		port map (
			clk         => clk,
			rst         => rst,
			din         => din,
			wr_en       => wr_en,
			rd_en       => rd_en,
			dout        => fifo_dout,
			full        => open,
			empty       => open,
			wr_rst_busy => open,
			rd_rst_busy => open
		);	

end Behavioral;
