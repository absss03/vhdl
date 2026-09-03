library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
	port(
    a_i : in std_logic;
    b_i : in std_logic;
    y_o : out std_logic);
end and_gate;

architecture gate of and_gate is
begin
  y_o <= a_i and b_i;
end gate;