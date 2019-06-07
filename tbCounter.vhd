library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tbCounter is
end tbCounter;

architecture tbCounterArch of tbCounter is
    -- Sinal auxiliar na simulação para indicar momento de mudança dos valores da entrada
    signal iteration: std_logic_vector (7 downto 0) := x"00";

    -- Declaração dos sinais
    -- Entradas
    signal clock: std_logic := '0';

    -- Saídas
    signal count: std_logic_vector(6 downto 0);

    -- Declaração das componentes
    component counter is
        generic (
            MAX_COUNT: integer := 1
        );
        port (
            clk     : in std_logic;
            count   : out std_logic_vector(6 downto 0)
        );
    end component;

begin

    -- Inclusão da componente a ser testada
    c:counter
        generic map (MAX_COUNT => 9)
        port map(
            clk => clock,
            count => count
        );

    -- Simulação aplicando os sinais de entrada
    Simulador: process
        -- Intervalo para cada mudança de estado durante a simulação
        constant interval: time := 1 ns;

        begin
            for i in 0 to 30 loop
                clock <= not clock;
                wait for interval;
                iteration <= std_logic_vector(unsigned(iteration) + 1);
            end loop;
    end process;

end tbCounterArch;
