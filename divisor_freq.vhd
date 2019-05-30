library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_freq is

port (
	clk: in  std_logic;
    clkout: out std_logic
	);
end;

---- Divisor de frequência de 1 segundo

architecture rtl of divisor_freq is
	constant CLK_FREQ    : integer := 50000000;
	constant BLINK_FREQ  : integer := 1;
	constant CNT_MAX     : integer := CLK_FREQ/BLINK_FREQ/2-1;
	-- Sinais
	signal   cnt         : unsigned(24 downto 0);
	signal   switch      : std_logic;
	begin
		process(clk)
		begin
		if rising_edge(clk) then
			if cnt=CNT_MAX then
				cnt   <= (others => '0');
				switch <= not switch;
				else
				cnt  <= cnt + 1;
			end if;
		end if;
	end process;
	clkout <= switch;
end rtl;