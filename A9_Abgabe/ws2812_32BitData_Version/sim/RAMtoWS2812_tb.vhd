library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.const_image.all;

entity RAMtoWS2812_tb is
end RAMtoWS2812_tb;

architecture RAMtoWS2812_tb_a of RAMtoWS2812_tb is
    signal clk : std_logic := '0';

    constant ADDR_WIDTH : natural := 6;
    constant DATA_WIDTH : natural := 32;
    constant UNUSED_BITS : natural := 8;
    constant MAX_ADDR : natural := 63;

    -- top level signals
    signal ws2812_out : std_logic := '0';
    signal raddr : std_ulogic_vector(ADDR_WIDTH - 1 downto 0):= (others => '0');
    signal dout : std_ulogic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
    signal start_send : std_logic := '0';

        
    begin

        clk <= not clk after 10 ns;

        rantows2812 : entity work.RAMtoWS2812
        generic map(
            ADDR_WIDTH => ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH,
            UNUSED_BITS => UNUSED_BITS,
            MAX_ADDR => MAX_ADDR
        )
        port map(
            clk => clk,
            start_send => start_send,
            dout => dout,
            raddr => raddr,
            ws2812_out => ws2812_out
        );        

        process(raddr)
        begin
            dout <= rom32_image1(to_integer(unsigned(raddr)));
        end process;


        reset: process
        begin

            wait for 800 ns;
            start_send <= '1';
            wait for 100 ns;
            start_send <= '0';

            wait;
        end process reset;

end architecture RAMtoWS2812_tb_a;