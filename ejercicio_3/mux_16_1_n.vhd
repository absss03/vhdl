library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity mux_16_1_n is
  generic (
    N : integer := 8
  );
  port (
      d0_i,  d1_i,  d2_i,  d3_i  :  in  std_logic_vector(N-1 downto 0);
      d4_i,  d5_i,  d6_i,  d7_i  :  in  std_logic_vector(N-1 downto 0);
      d8_i,  d9_i,  d10_i, d11_i :  in  std_logic_vector(N-1 downto 0);
      d12_i, d13_i, d14_i, d15_i :  in  std_logic_vector(N-1 downto 0);
      sel_0, sel_1, sel_2, sel_3 :  in  std_logic;
      y_o                        :  out std_logic_vector(N-1 downto 0)
  );
end mux_16_1_n ; 

architecture rtl of mux_16_1_n is

  signal mux0_out : std_logic_vector(N-1 downto 0);
  signal mux1_out : std_logic_vector(N-1 downto 0);
  signal mux2_out : std_logic_vector(N-1 downto 0);
  signal mux3_out : std_logic_vector(N-1 downto 0);

  begin
    mux_0: entity work.mux4to1_n
      generic map ( N => N )
      port map (
        a_i => d0_i, 
        b_i => d1_i, 
        c_i => d2_i, 
        d_i => d3_i,
        sel_0 => sel_0, 
        sel_1 => sel_1,
        y_o => mux0_out
      );

    mux_1: entity work.mux4to1_n
      generic map ( N => N )
      port map (
        a_i => d4_i, 
        b_i => d5_i, 
        c_i => d6_i, 
        d_i => d7_i,
        sel_0 => sel_0,
        sel_1 => sel_1,
        y_o => mux1_out
      );

    mux_2: entity work.mux4to1_n
      generic map ( N => N )
      port map (
        a_i => d8_i, 
        b_i => d9_i, 
        c_i => d10_i, 
        d_i => d11_i,
        sel_0 => sel_0,
        sel_1 => sel_1,
        y_o => mux2_out
      );

    mux_3: entity work.mux4to1_n
      generic map ( N => N )
      port map (
        a_i => d12_i, 
        b_i => d13_i, 
        c_i => d14_i, 
        d_i => d15_i,
        sel_0 => sel_0,
        sel_1 => sel_1,
        y_o => mux3_out
      );

    mux_4: entity work.mux4to1_n
      generic map ( N => N )
      port map (
        a_i => mux0_out,
        b_i => mux1_out,
        c_i => mux2_out,
        d_i => mux3_out,
        sel_0 => sel_2,
        sel_1 => sel_3,
        y_o => y_o
      );
end architecture rtl;