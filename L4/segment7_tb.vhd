library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity segment7_tb is
end segment7_tb;

architecture Simulation of segment7_tb is
    signal bcd : std_logic_vector(3 downto 0) := (others => '0');
    signal seg : std_logic_vector(6 downto 0);
begin
    uut: entity work.segment7
        port map (
            bcd => bcd,
            seg => seg
        );

    process
    begin
        for i in 0 to 9 loop
            bcd <= std_logic_vector(to_unsigned(i, 4));
            wait for 20 ns;
        end loop;

        wait;
    end process;
end Simulation;
