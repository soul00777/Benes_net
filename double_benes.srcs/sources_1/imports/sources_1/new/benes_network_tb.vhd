----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2021 23:56:40
-- Design Name: 
-- Module Name: benes_network_tb - Behavioral
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

entity benes_network_tb is
end benes_network_tb;

architecture Behavioral of benes_network_tb is
    constant    HALF_PERIOD    :    time    :=  5ns;
    signal  clk_p   :   std_logic;
    signal  clk_n   :   std_logic;
    signal  rst    :   std_logic;

    component compose
        port (
            clk         : in STD_LOGIC;
            benes_ren   : in STD_LOGIC;
            benes_raddr : in STD_LOGIC_VECTOR(8 DOWNTO 0);
            data_ren    : in STD_LOGIC;
            data_raddr  : in STD_LOGIC_VECTOR(8 DOWNTO 0)
        );
    end component compose;    
begin

    clk_gen : process
    begin
        clk_p <= '1';
        clk_n <= '0';
        wait for HALF_PERIOD;
        clk_p <= '0';
        clk_n <= '1';
        wait for HALF_PERIOD;
    end process;

    nrst_gen : process
    begin
        rst <= '1';
        wait for HALF_PERIOD*40;
        wait until clk_p'event and clk_p = '1';
        rst <= '0';
        wait;
    end process;

    compose_1 : compose
        port map (
            clk         => clk_p,
            benes_ren   => '1',
            benes_raddr => (others => '0'),
            data_ren    => '1',
            data_raddr  => (others => '0')
        );	   


end Behavioral;
