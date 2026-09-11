library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_reg_n_m is
  generic (
    N : integer := 8;
    M : integer := 8
  );
  port (
    clk : in std_logic;
    rst : in std_logic;
    y_o : out matrix
  );
end shift_reg_n_m;

architecture rtl of shift_reg_n_m is
  type matrix is array[N][M];
  signal matriz_reg : matrix;
begin
  sync_p : process(clk, rst)
  begin
    if rst = '0' then
      shift <= (others => '0');
    elsif rising_edge(clk) then
      if ena = '1' then 
        if load = '1' then
          matriz_reg <= vector_i;
        else
          for i in N-1 dowto 1 loop
            matriz_reg[i] <= matriz_reg[i-1];
          end loop;
            matriz_reg[0] <= d_i;
        end if;
      end if;
    end if;
  end process sync_p;
  y_o <= matriz_reg;
end architecture rtl;