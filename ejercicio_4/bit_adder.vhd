library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bit_adder is
  port (
    a_i, b_i, c_i : in  std_logic;
    s_o, c_o      : out std_logic
  );
end bit_adder;

architecture rtl of bit_adder is
  signal sig_1, sig_2, sig_3 : std_logic; 
begin

  sig_1 <= a_i xor b_i;
  sig_2 <= c_i and sig_1;
  sig_3 <= a_i and b_i;

  s_o   <= c_i xor sig_1;
  c_o   <= sig_1 or sig_3;
end architecture rtl;