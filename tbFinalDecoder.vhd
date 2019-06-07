library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tbFinalDecoder is
end tbFinalDecoder;

architecture tbFinalDecoderArch of tbFinalDecoder is
    -- Sinal auxiliar na simulação para indicar momento de mudança dos valores da entrada
    -- signal iteration: std_logic_vector (7 downto 0) := x"00";

    -- Declaração dos sinais
    -- Entradas
    signal code: std_logic_vector(6 downto 0);

    -- Saídas
    signal outputSignal: std_logic_vector(9 downto 0);

    -- Declaração das componentes
    component finalDecoder is
        port (
            code: in std_logic_vector(6 downto 0);
            translation: out std_logic_vector(9 downto 0)
        );
    end component;

begin

    -- Inclusão da componente a ser testada
    c:finalDecoder
        port map(
            code => code,
            translation => outputSignal
        );

    -- Simulação aplicando os sinais de entrada
    Simulador: process
        -- Intervalo para cada mudança de estado durante a simulação
        constant interval: time := 1 ns;

        begin
            for i in 0 to 99 loop
                code <= std_logic_vector(to_unsigned(i,7));
                wait for interval;
                -- iteration <= std_logic_vector(unsigned(iteration) + 1);
            end loop;
    end process;

end tbFinalDecoderArch;
