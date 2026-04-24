library ieee;
use IEEE.std_logic_1164.all;

entity uart_rx is
        port(
            clk : in std_logic;
            uart_in : in std_logic;
            led : out std_logic;
        );
    end entity;

architecture uart_rx_arch of uart_rx is

    signal cache : std_logic_vector(7 downto 0) := (others => '0');
    constant baud_rate : integer := 9600;
    constant clk_freq : integer := 12000000;
    constant bit_period : integer := clk_freq / baud_rate;
    type state_type is (IDLE, READING);
    state : state_type := IDLE;

begin

    process(uart_in)
    begin
        if falling_edge(uart_in) and state = IDLE then
            state <= READING;
            bit_count := 0;
            clk_count := 0;
            cache <= (others => '0');
        end if;
    end process;


    process(clk)
            variable bit_count : integer (0 to 8) := 0;
            variable clk_count : integer (0 to bit_period * 11 - 1) := 0;
    begin
        if rising_edge(clk) and state = READING then

            if clk_count = ((bit_count + 1) * bit_period) + (bit_period / 2 )  then

                if bit_count < 8 then
                    cache(bit_count) <= uart_in;
                    bit_count <= bit_count + 1;
                end if;

            elsif clk_count = clk_count'high then

                if unsigned(cache) = 106 then  --checks if the received byte is 106 (ASCII for 'j')
                    led <= '1';
                elsif unsigned(cache) = 107 then --checks if the received byte is 107 (ASCII for 'k')
                    led <= '0';
                end if;
                state <= IDLE;

            else 

                clk_count <= clk_count + 1;

            end if;

        end if;
    end process;   

end architecture uart_rx_arch;      