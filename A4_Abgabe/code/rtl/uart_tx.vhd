library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity uart_tx is
        port(
            clk : in std_logic;
            byte_in : in std_logic_vector(7 downto 0);
            we : in std_logic;
            out_bit : out std_logic;
            rst : in std_logic
        );
    end entity;


architecture uart_tx_a of uart_tx is
    type state_type is (IDLE, SENDING);
    signal state : state_type := IDLE;
    signal symbol_cnt : integer := 0;
    constant baud_rate : integer := 9600;
    constant clk_speed : integer := 12000000;
    constant bit_period : integer := clk_speed / baud_rate;

begin
    process(clk) is
    variable cnt_period : integer := 0;
    variable start_bit_done : std_logic := '0';
    variable char_bits_done : std_logic := '0';
        begin
            if rising_edge(clk) then

                if rst = '1' then
                    state <= IDLE;
                    out_bit <= '1';
                else 
                    case state is
                        when IDLE =>
                        if we = '1' then
                            state <= SENDING;
                        else
                            out_bit <= '1';
                        end if;
                        when SENDING =>
                            if start_bit_done = '0' then
                                out_bit <= '0';
                                if cnt_period < bit_period then
                                    cnt_period := cnt_period + 1;
                                else
                                    cnt_period := 0;
                                    start_bit_done := '1';
                                end if;
                            elsif char_bits_done = '1' then
                                out_bit <= '1';
                                if cnt_period < bit_period then
                                    cnt_period := cnt_period + 1;
                                else
                                    cnt_period := 0;
                                    char_bits_done := '0';
                                    state <= IDLE;
                                end if;
                            else
                                if symbol_cnt < 8 then

                                    out_bit <= byte_in(symbol_cnt);
                                    cnt_period := cnt_period + 1;

                                    if cnt_period > (bit_period - 1 ) then
                                        symbol_cnt <= symbol_cnt + 1;
                                        cnt_period := 0;
                                    end if;
                                else
                                    symbol_cnt <= 0;
                                    char_bits_done := '1';
                                end if;
                            end if;

                                
                    end case;
                
                end if;

            end if;
    end process;
end architecture uart_tx_a;