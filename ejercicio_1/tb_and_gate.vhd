library ieee;
use ieee.std_logic_1164.all;

-- 1. Entidad vacía (No tiene entradas ni salidas externas)
entity tb_generico is
end entity tb_generico;

architecture sim of tb_generico is

    -- 2. Declaración de Señales Locales
    signal a_i : std_logic := '0';
    signal b_i  : std_logic := '0';
    signal y_o : std_logic;

begin

    -- 3. Instanciación directa del modulo a probar
    u_dut : entity work.and_gate
        port map (
            a_i => a_i,
            b_i  => b_i,
            y_o => y_o
        );

    -- 5. Proceso de Estímulos
    stim_process : process
    begin

        -- Caso 1
        a_i <= '0';
        b_i  <= '0';
        wait for 20 ns;
        
        -- Caso 2
        a_i <= '1';
        b_i  <= '0';
        wait for 100 ns;

        -- Caso 3
        a_i <= '0';
        b_i  <= '1';
        wait for 100 ns;

        -- Caso 4
        a_i <= '1';
        b_i  <= '1';
        wait for 100 ns;
        
        -- Detención de la simulación
        assert false report "Prueba finalizada exitosamente" severity failure;
        wait; 
    end process;

end architecture sim;