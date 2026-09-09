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
    variable v_sel : std_logic_vector(1 downto 0);
    begin
      v_sel := sel_1 & sel_0;
      case v_sel is
        when "00" =>
          y_o <= a_i;
        when "01" =>
          y_o <= b_i;
        when "10" =>          
          y_o <= c_i;
        whan others =>
          y_o <= d_i;
      end case;
    end process p_mux;
end gate;