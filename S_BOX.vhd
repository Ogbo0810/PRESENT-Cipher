----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:28:25 10/22/2021 
-- Design Name: 
-- Module Name:    S_BOX - Behavioral 
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

entity S_BOX is port(
data_in :  in  std_logic_vector(3 downto 0);
data_out : out std_logic_vector(3 downto 0)
);
end S_BOX;

architecture Behavioral of S_BOX is

begin
with data_in select
      
		data_out <= "1100" when "0000",
		            "0101" when "0001",
						"0110" when "0010",
						"1011" when "0011",
						"1001" when "0100",
						"0000" when "0101",
						"1010" when "0110",
						"1101" when "0111",
						"0011" when "1000",
						"1110" when "1001",
						"1111" when "1010",
						"1000" when "1011",
						"0100" when "1100",
						"0111" when "1101",
						"0001" when "1110",
						"0010" when others; --when 1111
						

end Behavioral;

