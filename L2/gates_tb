library ieee;
use ieee.std_logic_1164.all;

entity gates_tb is
end gates_tb;

architecture Simulation of gates_tb is
	signal a_tb : std_logic := '0';
	signal b_tb : std_logic := '0';
	signal and_gate_tb : std_logic;	 
	signal or_gate_tb : std_logic;
	signal nand_gate_tb : std_logic;  
	signal nor_gate_tb : std_logic;				  
	signal xor_gate_tb : std_logic;
begin
	uut: entity work.gates port map(
		a => a_tb,
		b => b_tb,	 
		and_gate => and_gate_tb,
		or_gate => or_gate_tb,
		nand_gate => nand_gate_tb,
		nor_gate => nor_gate_tb,
		xor_gate => xor_gate_tb
	);	
	process
	begin
		a_tb <= '0';
		b_tb <= '0'; 
		wait for 50 ns;	
		a_tb <= '0';
		b_tb <= '1'; 
		wait for 50 ns;
		a_tb <= '1';
		b_tb <= '0'; 
		wait for 50 ns;
		a_tb <= '1';
		b_tb <= '1'; 
		wait for 50 ns;	
	end process;
end Simulation;
