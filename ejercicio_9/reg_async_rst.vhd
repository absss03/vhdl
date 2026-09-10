library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_async_rst is
  generic (
    N : integer := 8;
  );
  port (
    clk, rst, ena : in std_logic;
    d_i  : in std_logic_vector(N-1 downto 0);
    q_o, nq_o     :  in std_logic_vector(N-1 downto 0)
  );
end reg_async_rst;

architecture rtl of reg_async_rst is
  signal q_reg : std_logic;
begin
  async_p : process(clk, rst)
  begin
    if rst = '1' then
      q_o <= (others => '0');
    elsif rising_edge(clk) then
      if ena = '1' then
        q_o <= d_i;
      end if;
    end if;
  end process async_p;

  q_o <= q_reg;
  nq_o <= not(q_reg);
end architecture rtl;