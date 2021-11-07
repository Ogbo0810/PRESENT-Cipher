----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:12 10/22/2021 
-- Design Name: 
-- Module Name:    reg_80 - Behavioral 
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

entity reg_64 is port (
clk, load : in std_logic;
d         : in std_logic_vector(63 downto 0);
q         : out std_logic_vector(63 downto 0)
);
end reg_64;

architecture Behavioral of reg_64 is

begin
reg_64_process : process(clk)
                  begin
                    if (rising_edge(clk))	then
							  q <= d;
						  end if;
                 end process;

end Behavioral;

