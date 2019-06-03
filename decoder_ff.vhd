library ieee;
use ieee.std_logic_1164.all;

entity decoder_ff is
  port (
	codigo: in integer;
	traducao: out std_logic
  );
end;

architecture arch of decoder_ff is
begin
	with codigo select
		traducao <= '1' when 9,
					'0'when others;

end architecture ; -- arch