library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity uart_rx is
        port(
            clk : in std_logic;
            uart_in : in std_logic;
            led : out std_logic
        );
    end entity;

architecture uart_rx_arch of uart_rx is

    signal cache : std_logic_vector(7 downto 0) := (others => '0');
    uart_sync : std_logic_vector(1 downto 0) := (others => '0');
    constant baud_rate : integer := 9600;
    constant clk_freq : integer := 12000000;
    constant bit_period : integer := clk_freq / baud_rate - 1;
    type state_type is (IDLE, READING);
    signal state : state_type := IDLE;

begin

    process(clk)
            variable pre_cnt : integer range 0 to bit_period / 2 := 0;
            variable post_cnt : integer range 0 to bit_period / 2 := 0;
            variable bit_cnt : integer range 0 to 7 := 0;
            variable clk_cnt : integer range 0 to bit_period := 0;

    begin
        if rising_edge(clk) then

            uart_sync <= uart_sync(1 downto 0) & uart_in; -- Shift in the new bit for synchronization

            if state = IDLE then

                if uart_sync(1 downto 0) = "10" then -- Detect the falling edge for start bit
                    state <= READING;
                    pre_cnt := 0;
                    post_cnt := 0;
                    bit_cnt := 0;
                    clk_cnt := 0;
                    cache <= (others => '0');
                end if;

            elsif state = READING then

                if pre_cnt < (bit_period / 2) then

                    pre_cnt := pre_cnt + 1;

                elsif bit_cnt < 7 then
                    
                    if clk_cnt < bit_period then

                        clk_cnt <= clk_cnt + 1;

                    else

                        cache(bit_cnt) <= uart_sync(0); -- Sample the bit
                        bit_cnt := bit_cnt + 1;
                        clk_cnt := 0;

                    end if;

                elsif post_cnt < (bit_period * 1.5) then
                
                    post_cnt := post_cnt + 1;

                else

                    if unsigned(cache) = 106 then  --checks if the received byte is 106 (ASCII for 'j')
                        led <= '1';
                    elsif unsigned(cache) = 107 then --checks if the received byte is 107 (ASCII for 'k')
                        led <= '0';
                    end if;
                    state <= IDLE;
                    
                end if;
            end if;
        end if;
    end process;   

end architecture uart_rx_arch;      