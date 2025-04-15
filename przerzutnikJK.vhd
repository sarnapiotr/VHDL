library ieee;
use ieee.std_logic_1164.all;

entity jk_flipflop is
    port (
        J : in std_logic;
        K : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        Q : out std_logic;
        Qn : out std_logic
    );
end jk_flipflop;

architecture Behavior of jk_flipflop is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            Q <= '0';
            Qn <= '1';
        elsif rising_edge(clk) then
            case (J & K) is
                when "00" =>
                    -- Q nie zmienia stanu
                    Q <= Q;
                    Qn <= Qn;
                when "01" =>
                    -- Reset (Q = 0, Qn = 1)
                    Q <= '0';
                    Qn <= '1';
                when "10" =>
                    -- Set (Q = 1, Qn = 0)
                    Q <= '1';
                    Qn <= '0';
                when "11" =>
                    -- Toggle (zmienia stan)
                    Q <= not Q;
                    Qn <= not Qn;
                when others =>
                    Q <= Q;
                    Qn <= Qn;
            end case;
        end if;
    end process;
end Behavior;
