library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_async_set is
  generic (
    N : integer := 8;
  );
  port (
    clk, set, ena : in std_logic;
    d_i  : in std_logic_vector(N-1 downto 0);
    q_o, nq_o     :  in std_logic_vector(N-1 downto 0)
  );
end reg_async_set;

architecture rtl of reg_async_set is
  signal q_reg : std_logic;
begin
  async_p : process(clk, set)
  begin
    if set = '1' then
      q_reg <= (others => '1');
    elsif rising_edge(clk) then
      if ena = '1' then
        q_o <= d_i;
      end if;
    end if;
  end process async_p;

  q_o <= q_reg;
  nq_o <= not(q_reg);
end architecture rtl;