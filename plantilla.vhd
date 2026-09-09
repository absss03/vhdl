-- librerias
library ieee;
use ieee.std_logic_1164.all;

-- entidad (entradas y salidas)
entity name_gate is
	port(
    a_i : in std_logic;
    b_i : in std_logic;
            .
            .
            .
    y_o : out std_logic);
end name_gate;

-- arquitectura (comportamiento)
architecture rtl of name_gate is
  -- opcional: pueden declararse señales intermedias tipo "signal"
begin
  -- opcional: pueden dedclararse variables

  -- opcional: puede declararse un process 
  process(a_i, b_i): -- lista de senitividad ()
  begin
      -- (esta parte del codigo se ejecuta secuencialmente)
      -- declaracion de la logica que depende de las señales que estan en la lista de sensibilidad
  end process;
  y_o <= ; -- asignacion de valor para la señal
end rtl ;