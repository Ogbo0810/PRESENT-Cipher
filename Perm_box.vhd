----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:50:58 10/27/2021 
-- Design Name: 
-- Module Name:    Perm_box - Behavioral 
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

entity Perm_box is port (
x  : in  std_logic_vector(63 downto 0);
y : out std_logic_vector(63 downto 0)
);
end Perm_box;

architecture Behavioral of Perm_box is

begin

Y(63)<=X(63); Y(47)<=X(62); Y(31)<=X(61); Y(15)<=X(60);
	Y(62)<=X(59); Y(46)<=X(58); Y(30)<=X(57); Y(14)<=X(56);
	Y(61)<=X(55); Y(45)<=X(54); Y(29)<=X(53); Y(13)<=X(52);
	Y(60)<=X(51); Y(44)<=X(50); Y(28)<=X(49); Y(12)<=X(48);
	Y(59)<=X(47); Y(43)<=X(46); Y(27)<=X(45); Y(11)<=X(44);
	Y(58)<=X(43); Y(42)<=X(42); Y(26)<=X(41); Y(10)<=X(40);
	Y(57)<=X(39); Y(41)<=X(38); Y(25)<=X(37); Y( 9)<=X(36);
	Y(56)<=X(35); Y(40)<=X(34); Y(24)<=X(33); Y( 8)<=X(32);
	Y(55)<=X(31); Y(39)<=X(30); Y(23)<=X(29); Y( 7)<=X(28);
	Y(54)<=X(27); Y(38)<=X(26); Y(22)<=X(25); Y( 6)<=X(24);
	Y(53)<=X(23); Y(37)<=X(22); Y(21)<=X(21); Y( 5)<=X(20);
	Y(52)<=X(19); Y(36)<=X(18); Y(20)<=X(17); Y( 4)<=X(16);
	Y(51)<=X(15); Y(35)<=X(14); Y(19)<=X(13); Y( 3)<=X(12);
	Y(50)<=X(11); Y(34)<=X(10); Y(18)<=X( 9); Y( 2)<=X( 8);
	Y(49)<=X( 7); Y(33)<=X( 6); Y(17)<=X( 5); Y( 1)<=X( 4);
	Y(48)<=X( 3); Y(32)<=X( 2); Y(16)<=X( 1); Y( 0)<=X( 0);
end Behavioral;

