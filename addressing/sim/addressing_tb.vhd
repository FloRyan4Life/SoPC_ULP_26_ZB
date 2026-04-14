library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity addressing_tb is
end entity addressing_tb;

architecture tb of addressing_tb is
    signal clk_12MHz : std_logic := '0';
    signal clk_50MHz : std_logic := '0';
    signal led_signal : std_logic_vector(7 downto 0);

    constant SIM_DELAY : integer := 20;
    constant CLK_12_PERIOD : time := 83.33 ns;
    constant CLK_50_PERIOD : time := 20 ns;
begin

    addressing_inst : entity work.addressing
        generic map (
            DELAY_CYCLES => SIM_DELAY
        )
        port map(
            clk_12MHz => clk_12MHz,
            clk_50MHz => clk_50MHz,
            led_port => led_signal
        );
    
    clk_12MHz <= not clk_12MHz after CLK_12_PERIOD / 2;

    clk_50MHz <= not clk_50MHz after CLK_50_PERIOD / 2;

    process
    begin
        wait for 40 ns;

        wait until led_signal = "00000100";  -- LED 2
        report "LED 2 leuchtet!";

        wait for 80 us; 
        std.env.stop(0); 
    end process;


end architecture;