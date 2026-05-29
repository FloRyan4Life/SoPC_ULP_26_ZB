library ieee;
use ieee.std_logic_1164.all;

entity ws2812_aserial is

port(
    reset : in std_ulogic;
    clk : in std_ulogic;
    wnr : in std_ulogic;
    data_in : in std_ulogic;
    ws2812_out : out std_ulogic;
    run : out std_ulogic
);

end ws2812_aserial;


architecture ws2812_aserial_a of ws2812_aserial is
    
begin
    
    process(clk)
    begin
        if rising_edge(clk) then

        end if;
    end process;
    
end architecture ws2812_aserial_a;