library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity n_adder is
  generic (
    N : integer := 8
  );
  port (
    a_i   :   in  std_logic_vector(N-1 downto 0);
    b_i   :   in  std_logic_vector(N-1 downto 0);
    c_i   :   in  std_logic;
    s_o   :   out std_logic_vector(N-1 downto 0);
    c_o   :   out std_logic
  );
end n_adder;

architecture rtl of n_adder is
  signal sig_c : std_logic_vector(N-1 downto 0);
begin

  sig_c(0) <= '0';

  create_adders : for i in 0 to N-1 generate
    adder : entity work.bit_adder
    port map (
      a_i   =>   a_i(i), 
      b_i   =>   b_i(i), 
      c_i   =>   sig_c(i);
      s_o   =>   s_o(i), 
      c_o   =>   sig_c(i+1)
    );
  end generate create_adders;

  c_o <= sig_c(N);
end architecture rtl;