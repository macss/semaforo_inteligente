library ieee;
use ieee.std_logic_1164.all;

entity decoder_ff is
  port (
		code: in std_logic_vector(6 downto 0);
		translation: out std_logic
  );
end;

architecture decoder_ffArch of decoder_ff is
begin
	with code select
		translation <= '1' when "0001001",
									 '0' when others;
end decoder_ffArch;
