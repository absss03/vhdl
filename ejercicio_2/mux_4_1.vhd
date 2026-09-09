-- librerias
library ieee;
use ieee.std_logic_1164.all;

-- entidad (entradas y salidas)
entity mux_2_4 is
	port(
		a_i, b_i, c_i, d_i  :  in std_logic;
		sel_0, sel_1        :  in std_logic;
		y_o                 :  out std_logic);
end mux_2_4;

-- arquitectura (comportamiento)
architecture gate of mux_2_4 is
	begin
    y_o <= 	a_i when (sel_1 = '0' and sel_0 = '0') else
            b_i when (sel_1 = '0' and sel_0 = '1') else
            c_i when (sel_1 = '1' and sel_0 = '0') else
            d_i;
end gate;