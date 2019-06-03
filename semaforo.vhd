library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity semaforo is
  port (
	clk, btn: in std_logic;
	lights: out std_logic_vector(9 downto 0)
	);
end;

architecture arch of semaforo is

	signal cont1, cont2, codigo: integer := 0;
	signal clock, controle, reset: std_logic;

	component decoder port (
		codigo: in integer;
		traducao: out std_logic_vector(9 downto 0)
	);
	end component;

	component decoder_ff port (
		codigo: in integer;
		traducao: out std_logic
	);
	end component;

	component divisor_freq port (
		clk: in  std_logic;
    	clkout: out std_logic
	);
	end component;

	component flip_flop port (
		clock, rst, D: in std_logic;
		Q : out std_logic
	);
	end component;

begin

	clock_1sec: divisor_freq port map(
		clk => clk,
   		clkout => clock
	);

	dcd_ff: decoder_ff port map(
		codigo => cont2,
		traducao => reset
	);

	ff: flip_flop port map(
		clock => clk,
		rst   => reset,
		D     => btn,
		Q     => controle 
	);

	dcd: decoder port map(
		codigo => codigo,
		traducao => lights
	);

	process(clock)
		begin
		if rising_edge(clock) then
			cont1 <= cont1 + 1;
			codigo <= cont1;
			if (cont1 >= 100) then
				cont1 <= 0;
			end if;
			if ((cont1 = 10 or cont1 = 40 or cont1 = 70) and controle = '1') then
				cont2 <= cont2 + 1;
				codigo <= cont2;
				if (cont2 >= 10) then
					cont1 <= cont1 + 1;
				end if;
			end if;
		end if;
	end process;

end architecture;