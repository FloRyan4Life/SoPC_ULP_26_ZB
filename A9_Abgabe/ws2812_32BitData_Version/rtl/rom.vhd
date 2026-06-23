library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.const_image.all;

entity rom is
    generic(
        ADDR_WIDTH : natural := 6;
        DATA_WIDTH : natural := 32
    );
    port(
        raddr : in std_ulogic_vector((ADDR_WIDTH-1) downto 0);
        dout : out std_ulogic_vector((DATA_WIDTH-1) downto 0)
    );
end rom;

architecture rom_a of rom is
    begin
        dout <= rom32_image3(to_integer(unsigned(raddr)));
end architecture rom_a;