library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity freq_divider is
	generic (
		CLK_FREQUENCE	: integer := 10; --50000000; --Frequência da placa
		CLK_TIME		: integer := 1 --Tempo, em segundos, entre cada ciclo de clock
	);
	port (
		clk: in boolean;
		clkout: out std_logic
	);
end;

architecture rtl of freq_divider is
	constant CLK_REFERENCE  : integer := CLK_FREQUENCE/2;
	constant CNT_MAX     	: integer := CLK_REFERENCE*CLK_TIME;
	-- Sinais
	signal cnt      : unsigned(25 downto 0);
	signal switch	: std_logic := '0';

	begin
		process(clk)
		begin
			if rising_edge(clk) then
				if cnt = CNT_MAX then
					cnt <= (others => '0');
					switch <= not switch;
				else
					cnt <= cnt + 1;
				end if;
			end if;
	end process;
	clkout <= switch;
end rtl;
