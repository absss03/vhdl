library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_4_1 is
  generic (
    N : integer := 8
  );
  port (
    a_i, b_i, c_i, d_i : in  std_logic_vector(N-1 downto 0);
    sel_0, sel_1       : in  std_logic;
    y_o                  : out std_logic_vector(N-1 downto 0)
  );
end mux_4_1 ; 

architecture rtl of mux_4_1 is
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
      when others =>
        y_o <= d_i;
    end case;
  end process p_mux;
end architecture rtl;