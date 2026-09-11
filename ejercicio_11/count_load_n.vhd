library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_load is
  generic (
    N : integer := 8
  );
  port (
    clk, rst, load : in std_logic;
    d_i : in std_logic_vector(N-1 downto 0);
    y_o : out std_logic_vector(N-1 downto 0)
  );
end counter_load;

architecture rtl of counter_load is
  signal cte : std_logic_vector(N-1 downto 0);
begin
  sync_p : process(clk, rst)
  begin
    if rst = '1' then
      cte <= (others => '0');
    elsif rising_edge(clk) then
      if load = '1' then 
        cte <= d_i;
      else
        cte <= cte + '1';
      end if;
    end if;
  end process sync_p;
  y_o <= cte;
end architecture rtl;