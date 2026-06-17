library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
    generic(
        ADDR_WIDTH : natural := 8;
        DATA_WIDTH : natural := 8;
        UNUSED_BITS : natural := 0;
        MAX_ADDR : natural := 191
    );
    port(
        clk : in std_logic;
        start_send : inout std_logic;
        ws2812_out : out std_logic
    );
end top;

architecture top_a of top is
    signal raddr : std_ulogic_vector(7 downto 0);
    signal dout : std_ulogic_vector(7 downto 0);

    begin
        rom_inst : entity work.rom
        port map(
            raddr => raddr,
            dout => dout
        );

        ramtows2812_inst : entity work.ramtows2812
        generic map(
            ADDR_WIDTH => ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH,
            UNUSED_BITS => UNUSED_BITS,
            MAX_ADDR => MAX_ADDR
        )
        port map(
            clk => clk,
            start_send => start_send,
            ws2812_out => ws2812_out,
            raddr => raddr,
            dout => dout
        );


        sending_cycle : process(clk) is
            variable start_cnt : integer := 0;
            begin
                if rising_edge(clk) then
                    start_cnt := start_cnt + 1;

                    if start_cnt > 100 and start_cnt < 300 then
                        start_send <= '1';
                    else 
                        start_send <= '0';
                    end if;

                    if start_cnt > 1000000 then
                        start_cnt := 0;
                    end if;

                end if;

            end process sending_cycle;

    end architecture top_a;