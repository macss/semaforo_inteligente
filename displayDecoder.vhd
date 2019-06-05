library ieee;
use ieee.std_logic_1164.all;

entity displayDecoder is
  port (
	numero: in integer;
	luzes: out std_logic_vector(7 downto 0)
  );
end entity ;

architecture arcg of displayDecoder is
begin
	with numero select
		luzes <= "00000011" when 0,
				 "10011111" when 1,
				 "00100101" when 2,
				 "00001101" when 3,
				 "10011001" when 4,
				 "01001001" when 5,
				 "01000001" when 6,
				 "00011111" when 7,
				 "00000001" when 8,
				 "00001001" when 9,
				 "11111101" when others;

end architecture ; -- arcg