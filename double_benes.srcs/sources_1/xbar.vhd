----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.01.2021 16:33:10
-- Design Name: 
-- Module Name: xbar - Behavioral
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

entity xbar is
    Port ( 
        clk        : in  STD_LOGIC;
        in_data_A  : in  std_logic_vector(15 downto 0);
        in_data_B  : in  std_logic_vector(15 downto 0);
        sel        : in  std_logic;
        out_data_A : out std_logic_vector(15 downto 0);
        out_data_B : out std_logic_vector(15 downto 0)
    );
end xbar;

architecture Behavioral of xbar is

begin

process(clk)
    begin
        if rising_edge(clk) then
            if sel = '0' then
                out_data_A(15 downto 0) <= in_data_A(15 downto 0);
                out_data_B(15 downto 0) <= in_data_B(15 downto 0);
            else
                out_data_A(15 downto 0) <= in_data_B(15 downto 0);
                out_data_B(15 downto 0) <= in_data_A(15 downto 0);
            end if;
        end if;
end process;
end Behavioral;
