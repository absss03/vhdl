-- librerias
library ieee;
use ieee.std_logic_1164.all;

-- entidad (entradas y salidas)
entity oai_gate is
	port(
    a_i : in std_logic;
    b_i : in std_logic;
    c_i : in std_logic;
    d_i : in std_logic;
    y_o : out std_logic);
end oai_gate;

-- arquitectura (comportamiento)
architecture gate of oai_gate is
begin
  y_o <= (a_i or b_i) nand (c_i or d_i);
end gate;