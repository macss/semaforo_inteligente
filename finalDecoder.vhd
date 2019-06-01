library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity finalDecoder is
  port (
		code: in std_logic_vector(6 downto 0);
		translation: out std_logic_vector(9 downto 0)
  );
end finalDecoder;

architecture decoderArch of finalDecoder is

	signal selection: integer;

begin
	selection <= to_integer(unsigned(code));

	translation <= "0001111111" when (0 <= selection and selection < 10) else
				   "1000010001" when (10 <= selection and selection < 40) else
				   "0101001000" when (40 <= selection and selection < 70) else
				   "0011011000" when (70 <= selection);
end decoderArch;
