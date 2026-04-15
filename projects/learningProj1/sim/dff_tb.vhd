library ieee;
use IEEE.std_logic_1164.all;

-- ENTITY
entity dff_tb is
end entity;



-- ARCHITECTURE
architecture tb of dff_tb is
    signal clk : std_logic := '0';
    signal d : std_logic := '0';
    signal q : std_logic;
begin


    clk <= not clk after 5 ns;


    -- mapping signals to ports of the 'dff' instance that is created here
    dff : entity work.dff
    port map(
        clk => clk,
        d => d,
        q => q
    );


    process is
    begin
        wait for 20 ns;
        d <= '1';
        wait for 20 ns;
        d <= '0';
        wait for 100 ns;
    end process;

end architecture;
