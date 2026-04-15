library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clockdivider_tb is
end entity;

architecture clockdivider_tb_a of clockdivider_tb is
    signal clk : std_logic := '0';
    signal start :std_logic := '0';
    signal rst : std_logic := '0';
    signal tick : std_logic := '0';
begin

    clockdivider_instance : entity work.clockdivider
    port map(
        clk => clk,
        start => start,
        rst => rst,
        tick => tick
    );


    clk <= not clk after 10 ns;

    process is
    begin

        -- just to initialize the tick variable for the sim
        rst <= '1';
        wait for 50 ns;
        rst <= '0';
        wait for 50 ns;

        start <= '1';
        wait for 251 ms;
        assert (tick = '1') report "tick didnt work" severity error;
        start <= '0';
        rst <= '1';
        wait for 50 ns;
        assert (tick = '0') report "tick didnt work" severity error;
        wait for 1 ms;
        rst <= '0';

        report "R1: done";

        start <= '1';
        wait for 251 ms;
        assert (tick = '1') report "tick didnt work" severity error;
        start <= '0';
        rst <= '1';
        wait for 50 ns;
        assert (tick = '0') report "tick didnt work" severity error;
        wait for 1 ms;
        rst <= '0';

        report "R2: done";


    end process;



end architecture clockdivider_tb_a;