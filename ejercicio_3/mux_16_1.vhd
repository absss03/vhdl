-- librerias
library ieee;
use ieee.std_logic_1164.all;

-- entidad (entradas y salidas)
entity mux_2_4 is
	port(
		a_i = in std_logic;
		b_i = in std_logic;
		c_i = in std_logic;
		d_i = in std_logic;
		a_i = in std_logic;
		b_i = in std_logic;
		c_i = in std_logic;
		d_i = in std_logic;
		a_i = in std_logic;
		b_i = in std_logic;
		c_i = in std_logic;
		d_i = in std_logic;
		sel_1 = in std_logic;
		sel_2 = in std_logic;
        sel_3 = in std_logic;
		sel_4 = in std_logic;
		y_o = out std_logic);
end mux_2_4;

-- arquitectura (comportamiento)
architecture gate of mux_2_4 is
	begin
		y_o <= a_i when sel_1 = '0' else b_i;
		y_o <= b_i when sel_2 = '0' else d_i;
end gate;