library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_n is
  generic (
    N : integer := 8
  );
  port (
    a_i, b_i : in  std_logic_vector(N-1 downto 0);
    y_o      : out std_logic_vector(N-1 downto 0);
    carry_o  : out std_logic
  );
end adder_n;

architecture rtl of adder_n is
  signal full_sum : unsigned(N downto 0);
begin
  full_sum <= ('0' & unsigned(a_i)) + ('0' & unsigned(b_i));
  y_o <= std_logic_vector(full_sum(N downto 0));
  carry_o <= full_sum(N)
end architecture rtl;