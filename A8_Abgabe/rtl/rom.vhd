library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.const_image.all;

entity rom is
    port(
        raddr : in std_ulogic_vector(7 downto 0);
        dout : out std_ulogic_vector(7 downto 0)
    );
end rom;

architecture rom_a of rom is
    begin
        dout <= rom_image2(to_integer(unsigned(raddr)));
end architecture rom_a;