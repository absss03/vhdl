library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_reg_load_set is
  generic (
    N : integer := 8
  );
  port (
    clk , rst, load, ena, d_i: in std_logic;
    vector_i : in std_logic_vector(N-1 downto 0);
    y_o : out std_logic_vector(N-1 downto 0)
  );
end shift_reg_load_set;

architecture rtl of shift_reg_load_set is
  signal shift : std_logic_vector(N-1 downto 0);
begin
  label : process(clk, rst)
  begin
    if rst = '0' then
      shift <= (others => '0');
    elsif rising_edge(clk) then
      if ena = '1' then 
        if load = '1' then
          shift <= vector_i;
        else
          shift <= shift(N-2 downto 0) & d_i;
        end if;
      end if;
    end if;
  end process;
  y_o <= shift;
end architecture rtl;