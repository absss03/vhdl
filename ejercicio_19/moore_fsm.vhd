library ieee;
use ieee.std_logic_1164.all;

entity moore_fsm is
  port (
    clk, rst : in std_logic;
    x_i : in std_logic_vector(1 downto 0);
    y_o : out std_logic_vector(2 downto 0)
  );
end moore_fsm;

architecture rtl of moore_fsm is

  type state_type is (A, B, C, D, E);
  signal state_reg, state_next : state_type;

begin

  sync_p : process(clk, rst)
  begin
    if rst = '1' then
      state_reg <= A;
    elsif rising_edge(clk) then
      state_reg <= state_next;
    end if;
  end process sync_p;

  comb_p : process(state_reg, x_i)
  begin
    state_next <= state_reg;
    case state_reg is
      when A =>
        case x_i is
          when "01" => state_next <= A;
          when "11" => state_next <= B;
          when "00" => state_next <= E;
          when others => state_next <= A;
        end case;
      when B =>
        case x_i is
          when "00" => state_next <= B;
          when "10" => state_next <= A;
          when others => state_next <= B;
        end case;
      when C =>
        case x_i is
          when "00" => state_next <= C;
          when "10" => state_next <= D;
          when "11" => state_next <= A;
          when others => state_next <= C;
        end case;
      when D =>
        case x_i is
          when "01" => state_next <= D;
          when "11" => state_next <= B;
          when others => state_next <= D;
        end case;
      when E =>
        case x_i is
          when "10" => state_next <= B;
          when "11" => state_next <= C;
          when others => state_next <= E;
        end case;
    end case;
  end process comb_p;

  out_p : process(state_reg)
  begin
    case state_reg is
      when A => y_o <= "001";
      when B => y_o <= "011";
      when C => y_o <= "101";
      when D => y_o <= "100";
      when E => y_o <= "010";
    end case;
  end process out_p;

end architecture rtl;
