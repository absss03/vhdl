library ieee;
use ieee.std_logic_1164.all;

entity seq_detector is
  port (
    clk, rst, x_i : in std_logic;
    y_o : out std_logic
  );
end seq_detector;

architecture rtl of seq_detector is
  type state_type is (S0, S1, S2, S3, S4, S5, S6, S7);
  signal state_reg, state_next : state_type;
begin

  sync_p : process(clk, rst)
  begin
    if rst = '1' then
      state_reg <= S0;
    elsif rising_edge(clk) then
      state_reg <= state_next;
    end if;
  end process sync_p;

  comb_p : process(state_reg, x_i)
  begin
    case state_reg is
      when S0 =>
        if x_i = '0' then
          state_next <= S1;
        else
          state_next <= S0;
        end if;
      when S1 =>
        if x_i = '0' then
          state_next <= S2;
        else
          state_next <= S0;
        end if;
      when S2 =>
        if x_i = '0' then
          state_next <= S2;
        else
          state_next <= S3;
        end if;
      when S3 =>
        if x_i = '0' then
          state_next <= S4;
        else
          state_next <= S0;
        end if;
      when S4 =>
        if x_i = '0' then
          state_next <= S2;
        else
          state_next <= S5;
        end if;
      when S5 =>
        if x_i = '0' then
          state_next <= S1;
        else
          state_next <= S6;
        end if;
      when S6 =>
        if x_i = '0' then
          state_next <= S7;
        else
          state_next <= S0;
        end if;
      when S7 =>
        if x_i = '0' then
          state_next <= S2;
        else
          state_next <= S0;
        end if;
    end case;
  end process comb_p;

  y_o <= '1' when state_reg = S7 else '0';

end architecture rtl;
