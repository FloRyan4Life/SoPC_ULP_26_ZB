library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
    generic (
        ADDR_WIDTH : natural := 6;
        DATA_WIDTH : natural := 32
    );
    port (
        write_en : in std_logic;
        waddr : in std_ulogic_vector(ADDR_WIDTH - 1 downto 0);
        wclk : in std_logic;
        raddr : in std_ulogic_vector(ADDR_WIDTH - 1 downto 0);
        rclk : in std_logic;
        din : in std_ulogic_vector(DATA_WIDTH - 1 downto 0);
        dout : out std_ulogic_vector(DATA_WIDTH - 1 downto 0)
    );
end ram;

architecture ram_a of ram is

    type mem_type is array ((2** ADDR_WIDTH) - 1 downto 0) of std_ulogic_vector(DATA_WIDTH - 1 downto 0);
    signal mem : mem_type := (others => (others => '0')); 

begin
    -- write memory
    process(wclk)
    begin
        if (wclk'event and wclk = '1') then
            if write_en = '1' then
                mem(to_integer(unsigned(waddr))) <= din;
            end if;
        end if;
    end process;

    -- read memory
    process(rclk)
    begin
        if (rclk'event and rclk = '1') then
            dout <= mem(to_integer(unsigned(raddr)));
        end if;
    end process;

end ram_a ;