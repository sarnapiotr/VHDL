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
    signal low_counter  : integer := 0;
    signal high_counter : integer := 0;
begin
process(clk)
begin
    if rising_edge(clk) then
        if water_level < MIN_LVL then
            low_counter <= low_counter + 1;
        else
            low_counter <= 0;
        end if;
		if water_level > MAX_LVL then
			high_counter <= high_counter + 1;
        else   
             high_counter <= 0;
        end if;
    end if;

    if water_level < MIN_LVL and low_counter > 3 then
        pump_state <= '1';
    elsif water_level > MAX_LVL and high_counter > 3 then
        pump_state <= '0';
    end if;
end process;
end Behavior;
