library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mul_2b is
  port (
    a_i, b_i : in  std_logic_vector(1 downto 0);
    y_o      : out std_logic_vector(3 downto 0)
  );
end mul_2b;

architecture rtl of mul_2b is
    signal p01, p10, p11 : std_logic;
    signal carry : std_logic;
begin
  
  y_o(0) <= a_i(0) and b_i(0);

  p01 <= a_i(1) and b_i(0);
  p10 <= a_i(0) and b_i(1);
  p11 <= a_i(1) and b_i(1);

  adder : entity work.bit_adder
    port map (
      a_i   =>   p01, 
      b_i   =>   p10, 
      c_i   =>   '0',
      s_o   =>   y_o(1), 
      c_o   =>   carry
    );

    adder : entity work.bit_adder
    port map (
      a_i   =>   p11, 
      b_i   =>   carry, 
      c_i   =>   '0',
      s_o   =>   y_o(2), 
      c_o   =>   y_o(3)
    );

end architecture rtl;