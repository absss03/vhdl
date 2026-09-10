library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dff_async_rst is
  port (
    d_i, clk, rst : in std_logic;
    q_o, nq_o     : out std_logic
  );
end dff_async_rst;

architecture rtl of dff_async_rst is
  signal q_reg : std_logic;
begin
  async_p : process(clk, rst)
  begin
    if rst = '1' then
      q_o <= '0';
    elsif rising_edge(clk) then
      q_o <= d_i;
    end if;
  end process async_p;

  q_o <= q_reg;
  nq_o <= not(q_reg);
end architecture rtl;