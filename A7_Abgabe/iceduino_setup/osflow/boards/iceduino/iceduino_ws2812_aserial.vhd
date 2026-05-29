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