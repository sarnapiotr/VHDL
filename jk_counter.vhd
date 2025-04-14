library ieee;
use ieee.std_logic_1164.all;

entity jk_counter is
  port (
    clk : in std_logic;
    reset : in std_logic;
    q : out std_logic_vector(3 downto 0)
  );
end jk_counter;

architecture Behavioral of jk_counter is
  signal count : std_logic_vector(3 downto 0);
  signal jk_input : std_logic_vector(3 downto 0);
begin
  process(clk, reset)
  begin
    if reset = '1' then
      count <= "0000";
    elsif rising_edge(clk) then
      jk_input <= count;
      count(0) <= not jk_input(0);
      count(1) <= jk_input(0) and jk_input(1);
      count(2) <= jk_input(1) and jk_input(2);
      count(3) <= jk_input(2) and jk_input(3);
    end if;
  end process;
  
  q <= count;
  
end Behavioral;
