library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_if is
    Port ( clk : in  std_logic;
           rst : in  std_logic;
           cnt_out : out  std_logic_vector(3 downto 0));
end counter_if;

architecture Behavioral of counter_if is
begin
    process(clk, rst)
        variable count : std_logic_vector(3 downto 0);
    begin
        if rst = '1' then
            count := "0000";
        elsif rising_edge(clk) then
            if count = "1001" then
                count := "0000";
            else
                count := std_logic_vector(unsigned(count) + 1);
            end if;
        end if;
        cnt_out <= count;
    end process;
end Behavioral;
