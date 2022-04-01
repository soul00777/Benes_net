----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2021 20:32:21
-- Design Name: 
-- Module Name: ADDER - Behavioral
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

entity ADDER is
	Port (
		clk: in STD_LOGIC;
		a_data: in STD_LOGIC_VECTOR(15 DOWNTO 0);
		b_data: in STD_LOGIC_VECTOR(15 DOWNTO 0);
		result_data: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
end ADDER;

architecture Behavioral of ADDER is
	component bfloat16_add
		port (
			aclk: in STD_LOGIC;
			s_axis_a_tvalid: in STD_LOGIC;
			s_axis_a_tdata: in STD_LOGIC_VECTOR(15 DOWNTO 0);
			s_axis_b_tvalid: in STD_LOGIC;
			s_axis_b_tdata: in STD_LOGIC_VECTOR(15 DOWNTO 0);
			m_axis_result_tvalid: out STD_LOGIC;
			m_axis_result_tdata: out STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	end component bfloat16_mult;
begin
	bfloat16_add_0 : bfloat16_add
		port map (
			aclk => clk,
			s_axis_a_tvalid => '1',
			s_axis_a_tdata => a_data,
			s_axis_b_tvalid => '1',
			s_axis_b_tdata => b_data,
			m_axis_result_tvalid => open,
			m_axis_result_tdata => result_data
		);

end Behavioral;
