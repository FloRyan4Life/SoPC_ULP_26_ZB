library ieee;
use ieee.std_logic_1164.all;

entity ws2812_aserial is

port(
    reset : in std_logic;
    clk : in std_logic;
    wnr : in std_logic;
    data_in : in std_logic;
    ws2812_out : out std_logic;
    run : inout std_logic
);

end ws2812_aserial;


architecture ws2812_aserial_a of ws2812_aserial is

    signal cnt : integer := 0;
    
begin
    
    process(clk)
    begin
        if rising_edge(clk) then

            if reset = '1' then
                ws2812_out <= '0';
                run <= '0';
                cnt <= 0;
            elsif wnr = '1' OR run = '1' then
                if cnt < 18 then
                    ws2812_out <= '1';
                    run <= '1';
                    cnt <= cnt + 1;
                elsif cnt < 45 then
                    ws2812_out <= data_in;
                    run <= '1';
                    cnt <= cnt + 1;
                elsif cnt < 63 then
                    ws2812_out <= '0';
                    run <= '1';
                    cnt <= cnt + 1;
                else
                    ws2812_out <= '0';
                    run <= '0';
                    cnt <= 0;
                end if;
            else
                ws2812_out <= '0';
                run <= '0';
                cnt <= 0;
            end if;

        end if;
    end process;
    
end architecture ws2812_aserial_a;