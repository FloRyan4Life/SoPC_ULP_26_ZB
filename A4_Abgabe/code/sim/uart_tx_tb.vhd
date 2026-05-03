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
begin
        uart_tx_inst : entity work.uart_tx
        port map(
            clk=> clk,
            byte_in => byte_in,
            we => we,
            rst => rst
        );

    clk <= not clk after 83.33 ns / 2;

    process
    begin
        byte_in <= "11010001";
        wait for 100 ns;
        we <= '1';
        wait for 100 ns;
        we <= '0';

        wait for 200 ns;

        -- assert led = '1' report "LED should be ON after receiving 'j'" severity error;

        -- byte_in <= "00000011";
        -- wait for 100 ns;
        -- we <= '1';
        -- wait for 10 ns;
        -- we <= '0';

        -- wait for 200 ns;


    end process;
end architecture uart_tx_tb_a;