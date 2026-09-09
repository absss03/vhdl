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
  async_p : process(clk, set)
  begin
    if set = '1' then
      q_o <= '1';
    elsif rising_edge(clk) then
      q_o <= d_i;
    end if;
    nq_o <= not(q_o);
  end process async_p;
end architecture;