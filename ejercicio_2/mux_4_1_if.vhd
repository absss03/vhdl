-- librerias
library ieee;
use ieee.std_logic_1164.all;

-- entidad (entradas y salidas)
entity mux_2_4 is
	port(
		a_i : in std_logic;
		b_i : in std_logic;
		c_i : in std_logic;
		d_i : in std_logic;
		sel_0 : in std_logic;
		sel_1 : in std_logic;
		y_o : out std_logic);
end mux_2_4;

-- arquitectura (comportamiento)
architecture gate of mux_2_4 is
	begin
    p_mux: process (sel_0, sel_1, a_i, b_i, c_i, d_i)
      begin
        if sel_0 = '0' and sel_1 = '0' then 
          y_o <= a_i;
        elsif sel_0 = '1' and sel_1 = '0' then
          y_o <= b_i;
        elsif sel_0 = '0' and sel_1 = '1' then          
          y_o <= c_i;
        else
          y_o <= d_i;
        end if;
      end process p_mux;
end gate;