library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity uart_tx_tb is
end entity;


architecture uart_tx_tb_a of uart_tx_tb is
    signal clk : std_logic := '0';
    signal byte_in : std_logic_vector(7 downto 0) := (others => '0');
    signal we : std_logic := '0';
    signal rst : std_logic := '0';
    signal out_bit :std_logic := '0';

begin
        uart_tx_inst : entity work.uart_tx
        port map(
            clk=> clk,
            byte_in => byte_in,
            we => we,
            rst => rst,
            out_bit => out_bit
        );

    clk <= not clk after 83.33 ns / 2;

    process
    begin
        -- Reset
        rst <= '1';
        wait for 100 ns;
        rst <= '0';

        -- Check IDLE
        wait for 50 ns;
        assert out_bit = '1' report "ERROR: out_bit not idle high after reset" severity error;

        -- 1
        byte_in <= "11010001";
        wait for 100 ns;
        we <= '1';
        wait for 100 ns;
        we <= '0';

        wait for 50 us;
        assert out_bit = '0'
            report "ERROR: Startbit not detected (Test 1)"
            severity warning;

        wait for 2 ms;
        assert out_bit = '1'
            report "ERROR: Line not back to idle (Test 1)"
            severity error;

        -- 2
        byte_in <= "10101010";
        wait for 100 ns;
        we <= '1';
        wait for 300 ns;
        we <= '0';

        wait for 50 us;
        assert out_bit = '0'
            report "ERROR: Startbit not detected (Test 2)"
            severity warning;

        wait for 2 ms;

        -- 3
        byte_in <= "11110000";
        wait for 100 ns;
        we <= '1';
        wait for 300 ns;
        we <= '0';

        wait for 50 us;
        assert out_bit = '0'
            report "ERROR: Startbit not detected (Test 3)"
            severity warning;

        wait for 2 ms;

        -- 4
        byte_in <= "00001111";
        wait for 100 ns;
        we <= '1';
        wait for 300 ns;
        we <= '0';

        wait for 50 us;
        assert out_bit = '0'
            report "ERROR: Startbit not detected (Test 4)"
            severity warning;

        wait for 2 ms;

        -- 5
        byte_in <= "00110011";
        wait for 100 ns;
        we <= '1';
        wait for 300 ns;
        we <= '0';

        wait for 50 us;
        assert out_bit = '0'
            report "ERROR: Startbit not detected (Test 5)"
            severity warning;

        wait for 2 ms;

        -- Ende
        assert false report "Simulation finished successfully" severity note;
        wait;


    end process;
end architecture uart_tx_tb_a;