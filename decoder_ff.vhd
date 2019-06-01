entity decoder_ff is
  port (
	codigo: in integer;
	traducao: out bit
  );
end;

architecture arch of decoder_ff is
begin
	with codigo select
		traducao <= 1 when 9
					0 when others;

end architecture ; -- arch