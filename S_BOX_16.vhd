----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:58:40 10/27/2021 
-- Design Name: 
-- Module Name:    S_BOX_16 - Behavioral 
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

entity S_BOX_16 is port (
data_in  : in  std_logic_vector(63 downto 0);
data_out : out std_logic_vector(63 downto 0)
);
end S_BOX_16;


architecture Behavioral of S_BOX_16 is
component S_BOX 
port(
data_in :  in  std_logic_vector(3 downto 0);
data_out : out std_logic_vector(3 downto 0)
);
end component;

begin

S1 : S_BOX port map (
data_in  => data_in  (63 downto 60),
data_out => data_out (63 downto 60)
);

S2 : S_BOX port map (
data_in  => data_in  (59 downto 56),
data_out => data_out (59 downto 56)
);

S3 : S_BOX port map (
data_in  => data_in  (55 downto 52),
data_out => data_out (55 downto 52)
);

S4 : S_BOX port map (
data_in  => data_in  (51 downto 48),
data_out => data_out (51 downto 48)
);

S5 : S_BOX port map (
data_in  => data_in  (47 downto 44),
data_out => data_out (47 downto 44)
);


S6 : S_BOX port map (
data_in  => data_in  (43 downto 40),
data_out => data_out (43 downto 40)
);

S7 : S_BOX port map (
data_in  => data_in  (39 downto 36),
data_out => data_out (39 downto 36)
);

S8 : S_BOX port map (
data_in  => data_in  (35 downto 32),
data_out => data_out (35 downto 32)
);

S9 : S_BOX port map (
data_in  => data_in  (31 downto 28),
data_out => data_out (31 downto 28)
);

S10 : S_BOX port map (
data_in  => data_in  (27 downto 24),
data_out => data_out (27 downto 24)
);

S11 : S_BOX port map (
data_in  => data_in  (23 downto 20),
data_out => data_out (23 downto 20)
);

S12 : S_BOX port map (
data_in  => data_in  (19 downto 16),
data_out => data_out (19 downto 16)
);

S13 : S_BOX port map (
data_in  => data_in  (15 downto 12),
data_out => data_out (15 downto 12)
);

S14 : S_BOX port map (
data_in  => data_in  (11 downto 8),
data_out => data_out (11 downto 8)
);

S15 : S_BOX port map (
data_in  => data_in  (7 downto 4),
data_out => data_out (7 downto 4)
);

S16 : S_BOX port map (
data_in  => data_in  (3 downto 0),
data_out => data_out (3 downto 0)
);
end Behavioral;

