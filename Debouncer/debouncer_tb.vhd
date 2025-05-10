library ieee;
use ieee.std_logic_1164.all;

entity debouncer_tb is
end debouncer_tb;

architecture Simulation of debouncer_tb is
    signal clk_tb     : std_logic := '0';
    signal btn_in_tb  : std_logic := '0';
    signal btn_out_tb : std_logic;
    
    constant CLK_PERIOD : time := 20 ns;  -- 50 MHz (okres 20 ns)
begin
    uut: entity work.debouncer 
    port map (
        clk     => clk_tb,
        btn_in  => btn_in_tb,
        btn_out => btn_out_tb
    );

    clk_tb <= not clk_tb after CLK_PERIOD/2;

    process
    begin
        btn_in_tb <= '0';
        wait for 100 ns;
        
        btn_in_tb <= '1'; wait for 1 ms;
        btn_in_tb <= '0'; wait for 1 ms;
        btn_in_tb <= '1'; wait for 1 ms;
        btn_in_tb <= '0'; wait for 1 ms;
        btn_in_tb <= '1'; wait for 60 ms;
        
        btn_in_tb <= '0'; wait for 1 ms;
        btn_in_tb <= '1'; wait for 1 ms;
        btn_in_tb <= '0'; wait for 60 ms;
        wait;
    end process;
end Simulation;
