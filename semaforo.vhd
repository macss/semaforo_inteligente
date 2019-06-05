library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity semaforo is
  port (
	clk, btn: in std_logic;
	lights: out std_logic_vector(9 downto 0);
	display1, display2, display3, display4: out std_logic_vector(7 downto 0)
	);
end;

architecture arch of semaforo is

	signal cont1, cont2, codigo: integer := 0;
	signal controle: std_logic := '0';
	signal clock, reset: std_logic;

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

	component displayDecoder port(
		numero: in integer;
		luzes: out std_logic_vector(7 downto 0)
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

	displayA: displayDecoder port map(
		numero => cont1 / 10,
		luzes => display1
	);

	displayB: displayDecoder port map(
		numero => cont1 mod 10,
		luzes => display2
	);

	displayC: displayDecoder port map(
		numero => cont2 / 10,
		luzes => display3
	);

	displayD: displayDecoder port map(
		numero => cont2 mod 10,
		luzes => display4
	);

	process(clock)
		begin
		if rising_edge(clock) then
			if ((cont1 = 10 or cont1 = 40 or cont1 = 70) and controle = '1') then
				if (cont2 >= 10) then
					cont1 <= cont1 + 1;
					cont2 <= 0;
				end if;
				cont2 <= cont2 + 1;
				codigo <= cont2;
			else
				cont1 <= cont1 + 1;
				codigo <= cont1;
				if (cont1 >= 99) then
					cont1 <= 0;
				end if;
			end if;
		end if;
	end process;

end architecture;