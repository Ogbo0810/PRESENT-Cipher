----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:58:16 07/15/2021 
-- Design Name: 
-- Module Name:    up_counter_2bit - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity up_counter_5bit is port(
clk, reset        : in std_logic;
output            : out std_logic_vector(4 downto 0);
done              : out std_logic;
count_enable      : in std_logic
);
end up_counter_5bit;


architecture Behavioral of up_counter_5bit is
signal t : unsigned(4 downto 0);
begin
 
process(clk, reset)
 begin
 if (reset = '1') then
 t <= (others => '0');
 done <='0';
 elsif (rising_edge(clk)) then
  IF (count_enable = '0') then
 t <= t+1;
 if (t ="11110") then
 done <= '1';
 else
 done<= '0';
 end if;
 end if;
 end if;
 
 end process;
output <= std_logic_vector(t);
end Behavioral;

