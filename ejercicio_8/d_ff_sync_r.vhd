library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ent is
  port (
    d_i, clk, set, rst : in std_logic;
    q_o, nq_o          : out std_logic
  );
end ent;

architecture rtl of ent is

begin
  sync_p: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        q_o <= '0';
      else
        q_o <= d_i;
      end if;
      nq_o <= not(q_o)
    end if;
  end process sync_p;
end architecture;