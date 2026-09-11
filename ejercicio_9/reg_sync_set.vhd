library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_async_rst is
  generic (
    N : integer := 8
  );
  port (
    clk, set, ena : in std_logic;
    d_i  : in std_logic_vector(N-1 downto 0);
    q_o, nq_o     :  out std_logic_vector(N-1 downto 0)
  );
end reg_async_rst;

architecture rtl of reg_async_rst is
  signal q_reg : std_logic;
begin
  sync_p : process(clk)
  begin
    if rising_edge(clk) then
      if set = '1' then
        q_reg <= (others => '1');
      elsif ena = '1' then
        q_reg <= d_i;
      end if;
    end if;
  end process sync_p;

  q_o <= q_reg;
  nq_o <= not(q_reg);
end architecture rtl;