library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
	port(
    a_i : in std_logic;
    b_i : in std_logic;
    y_o : out std_logic);
end or_gate;

architecture gate of or_gate is
begin
  y_o <= a_i or b_i;
end gate;