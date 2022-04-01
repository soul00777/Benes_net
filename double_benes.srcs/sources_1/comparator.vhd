----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2021 18:38:24
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
	Port (
		clk: in STD_LOGIC;
		a_data: in STD_LOGIC_VECTOR(15 DOWNTO 0);
		b_data: in STD_LOGIC_VECTOR(15 DOWNTO 0);
		result_data: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
end comparator;

architecture Behavioral of comparator is
	component bfloat16_compare
		port (
			aclk: in STD_LOGIC;
			s_axis_a_tvalid: in STD_LOGIC;
			s_axis_a_tdata: in STD_LOGIC_VECTOR(15 DOWNTO 0);
			s_axis_b_tvalid: in STD_LOGIC;
			s_axis_b_tdata: in STD_LOGIC_VECTOR(15 DOWNTO 0);
			m_axis_result_tvalid: out STD_LOGIC;
			m_axis_result_tdata: out STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	end component bfloat16_compare;

	signal condition: STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal a_data_d1: STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal a_data_d2: STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal b_data_d1: STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal b_data_d2: STD_LOGIC_VECTOR(15 DOWNTO 0);
begin

	process(clk)
	begin
		if rising_edge(clk) then
			a_data_d1 <= a_data;
			a_data_d2 <= a_data_d1;
			b_data_d1 <= b_data;
			b_data_d2 <= b_data_d1;
			if condition(0) = '1' then
				result_data <= a_data_d2;
			else
				result_data <= b_data_d2;
			end if;
		end if;
	end process;

	bfloat16_compare_0 : bfloat16_compare
		port map (
			aclk => clk,
			s_axis_a_tvalid => '1',
			s_axis_a_tdata => a_data,
			s_axis_b_tvalid => '1',
			s_axis_b_tdata => b_data,
			m_axis_result_tvalid => open,
			m_axis_result_tdata => condition
		);

end Behavioral;
