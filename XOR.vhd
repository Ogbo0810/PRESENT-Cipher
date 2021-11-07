----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:56:11 10/22/2021 
-- Design Name: 
-- Module Name:    XOR - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity XOR_5bit is port (
data_in_1   : in  std_logic_vector(4 downto 0);
data_in_2   : in  std_logic_vector(4 downto 0);
data_out    : out std_logic_vector(4 downto 0)
);
end XOR_5bit;

architecture Behavioral of XOR_5bit is

begin

data_out <= data_in_1 xor data_in_2;

end Behavioral;

