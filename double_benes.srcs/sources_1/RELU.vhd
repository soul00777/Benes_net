----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2021 18:56:42
-- Design Name: 
-- Module Name: RELU - Behavioral
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

entity RELU is
    Port ( 
    	clk : in STD_LOGIC;
    	en: in STD_LOGIC;
    	in_data: in STD_LOGIC_VECTOR(15 DOWNTO 0);
    	out_data: out STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
end RELU;

architecture Behavioral of RELU is

begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if en = '1' then
				if in_data(15) = '1' then
					out_data <= (others => '0');
				else
					out_data <= in_data;
				end if;
			else
				out_data <= in_data;
			end if;
		end if;
	end process;

end Behavioral;
