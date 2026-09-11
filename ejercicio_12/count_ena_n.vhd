library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_load_ena is
  generic (
    N : integer := 8
  );
  port (
    clk, rst, ena : in std_logic;
    y_o : out std_logic_vector(N-1 downto 0)
  );
end counter_load_ena;

architecture rtl of counter_load_ena is
  signal cte : std_logic_vector(N-1 downto 0);
begin
  sync_p : process(clk, rst)
  begin
    if rst = '1' then
      cte <= (others => '0');
    elsif rising_edge(clk) then
      if ena = '1' then
        cte <= cte + '1';
      end if;
    end if;
  end process sync_p;
  y_o <= cte;
end architecture rtl;