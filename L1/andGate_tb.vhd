library ieee;
use ieee.std_logic_1164.all;

entity andGate_tb is
end andGate_tb;

architecture Simulation of andGate_tb is
	signal A_tb : std_logic;
	signal B_tb : std_logic;
	signal Y : std_logic;

begin
	uut: entity work.andGate port map (
		A => A_tb,
		B => B_tb,
		Y => Y);
	
	process
	begin
		A_tb <= '0';
		B_tb <= '0';
		wait for 50 ns;
		A_tb <= '1';
		B_tb <= '0';
		wait for 50 ns;
		A_tb <= '0';
		B_tb <= '1';
		wait for 50 ns;
		A_tb <= '1';
		B_tb <= '1';
		wait for 50 ns;
	end process;
end Simulation;
