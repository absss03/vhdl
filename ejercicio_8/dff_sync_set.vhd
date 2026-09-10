library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dff_sync_set is
  port (
    d_i, clk, set : in std_logic;
    q_o, nq_o     : out std_logic
  );
end dff_sync_set;

architecture rtl of dff_sync_set is
  signal q_reg : std_logic;
begin
  sync_p : process(clk)
  begin
    if rising_edge(clk) then
      if set = '1' then
        q_reg <= '1';
      else
        q_reg <= d_i;
      end if;
    end if;
  end process sync_p;

  q_o <= q_reg;
  nq_o <= not(q_reg);
end architecture rtl;