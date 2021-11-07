----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:56 10/22/2021 
-- Design Name: 
-- Module Name:    left_shift_19 - Behavioral 
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

entity left_shift_19 is port(
data_in  : in  std_logic_vector(79 downto 0);
data_out : out std_logic_vector(79 downto 0)
);
end left_shift_19;

architecture Behavioral of left_shift_19 is

begin
data_out(79 downto 0) <= data_in(60 downto 0)&data_in(79 downto 61);

end Behavioral;

