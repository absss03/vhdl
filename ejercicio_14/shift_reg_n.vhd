library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_reg is
  generic (
    N : integer := 8
  );
  port (
    clk , rst, d_i: in std_logic;
    y_o : out std_logic_vector(N-1 downto 0)
  );
end shift_reg;

architecture rtl of shift_reg is
  signal shift : std_logic_vector(N-1 downto 0);
begin
  label : process(clk, rst)
  begin
    if rst = '0' then
      shift <= (others => '0');
    elsif rising_edge(clk) then
      shift <= shift(N-2 downto 0) & d_i;
    end if;
  end process;
  y_o <= shift;
end architecture rtl;