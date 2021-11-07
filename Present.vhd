----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:37:28 10/27/2021 
-- Design Name: 
-- Module Name:    Present - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Present_datapath is port(
clk, reset, sel, count_enable : in  std_logic;
plain_text_load, key_load : in  std_logic;
plain_text                : in  std_logic_vector(63 downto 0) ;
key                       : in  std_logic_vector(79 downto 0) ;
cipher_text               : out std_logic_vector(63 downto 0) ;
done                      : out std_logic


);
end Present_datapath;

architecture Behavioral of Present_datapath is


--MULTIPLEXER 1
component mux_1
port(
data_in_1, data_in_2 : in  std_logic_vector(63 downto 0);
sel                  : in  std_logic;
data_out             : out std_logic_vector(63 downto 0)
);
end component;

--MULTIPLEXER 2
component mux_2
port(
data_in_1, data_in_2 : in  std_logic_vector(79 downto 0);
sel                  : in  std_logic;
data_out             : out std_logic_vector(79 downto 0)
);
end component;


--S-BOX_16
component S_BOX_16
port (
data_in  : in  std_logic_vector(63 downto 0);
data_out : out std_logic_vector(63 downto 0)
);
end component;

--REGISTER_64
component reg_64
 port (
clk, load : in std_logic;
d         : in std_logic_vector(63 downto 0);
q         : out std_logic_vector(63 downto 0)
);
end component;

--REGISTER_80
component reg_80
 port (
clk, load : in std_logic;
d         : in std_logic_vector(79 downto 0);
q         : out std_logic_vector(79 downto 0)
);
end component;

--XOR 5bit
component XOR_5bit
port (
data_in_1   : in  std_logic_vector(4 downto 0);
data_in_2   : in  std_logic_vector(4 downto 0);
data_out    : out std_logic_vector(4 downto 0)
);
end component;

--XOR 64bit
component XOR_64bit
port (
data_in_1   : in  std_logic_vector(63 downto 0);
data_in_2   : in  std_logic_vector(63 downto 0);
data_out    : out std_logic_vector(63 downto 0)
);
end component;

--PERMUTATION BOX
component Perm_box
port (
x  : in  std_logic_vector(63 downto 0);
y  : out std_logic_vector(63 downto 0)
);
end component;

--S_BOX
component S_BOX
port(
data_in :  in  std_logic_vector(3 downto 0);
data_out : out std_logic_vector(3 downto 0)
);
end component;

--LEFT-SHIFT
component left_shift_19
port(
data_in  : in  std_logic_vector(79 downto 0);
data_out : out std_logic_vector(79 downto 0)
);
end component;


--UP COUNTER
component up_counter_5bit
port(
clk, reset, count_enable        : in std_logic;
output            : out std_logic_vector(4 downto 0);
done              : out std_logic
);
end component;

signal p_in               : std_logic_vector(63 downto 0);
signal p_out              : std_logic_vector(63 downto 0);
signal s_box_16_in        : std_logic_vector(63 downto 0) ;
signal plain_text_mux_out : std_logic_vector(63 downto 0);
signal plain_text_reg_out : std_logic_vector(63 downto 0);
signal key_reg_out        : std_logic_vector(79 downto 0);
signal key_mux_out        : std_logic_vector(79 downto 0);
signal key_shift_out      : std_logic_vector(79 downto 0);
signal key_mux_1          : std_logic_vector(79 downto 0);
signal count              : std_logic_vector(4 downto 0);
--signal key_s_box_in       : std_logic_vector(3 downto 0);
--signal key_in_betweener   : std_logic_vector(70 downto 0);
--signal key_xor_in         : std_logic_vector(4 downto 0);



begin

P_box : Perm_box port map(
x => p_in,
y => p_out
);

PLAINTEXT_S_BOX : S_BOX_16 port map(
data_in  => s_box_16_in,
data_out => p_in
);

PLAINTEXT_MULTIPLEXER : mux_1 port map (
data_in_1 => plain_text,
data_in_2 => p_out,
sel       => sel,
data_out  => plain_text_mux_out
);

PLAINTEXT_REGISTER : reg_64 port map (
clk  => clk,
load => plain_text_load,
d    => plain_text_mux_out,
q    => plain_text_reg_out
);


PLAINTEXT_XOR : XOR_64bit port map (
data_in_1 => plain_text_reg_out,
data_in_2 => key_reg_out(79 downto 16),
data_out  => s_box_16_in
);

KEY_REGISTER : reg_80 port map(
clk  => clk,
load => key_load,
d    => key_mux_out,
q    => key_reg_out
);

KEY_MULTIPLEXER : mux_2 port map(
data_in_1 => key,
data_in_2 => key_mux_1,
sel       => sel,
data_out  => key_mux_out
);

KEY_S_BOX : S_BOX port map (
data_in  => key_shift_out(79 downto 76),
data_out => key_mux_1(79 downto 76)
);

KEY_COUNTER : up_counter_5bit port map (
clk    => clk,
reset  => reset,
done   => done,
output => count,
count_enable => count_enable
);

KEY_XOR : XOR_5bit port map (
data_in_1 => key_shift_out(19 downto 15),
data_in_2 => count,
data_out  => key_mux_1(19 downto 15)
);

KEY_SHIFT : left_shift_19 port map (
data_in  => key_reg_out,
data_out => key_shift_out
);


key_mux_1(75 downto 20) <= key_shift_out(75 downto 20);

key_mux_1(14 downto 0)  <= key_shift_out(14 downto 0);

cipher_text <= s_box_16_in;

end Behavioral;

