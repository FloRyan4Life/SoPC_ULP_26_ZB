library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity slave is
    port(
        clk_50MHz : in std_logic;
        d : in std_logic;
        we : in std_logic;
        res : in std_logic;
        adr : in std_logic_vector(2 downto 0);
        led : out std_logic_vector(7 downto 0)
    );
end entity;

architecture slave_rtl of slave is

    signal led_reg : std_logic_vector(7 downto 0) := (others => '0');
    
begin
    process(clk_50MHz, res) is
    begin
        if(res = '1') then
            led_reg <= (others => '0');
        elsif rising_edge(clk_50MHz) then
            if(we = '1') then
                led_reg(to_integer(unsigned(adr))) <= d;
            end if;
        end if;
    end process;

    led <= led_reg;

end architecture;
                

