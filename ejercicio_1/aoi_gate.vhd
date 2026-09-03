-- librerias
library ieee;
use ieee.std_logic_1164.all;

-- entidad (entradas y salidas)
entity aoi_gate is
	port(
    a_i : in std_logic;
    b_i : in std_logic;
    c_i : in std_logic;
    d_i : in std_logic;
    y_o : out std_logic);
end aoi_gate;

-- arquitectura (comportamiento)
architecture gate of aoi_gate is
begin
  y_o <= (a_i and b_i) nor (c_i and d_i);
end gate;