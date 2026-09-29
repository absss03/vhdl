library ieee;
use ieee.std_logic_1164.all;

entity edge_detector is
  port (
    clk, rst, x_i : in std_logic;
    rising, falling : out std_logic
  );
end edge_detector;

architecture rtl of edge_detector is

  signal x_prev : std_logic;

begin

  sync_p : process(clk, rst)
  begin
    if rst = '1' then
      x_prev <= '0';
    elsif rising_edge(clk) then
      x_prev <= x_i;
    end if;
  end process sync_p;

  rising  <= x_i and not(x_prev);
  falling <= not(x_i) and x_prev;

end architecture rtl;
