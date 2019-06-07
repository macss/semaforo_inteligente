library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tbfreq_divider is
end tbfreq_divider;

architecture tbfreq_dividerArch of tbfreq_divider is
    -- Sinal auxiliar na simulação para indicar momento de mudança dos valores da entrada
    signal iteration: std_logic_vector (7 downto 0) := x"00";

    -- Declaração dos sinais
    -- Entradas
    signal clock: std_logic := '0';

    -- Saídas
    signal clockOut: std_logic;

    -- Declaração das componentes
    component freq_divider is
        generic (
            REFERENCE_CLOCK: integer := 50000000; --Frequência da placa utilizada
            CLK_TIME: integer := 1 --Período do clock de saída
        );
        port (
            clk     : in std_logic;
            clkOut  : out std_logic
        );
    end component;

begin

    -- Inclusão da componente a ser testada
    c:freq_divider
        generic map (
            REFERENCE_CLOCK => 1,
            CLK_TIME => 2
        )
        port map(
            clk => clock,
            clkOut => clockOut
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

end tbfreq_dividerArch;
