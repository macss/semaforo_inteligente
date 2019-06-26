library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity flip_flop is
	port(clock, D, rst: in std_logic;
		 Q : out std_logic);
end;

architecture FFpD of flip_flop is
begin
	process(clock,rst)
	begin
		if (rst = '1') then
			Q <= '1';
		elsif (rising_edge(clock) and D = '0') then
			Q <= D;
		end if;
	end process;
end FFpD;