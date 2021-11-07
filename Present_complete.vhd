----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:26:00 10/28/2021 
-- Design Name: 
-- Module Name:    Present_complete - Behavioral 
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

entity Present_complete is port(

clk,reset                 : in std_logic;
plain_text                : in  std_logic_vector(63 downto 0) ;
key                       : in  std_logic_vector(79 downto 0) ;
cipher_text               : out std_logic_vector(63 downto 0) 
);
end Present_complete;

architecture Behavioral of Present_complete is

component Present_control_unit
port (
done : in std_logic;
clk,reset : in std_logic;
Sel, plain_text_load, key_load, count_enable : out std_logic
);
end component;

component Present_datapath
port(
clk, reset, sel, count_enable : in  std_logic;
plain_text_load, key_load     : in  std_logic;
plain_text                    : in  std_logic_vector(63 downto 0) ;
key                           : in  std_logic_vector(79 downto 0) ;
cipher_text                   : out std_logic_vector(63 downto 0) ;
done                          : out std_logic
);
end component;


signal Sel, plain_text_load, key_load, count_enable,  done   : std_logic;



begin


--datapath
DATAPATH : Present_datapath 
port map
 (
clk    => clk,
reset  => reset,
sel => sel,
count_enable => count_enable,
plain_text_load => plain_text_load,
key_load => key_load,
plain_text => plain_text,
key => key,
cipher_text => cipher_text,
done => done
);


--control unit
CONTROL_UNIT : Present_control_unit 
port map 
(
done            => done,
clk             => clk,
reset           => reset,
sel             => sel,
plain_text_load => plain_text_load,
key_load        => key_load,
count_enable    => count_enable
);






end Behavioral;


--
--




