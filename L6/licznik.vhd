library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity licznik is
	port(
		inc			: in std_logic;
		count		: out std_logic_vector(3 downto 0);
		clk, reset	: in std_logic
	);
end licznik;

architecture BEHAVIOR of licznik is
	signal internal_count : unsigned(3 downto 0) := (others => '0');
begin
	process (clk, reset)
	begin
		if reset = '1' then
			internal_count <= (others => '0');
		elsif rising_edge(clk) then
			if inc = '1' then
				if internal_count = "0111" then
					internal_count <= (others => '0');
				else
					internal_count <= internal_count + 1;
				end if;
			else
				if internal_count = "0000" then
					internal_count <= "1111";
				else
					internal_count <= internal_count - 1;
				end if;
			end if;
		end if;
	end process;

	count <= std_logic_vector(internal_count);
end BEHAVIOR;
