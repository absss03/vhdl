library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mul_n_a2 is
  generic (
    N : integer := 4
  );
  port (
    a_i, b_i : in  std_logic_vector(N-1 downto 0);
    y_o      : out std_logic_vector(2*N-1 downto 0)
  );
end mul_n_a2;

architecture rtl of mul_n_a2 is
  -- Arreglo para almacenar cada fila extendida a 2*N bits
  type t_pp_array is array (0 to N-1) of std_logic_vector(2*N-1 downto 0);
  signal pp : t_pp_array;

  type sum_array is array (0 to N-1) of std_logic_vector(2*N-1 downto 0);
  signal sum_stage : sum_array;

  signal aux : std_logic;
begin

  -- Genera los productos parciales desplazados
  gen_pp : for i in 0 to N-1 generate
    gen_bits : for j in 0 to 2*N-1 generate
      gen_low : if j < i generate
        pp(i)(j) <= '0';
      end generate gen_low;
      -- Los bits dentro del rango de A se multiplican por B(i); el resto son ceros
      gen_inner : if (j >= i) and (j < i + N) generate
        pp(i)(j) <= a_i(j - i) and b_i(i);
      end generate gen_inner;

      gen_sign_ext : if j >= i + N generate
        pp(i)(j) <= a_i(N-1) and b_i(i);
      end generate gen_sign_ext;
    end generate gen_bits;
  end generate gen_pp;

  sum_stage(0) <= pp(0);

  create_adders : for i in 1 to N-1 generate 
    gen_mid_adders : if i < N-1 generate
      adder_inst : entity work.n_adder
        generic map (
          N => 2*N
        )
        port map (
          a_i => sum_stage(i-1),
          b_i => pp(i),
          c_i => '0',
          s_o => sum_stage(i),
          c_o => open
        );
    end generate gen_mid_adders;

    gen_last_sub : if i = N-1 generate
      sub_inst : entity work.n_adder
        generic map (
          N => 2*N
        )
        port map (
          a_i => sum_stage(i-1),
          b_i => not pp(i),
          c_i => '1',
          s_o => sum_stage(i),
          c_o => open
        );
    end generate gen_last_sub;   
  end generate create_adders;

  y_o <= sum_stage(N-1);
  
end architecture rtl;