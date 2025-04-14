library ieee;
use ieee.std_logic_1164.all;

entity jk_counter_tb is
end jk_counter_tb;

architecture Behavioral of jk_counter_tb is
  component jk_counter is
    port (
      clk : in std_logic;
      reset : in std_logic;
      q : out std_logic_vector(3 downto 0)
    );
  end component;

  signal clk : std_logic := '0';
  signal reset : std_logic := '0';
  signal q : std_logic_vector(3 downto 0);

begin
  dut: jk_counter port map (
    clk => clk,
    reset => reset,
    q => q
  );

  process
  begin
    wait for 10 ns;
    reset <= '1';
    wait for 5 ns;
    reset <= '0';
    wait for 1 ns;
    assert q = "0000" report "Error: q /= 0000" severity error;
    wait for 9 ns;
    assert q = "0001" report "Error: q /= 0001" severity error;
    wait for 9 ns;
    assert q = "0010" report "Error: q /= 0010" severity error;
    wait for 9 ns;
    assert q = "0011" report "Error: q /= 0011" severity error;
    wait for 9 ns;
    assert q = "0100" report "Error: q /= 0100" severity error;
    wait for 9 ns;
    assert q = "0101" report "Error: q /= 0101" severity error;
    wait for 9 ns;
    assert q = "0110" report "Error: q /= 0110" severity error;
    wait for 9 ns;
    assert q = "0111" report "Error: q /= 0111" severity error;
    wait for 9 ns;
    assert q = "1000" report "Error: q /= 1000" severity error;
    wait for 1 ns;
    report "Testbench complete" severity note;
    wait;
  end process;

  clk <= not clk after 5 ns;

end Behavioral;
