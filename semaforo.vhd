library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity semaforo is
  port (
	clk, btn: in std_logic;
	lights: out std_logic_vector(9 downto 0)
	);
end;

architecture arch of semaforo is
begin

end architecture;