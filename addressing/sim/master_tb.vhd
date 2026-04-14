library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity master_tb is
end entity master_tb;

architecture tb of master_tb is
    signal clk_12MHz : std_logic := '0';
    signal res : std_logic := '1';
    signal adr : std_logic_vector(2 downto 0);
    signal d : std_logic := '0';
    signal we : std_logic := '0';

    constant SIM_DELAY : integer := 20;

begin

    master_instance : entity work.master
        generic map (
            DELAY_CYCLES => SIM_DELAY
        )
        port map(
          clk_12MHz => clk_12MHz,
          res => res,
          adr => adr,
          d => d,
          we => we  
        );
    
    clk_12MHz <= not clk_12MHz after 41.67 ns;

    process
    begin
        wait for 100 ns;
        res <= '0';

        wait for 21 us; 
        std.env.stop(0); 
    end process;


end architecture;