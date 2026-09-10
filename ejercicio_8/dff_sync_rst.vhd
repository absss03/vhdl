library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dff_sync_rst is
  port (
    d_i, clk, rst : in std_logic;
    q_o, nq_o     : out std_logic
  );
end dff_sync_rst;

architecture rtl of dff_sync_rst is
  signal q_reg : std_logic;
begin
  sync_p : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        q_reg <= '0';
      else
        q_reg <= d_i;
      end if;
    end if;
  end process sync_p;

  q_o <= q_reg;
  nq_o <= not(q_reg);
end architecture rtl;