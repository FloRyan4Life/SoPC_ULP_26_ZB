library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity uart_rx_tb is
end entity;

architecture uart_rx_tb_arch of uart_rx_tb is

    signal clk : std_logic := '0';
    signal uart_in : std_logic := '1';
    signal led : std_logic;

    constant baud_rate : integer := 9600;
    constant clk_freq : integer := 12000000;
    constant clk_periode : time := 83.33 ns;
    constant baud_period : time := 1 sec / baud_rate;

begin

    uart_rx_inst : entity work.uart_rx
        port map(
            clk => clk,
            uart_in => uart_in,
            led => led
        );


    clk <= not clk after clk_periode/2; -- 12 MHz clock

    process
        variable byte_jump : std_logic_vector(7 downto 0) := "01101010"; -- ASCII for 'j'
        variable byte_kill : std_logic_vector(7 downto 0) := "01101011"; -- ASCII for 'k'
        variable byte_other : std_logic_vector(7 downto 0) := "11111111"; -- A byte that is not 'j' or 'k'
    begin
        wait for 100 ns; -- Wait for the system to stabilize

        -- Send start bit
        uart_in <= '0';
        wait for baud_period; -- Wait for one bit period (1/baud_rate)

        -- Send data bits (LSB first)
        for i in 0 to 7 loop
            uart_in <= byte_jump(i);
            wait for baud_period; -- Wait for one bit period
        end loop;

        -- Send stop bit
        uart_in <= '1';
        wait for baud_period; -- Wait for one bit period

        wait for 100 ns; -- Wait before ending the simulation

        assert led = '1' report "LED should be ON after receiving 'j'" severity error;

        wait for 100 ns; -- Wait before sending the next byte

        -- Send byte for 'k'
        uart_in <= '0';
        wait for baud_period; -- Wait for one bit period (1/baud_rate)

        -- Send data bits (LSB first)
        for i in 0 to 7 loop
            uart_in <= byte_kill(i);
            wait for baud_period; -- Wait for one bit period
        end loop;

        -- Send stop bit
        uart_in <= '1';
        wait for baud_period; -- Wait for one bit period

        wait for 100 ns; -- Wait before ending the simulation

        assert led = '0' report "LED should be OFF after receiving 'k'" severity error;
        
        wait for 100 ns; -- Wait before ending the simulation

        -- test with a different byte (not 'j' or 'k')
        uart_in <= '0';

        wait for baud_period; -- Wait for one bit period (1/baud_rate)

        -- Send data bits (LSB first)
        for i in 0 to 7 loop
            uart_in <= byte_other(i); -- Send a byte that is not 'j' or 'k'
            wait for baud_period; -- Wait for one bit period
        end loop;

        -- Send stop bit
        uart_in <= '1';

        wait for baud_period; -- Wait for one bit period

        wait for 100 ns; -- 

        assert led = '0' report "LED should remain OFF after receiving a byte other than 'j' or 'k'" severity error;

        std.env.stop(0); -- Stop the simulation

    end process;

end architecture;