library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity half_adder_n is
  generic (
    N : integer := 8
  );
  port (
    a_i, b_i : in  std_logic_vector(N-1 downto 0);
    y_o      : out std_logic_vector(N-1 downto 0)
  );
end half_adder_n;

architecture rtl of half_adder_n is
begin
  y_o <= std_logic_vector(unsigned(a_i) + unsigned(b_i));
end architecture rtl;