library ieee;
use ieee.std_logic_1164.all;

entity seq_detector_oh is
  port (
    clk, rst, x_i : in std_logic;
    y_o : out std_logic
  );
end seq_detector_oh;

architecture rtl of seq_detector_oh is

  constant S0 : std_logic_vector(7 downto 0) := "00000001";
  constant S1 : std_logic_vector(7 downto 0) := "00000010";
  constant S2 : std_logic_vector(7 downto 0) := "00000100";
  constant S3 : std_logic_vector(7 downto 0) := "00001000";
  constant S4 : std_logic_vector(7 downto 0) := "00010000";
  constant S5 : std_logic_vector(7 downto 0) := "00100000";
  constant S6 : std_logic_vector(7 downto 0) := "01000000";
  constant S7 : std_logic_vector(7 downto 0) := "10000000";

  signal state_reg, state_next : std_logic_vector(7 downto 0);

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
    state_next <= (others => '0');
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
      when others =>
        state_next <= S0;
    end case;
  end process comb_p;

  y_o <= '1' when state_reg = S7 else '0';

end architecture rtl;
