library ieee;
use ieee.std_logic_1164.all;

-- 1. Entidad vacía (No tiene entradas ni salidas externas)
entity tb_generico is
end entity tb_generico;

architecture sim of tb_generico is

    -- 2. Declaración de Señales Locales
    constant CLK_PERIOD : time := 10 ns;
    signal clk   : std_logic := '0';
    signal rst_n : std_logic := '0';
    signal d_in  : std_logic := '0';
    signal q_out : std_logic;

begin

    -- 3. Instanciación directa del DUT[cite: 10]
    u_dut : entity work.mi_modulo
        port map (
            clk   => clk,
            rst_n => rst_n,
            d_in  => d_in,
            q_out => q_out
        );

    -- 4. Generación de Reloj
    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- 5. Proceso de Estímulos
    stim_process : process
    begin
        -- Inicialización y pulso de Reset
        rst_n <= '0';
        d_in  <= '0';
        wait for 20 ns;
        rst_n <= '1';

        -- Inyección sincronizada con el reloj
        wait until rising_edge(clk);
        d_in <= '1';
        
        wait until rising_edge(clk);
        d_in <= '0';

        wait for 100 ns;
        
        -- Detención de la simulación mediante un assertion failure intencional o un wait infinito
        assert false report "Prueba finalizada exitosamente" severity failure;
        wait; 
    end process;

end architecture sim;