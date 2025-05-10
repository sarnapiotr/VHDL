library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debouncer is
    port (
        clk : in  std_logic;   -- zegar 50MHz
        btn_in : in  std_logic;   -- wejście (przycisk/switch)
        btn_out : out std_logic    -- wyjście po debouncingu
    );
end debouncer;

architecture Behavior of debouncer is
    constant MAX_COUNT : integer := 2_500_000; -- 50ms dla 50MHz (0.05 * 50 * 10^6)
    signal count : integer range 0 to MAX_COUNT := 0;
    signal prev_btn : std_logic := '0'; -- poprzedni stan przycisku
begin
    process(clk)
    begin
        if rising_edge(clk) then
            -- Reset licznika jeśli stan się zmienił
            if btn_in /= prev_btn then
                count <= 0;
                prev_btn <= btn_in;
            else
                -- Licz tylko jeśli stan stabilny
                if count < MAX_COUNT then
                    count <= count + 1;
                else
                    btn_out <= prev_btn; -- zatwierdź stan po 50ms
                end if;
            end if;
        end if;
    end process;
end Behavior;
