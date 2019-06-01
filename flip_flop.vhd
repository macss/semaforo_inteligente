library ieee;
use ieee.std_logic_1164.all;

entity flip_flop is
	port(
		clk, reset, D: in std_logic;
		Q: out std_logic
	);
end;

architecture FFpD of flip_flop is
begin
	process(clk,reset)
	begin
		if (reset='1') then
			Q <= '0';
		elsif (rising_edge(clk)) then
			Q <= D;
		end if;
	end process;
end FFpD;
