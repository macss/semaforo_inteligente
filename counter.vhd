library iee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    generic (
        MAX_COUNT: integer := 1
    );
    port (
        clk     : in boolean,
        count   : out std_logic_vector(6 downto 0)
    );
end counter;

architecture counterArch of counter is

    signal cnt: unsigned(6 downto 0) := (others => '0');

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if cnt = MAX_COUNT then
                cnt <= (others => '0');
            else
                cnt <= cnt + 1;
            end if;
            count <= std_logic_vector(cnt);
        end if;
    end process;
end counterArch;
