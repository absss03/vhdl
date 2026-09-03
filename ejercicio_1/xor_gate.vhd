-- librerias
library ieee;
use ieee.std_logic_1164.all;

-- entidad (entradas y salidas)
entity xor_gate is
	port(
    a_i : in std_logic;
    b_i : in std_logic;
    y_o : out std_logic);
end xor_gate;

-- arquitectura (comportamiento)
architecture gate of xor_gate is
begin
  y_o <= a_i xor b_i;
end gate;