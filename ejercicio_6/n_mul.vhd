library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mul_n is
  generic (
    N : integer := 4
  );
  port (
    a_i, b_i : in  std_logic_vector(N-1 downto 0);
    y_o      : out std_logic_vector(2*N-1 downto 0)
  );
end mul_n;

architecture rtl of mul_n is
  -- Arreglo para almacenar cada fila extendida a 2*N bits
  type t_pp_array is array (0 to N-1) of std_logic_vector(2*N-1 downto 0);
  signal pp : t_pp_array;

  type sum_array is array (0 to N-1) of std_logic_vector(2*N-1 downto 0);
  signal sum_stage : sum_array;
begin

  -- Genera los productos parciales desplazados
  gen_pp : for i in 0 to N-1 generate
    gen_bits : for j in 0 to 2*N-1 generate
      -- Los bits dentro del rango de A se multiplican por B(i); el resto son ceros
      gen_inner : if (j >= i) and (j < i + N) generate
        pp(i)(j) <= a_i(j - i) and b_i(i);
      end generate gen_inner;

      gen_zeros : if (j < i) or (j >= i + N) generate
        pp(i)(j) <= '0';
      end generate gen_zeros;
    end generate gen_bits;
  end generate gen_pp;

  sum_stage(0) <= pp(0);

  create_adders : for i in 1 to N-1 generate 
    adder : entity work.n_adder
    generic map (
      N => 2*N
    )
    port map (
      a_i   =>   sum_stage(i-1), 
      b_i   =>   , 
      c_i   =>   '0',
      s_o   =>   sum_stage(i), 
      c_o   =>   
    );
  end generate create_adders;

  y_o <= ;
end architecture rtl;