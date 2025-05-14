library ieee;
use ieee.std_logic_1164.all;

entity waterpump_tb is
end waterpump_tb;

architecture Simulation of waterpump_tb is
    signal clk_tb : std_logic := '0';
    signal water_level_tb : integer := 0;
    
    constant CLK_PERIOD : time := 1 ms;
begin
    uut: entity work.waterpump 
    port map (
        clk => clk_tb,
        water_level => water_level_tb
    );

    clk_tb <= not clk_tb after CLK_PERIOD/2;
end Simulation;