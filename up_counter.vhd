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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity up_counter_2bit is port(
clk, reset, count : in std_logic;
output            : out std_logic_vector(1 downto 0)
);
end up_counter_2bit;

architecture Behavioral of up_counter_2bit is
--Declaring "state" as a data type and indicationg that ST0, ST1, ST2 and ST3 are of type "state"
-- Also PS,NS 
type state is (ST0, ST1, ST2, ST3);
signal PS,NS : state;

begin
 state_reg : process(clk, reset)
               begin
					if (reset = '1') then
					PS <= ST0;
					elsif (rising_edge(clk)) then
					PS <= NS;
					end if;
					end process;
					
					
next_state_logic : process(PS, count)
               begin
					case PS is 
					
					when ST0 => 
					if (count = '1') then
					NS <= ST1;
					else
					NS <= ST0;
					end if;
					
					when ST1=> 
					if (count = '1') then
					NS <= ST2;
					else
					NS <= ST1;
					end if;
					
					when ST2 => 
					if (count = '1') then
					NS <= ST3;
					else
					NS <= ST2;
					end if;
					
					when ST3 => 
					if (count = '1') then
					NS <= ST0;
					else
					NS <= ST3;
					end if;
					
					end case;
					end process;
 
					
output_logic : process(PS)
               begin
					case (PS) is
					
					when ST0 => 
					output <= "00";
					
               when ST1 => 
					output <= "01";
					
					when ST2 => 
					output <= "10";
					
					when ST3 => 
					output <= "11";
					
					end case;
					end process;

end Behavioral;

