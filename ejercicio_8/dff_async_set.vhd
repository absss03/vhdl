library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dff_async_set is
  port (
    d_i, clk, set : in std_logic;
    q_o, nq_o     : out std_logic
  );
end dff_async_set;

architecture rtl of dff_async_set is
  signal q_reg : std_logic;
begin
  async_p : process(clk, set)
  begin
    if set = '1' then
      q_reg <= '1';
    elsif rising_edge(clk) then
      q_reg <= d_i;
    end if;
  end process async_p;

  q_o <= q_reg;
  nq_o <= not(q_reg);
end architecture rtl;