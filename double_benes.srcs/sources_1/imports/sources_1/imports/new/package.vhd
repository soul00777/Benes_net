  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package ARRAYLIST is
type float_1024 is array (0 to 1023) of std_logic_vector(15 downto 0);
type float_512 is array (0 to 511) of std_logic_vector(15 downto 0);
type float_256 is array (0 to 255) of std_logic_vector(15 downto 0);
type float_128 is array (0 to 127) of std_logic_vector(15 downto 0);
type float_64 is array (0 to 63) of std_logic_vector(15 downto 0);
type float_32 is array (0 to 31) of std_logic_vector(15 downto 0);
type float_16 is array (0 to 15) of std_logic_vector(15 downto 0);
type float_8 is array (0 to 7) of std_logic_vector(15 downto 0);
type float_4 is array (0 to 3) of std_logic_vector(15 downto 0);
type float_2 is array (0 to 1) of std_logic_vector(15 downto 0);
type data_19x512 is array (0 to 18) of std_logic_vector(511 downto 0);

end ARRAYLIST;