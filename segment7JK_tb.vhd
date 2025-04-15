library ieee;
use ieee.std_logic_1164.all;

entity segment7_tb is
end segment7_tb;

architecture Simulation of segment7_tb is
    -- Deklaracja sygnałów
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal J, K : std_logic := '1';
    signal Q0, Q1, Q2, Q3 : std_logic;
    signal seg : std_logic_vector(6 downto 0);
    
    -- Proces zegara
    constant clk_period : time := 20 ns;
begin
    -- Instancja przerzutnika JK
    uut0: entity work.jk_flipflop
        port map (
            J => J,
            K => K,
            clk => clk,
            reset => reset,
            Q => Q0,
            Qn => open
        );

    uut1: entity work.jk_flipflop
        port map (
            J => J,
            K => K,
            clk => clk,
            reset => reset,
            Q => Q1,
            Qn => open
        );

    uut2: entity work.jk_flipflop
        port map (
            J => J,
            K => K,
            clk => clk,
            reset => reset,
            Q => Q2,
            Qn => open
        );

    uut3: entity work.jk_flipflop
        port map (
            J => J,
            K => K,
            clk => clk,
            reset => reset,
            Q => Q3,
            Qn => open
        );
    
    -- Instancja wyświetlacza 7-segmentowego
    uut7seg: entity work.segment7
        port map (
            bcd => std_logic_vector(Q3 & Q2 & Q1 & Q0),
            seg => seg
        );
        
    -- Proces generujący zegar
    clock_process : process
    begin
        clk <= not clk;
        wait for clk_period / 2;
    end process;

    -- Proces sterujący resetem
    stimulus_process : process
    begin
        -- Reset początkowy
        reset <= '1';
        wait for 40 ns;
        reset <= '0';

        -- Wykonywanie cykli
        wait for 200 ns;

        -- Koniec symulacji
        wait;
    end process;

end Simulation;
