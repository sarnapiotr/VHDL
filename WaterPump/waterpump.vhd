library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity waterpump is
    port (
        clk : in std_logic;
        water_level : in integer;
        pump_state : out std_logic
    );
end waterpump;
 
architecture Behavior of waterpump is
    constant MAX_LVL : integer := 50;
    constant MIN_LVL : integer := 40;
    signal low_counter  : integer range 0 to 3 := 0;
    signal high_counter : integer range 0 to 3 := 0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if water_level < MIN_LVL then
                if low_counter < 3 then
                    low_counter <= low_counter + 1;
                end if;
            else
                low_counter <= 0;
            end if;
            if water_level > MAX_LVL then
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
