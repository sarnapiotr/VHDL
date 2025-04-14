library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity licznik_tb is
end licznik_tb;

architecture Simulation of licznik_tb is
    component licznik
    port (
        inc     	: in std_logic;
        count   	: out std_logic_vector(3 downto 0);
        clk, reset 	: in std_logic
    );
    end component;

    signal clk		:std_logic:='0';
	signal reset_tb	:std_logic:='1';
	signal inc_tb	:std_logic:='0';
    signal count_tb : std_logic_vector(3 downto 0);
begin
    uut: licznik port map (
	clk => clk,
	reset => reset_tb,
	inc => inc_tb,
	count => count_tb);	
	
	clk <= not clk after 5ns;
	reset_tb <= '1','0' after 10ns;
	
	process
	begin
		inc_tb <= '0';
		wait for 20ns;
		inc_tb <= '1';
		wait for 180ns;
		inc_tb <= '0';
		wait for 180ns;	
	end process;
		

end Simulation;
