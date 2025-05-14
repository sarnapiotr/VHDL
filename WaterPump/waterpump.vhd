library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity waterpump is
    port (
        clk : in std_logic;
        water_level : out integer
    );
end waterpump;

architecture Behavior of waterpump is
    constant MAX_LVL : integer := 50;
    constant MIN_LVL : integer := 40;
    
    signal low_counter  : integer range 0 to 3 := 0;
    signal high_counter : integer range 0 to 3 := 0;
    
    signal internal_water_level : integer := 45;
    signal pump_state  : std_logic := '0';
begin
    water_level <= internal_water_level;
    
    process(clk)
    begin
        if rising_edge(clk) then
            if pump_state = '1' then
                internal_water_level <= internal_water_level + 1;
            else
                internal_water_level <= internal_water_level - 1;
            end if;
            
            if internal_water_level < MIN_LVL then
                if low_counter < 3 then
                    low_counter <= low_counter + 1;
                end if;
            else
                low_counter <= 0;
            end if;
            
            if internal_water_level > MAX_LVL then
                if high_counter < 3 then
                    high_counter <= high_counter + 1;
                end if;
            else
                high_counter <= 0;
            end if;
            
            if low_counter = 3 then
                pump_state <= '1';
            elsif high_counter = 3 then
                pump_state <= '0';
            end if;
        end if;
    end process;
end Behavior;
