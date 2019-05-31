library iee;
use ieee.std_logic_1164.all;

entity finalDecoder is
  port (
	code: in integer;
	translation: out std_logic_vector(9 downto 0)
  ) ;
end entity;

architecture decoderArch of finalDecoder is
begin
	translation <= "0001111111" when (0 <= code and code < 10) else
								 "1000010001" when (10 <= code and code < 40) else
								 "0101001000" when (40 <= code and code < 70) else
								 "0011011000" when (70 <= code and code < 100);
end architecture ;
