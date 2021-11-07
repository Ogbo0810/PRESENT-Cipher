----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:55:52 10/13/2021 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
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

entity control_unit is port(
--in_x,in_y      : in std_logic_vector(3 downto 0);
--out_x, out_y   : out std_logic_vector(3 downto 0);
x_load, y_load : out std_logic; --
tri_sel        : out std_logic; --
clk, reset     : in std_logic;  --
gt_sig         : in std_logic   --
);

end control_unit;

architecture Behavioral of control_unit is

type state is (S0,S1,S2);
signal PS, NS : state;

begin

state_reg : process(clk, reset)
             begin
				  if(reset = '1')then
				    PS <= S0;
				  elsif (rising_edge(clk))then
				    PS <= NS;
				  end if;
				 end process;
				 

next_state_logic : process(PS, gt_sig)
                begin
					  case PS is
						  
						  
						when S0 =>
						 
						 if (gt_sig = '1') then
							   NS <= S1;
						else
								NS <= S2;
						  end if;
						  
						when S1 => 
                   NS <= S1;
                 						
						when S2 => 
						 NS <= S2;
						end case;						
					end process;
					

output_logic: process(PS)
               begin
					 case PS is
					  
					  when S0 =>
					  x_load <= '1';
					  y_load <= '1';
					  tri_sel <= '0'; 
					  
					  when S1 =>
					  x_load <= '0';
					  y_load <= '0';
					  tri_sel <= '1'; 

					  when S2 =>
					  x_load <= '0';
					  y_load <= '0';
					  tri_sel <= '1'; 
					  
					 end case;
					 end process;

end Behavioral;

