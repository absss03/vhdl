library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_reg_n_m is
  generic (
    N : integer := 8;
    M : integer := 8
  );
  port (
    clk      : in std_logic;
    rst      : in std_logic;
    ena      : in std_logic;
    load     : in  std_logic;
    d_i      : in  std_logic_vector(M-1 downto 0);
    vector_i : in  std_logic_vector((N*M)-1 downto 0);
    y_o      : out std_logic_vector((N*M)-1 downto 0)
  );
end shift_reg_n_m;

architecture rtl of shift_reg_n_m is
  type matrix is array (0 to N-1) of std_logic_vector(M-1 downto 0);
  signal matriz_reg : matrix;
begin
  sync_p : process(clk, rst)
  begin
    if rst = '0' then
      matriz_reg <= (others => (others => '0'));
    elsif rising_edge(clk) then
      if ena = '1' then 
        if load = '1' then
          for i in 0 to N-1 loop
            matriz_reg(i) <= vector_i(((i+1)*M)-1 downto i*M);
          end loop;
        else
          for i in N-1 downto 1 loop
            matriz_reg(i) <= matriz_reg(i-1);
          end loop;
            matriz_reg(0) <= d_i;
        end if;
      end if;
    end if;
  end process sync_p;
  
  gen_out : for i in 0 to N-1 generate
    y_o(((i+1)*M)-1 downto i*M) <= matriz_reg(i);
  end generate gen_out;
end architecture rtl;