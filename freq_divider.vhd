library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity freq_divider is
    generic (
		REFERENCE_CLOCK: integer := 50000000; --Frequência da placa utilizada
		CLK_TIME: integer := 1 --Período do clock de saída
    );
    port (
        clk     : in std_logic;
        clkOut  : out std_logic
    );
end freq_divider;

architecture freq_dividerArch of freq_divider is

	constant MAX_COUNT: integer := (REFERENCE_CLOCK/2)*CLK_TIME;
	signal cnt: integer := 0;
	signal clkTemp: std_logic := '0';

begin
    process(clk)
    begin
        if rising_edge(clk) then
			if cnt = MAX_COUNT then
				clkTemp <= not clkTemp;
				cnt <= 0;
            else
                cnt <= cnt + 1;
            end if;
            clkOut <= clkTemp;
        end if;
    end process;
end freq_dividerArch;
