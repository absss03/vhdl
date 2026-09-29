library ieee;
use ieee.std_logic_1164.all;

entity seq_detector_shift is
  port (
    clk, rst, x_i : in std_logic;
    y_o : out std_logic
  );
end seq_detector_shift;

architecture rtl of seq_detector_shift is

  constant PATTERN : std_logic_vector(6 downto 0) := "0010110";
  signal shift_reg : std_logic_vector(6 downto 0);

begin

  sync_p : process(clk, rst)
  begin
    if rst = '1' then
      shift_reg <= (others => '0');
    elsif rising_edge(clk) then
      shift_reg <= shift_reg(5 downto 0) & x_i;
    end if;
  end process sync_p;

  y_o <= '1' when shift_reg = PATTERN else '0';

end architecture rtl;
