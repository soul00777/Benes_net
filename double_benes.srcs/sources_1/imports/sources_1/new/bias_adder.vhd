----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.09.2021 15:54:18
-- Design Name: 
-- Module Name: bias_adder - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
use work.ARRAYLIST.all;

entity bias_adder is
    Port ( 
        clk      : in  STD_LOGIC;
        in_data  : in  float_1024;
        bias     : in  float_1024;
        out_data : out float_1024
    );
end bias_adder;

architecture Behavioral of bias_adder is
    component ADDER
        port (
            clk         : in  STD_LOGIC;
            a_data      : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
            b_data      : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
            result_data : out STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    end component ADDER;
begin
    gen_adder_1023:
    for i in 1023 downto 0 generate
        ADDER_1 : ADDER
            port map (
                clk         => clk,
                a_data      => in_data(i),
                b_data      => bias(i),
                result_data => out_data(i)
            );
    end generate gen_adder_1023;


end Behavioral;
