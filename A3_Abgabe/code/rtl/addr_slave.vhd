library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addr_slave is

    port(
        clk:in std_logic;
        we : in std_logic;
        d : in std_logic;
        rst : in std_logic;
        addr : in std_logic_vector(2 downto 0);
        leds : out std_logic_vector(7 downto 0)
    );

end entity;

-- any entity needs at least one architecture -> describes inner workings of the "blackbox"-entity
architecture addr_slave_a of addr_slave is
begin
    process(clk, rst) is
    begin
        if rst = '1' then
            leds <= (others => '0');
        elsif rising_edge(clk) then
            if we = '1' then
                leds(to_integer(unsigned(addr))) <= d;
            end if;    
        end if;
    end process;
end architecture addr_slave_a;