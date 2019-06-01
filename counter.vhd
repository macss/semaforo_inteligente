library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    generic (
        MAX_COUNT: integer := 1
    );
    port (
        clk     : in std_logic;
        count   : out std_logic_vector(6 downto 0)
    );
end counter;

architecture counterArch of counter is

    signal cnt: integer := 0;

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if cnt = MAX_COUNT then
                cnt <= 0;
            else
                cnt <= cnt + 1;
            end if;
            count <= std_logic_vector(to_unsigned(cnt,7));
        end if;
    end process;
end counterArch;
