library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_if_tb is
end counter_if_tb;

architecture Behavioral of counter_if_tb is
    component counter_if is
        Port ( clk : in  std_logic;
               rst : in  std_logic;
               cnt_out : out  std_logic_vector(3 downto 0));
    end component;
    
    signal clk_tb : std_logic := '0';
    signal rst_tb : std_logic := '0';
    signal cnt_out_tb : std_logic_vector(3 downto 0) := "0000";
begin
    uut: counter_if port map(clk => clk_tb, rst => rst_tb, cnt_out => cnt_out_tb);

    process
    begin
        rst_tb <= '1';
        wait for 10 ns;
        rst_tb <= '0';
        wait for 10 ns;

        for i in 0 to 9 loop
            clk_tb <= '0';
            wait for 5 ns;
            clk_tb <= '1';
            wait for 5 ns;
        end loop;

        wait;
    end process;
end Behavioral;
