library iee;
use ieee.std_logic_1164.all;

entity decoder is
  port (
	codigo: in integer;
	traducao: out std_logic_vector(9 downto 0)
  ) ;
end entity ;

architecture arch of decoder is
begin
	traducao <= "0001111111" when (0 <= codigo and codigo < 10) else
				"1000010001" when (10 <= codigo and codigo < 40) else
				"0101001000" when (40 <= codigo and codigo < 70) else
				"0011011000" when (70 <= codigo and codigo < 100);
end architecture ; -- arch