library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity gates is
	port (
		a       	: in   std_logic;                   
		b     	 	: in   std_logic;
		and_gate	: out  std_logic;
		or_gate		: out  std_logic;
		nand_gate	: out  std_logic;
		nor_gate	: out  std_logic;
		xor_gate	: out  std_logic);                    
end gates;	

architecture BEHAVIOR of gates is

begin 
	and_gate <= a AND b;
	or_gate <= a OR b;
	nand_gate <= a NAND b;
	nor_gate <= a NOR b;
	xor_gate <= a XOR b;
end BEHAVIOR;
