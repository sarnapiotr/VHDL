library ieee;
use ieee.std_logic_1164.all;
 
entity waterpump_tb is
end waterpump_tb;
 
architecture Simulation of waterpump_tb is
    signal clk_tb : std_logic := '0';
    signal water_level_tb : integer := 45;
    signal pump_state_tb : std_logic;
    constant CLK_PERIOD : time := 1 ms;
begin
    uut: entity work.waterpump 
    port map (
        clk => clk_tb,
        water_level => water_level_tb,
        pump_state => pump_state_tb
    );
 
    clk_tb <= not clk_tb after CLK_PERIOD/2;
 
    process
    begin
        wait for 5 ms;
        if pump_state_tb = '1' then
            water_level_tb <= water_level_tb + 1;
        else
            water_level_tb <= water_level_tb - 1;
        end if;
    end process;
end Simulation;
