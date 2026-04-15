library ieee;
use IEEE.std_logic_1164.all;

-- ENTITY
entity counter_tb is
end entity;



-- ARCHITECTURE
architecture tb of counter_tb is
    signal clk : std_logic := '0';
    signal en : std_logic := '0';
    signal b0 : std_logic;
    signal b1 : std_logic;
    signal b2 : std_logic;
    signal b3 : std_logic;
begin


    clk <= not clk after 5 ns;


    -- mapping signals to ports of the 'dff' instance that is created here
    dff : entity work.counter
    port map(
        clk => clk,
        en => en,
        b0 => b0,
        b1 => b1,
        b2 => b2,
        b3 => b3
    );


    process is
    begin
        wait for 20 ns;
        en <= '1';
        wait for 200 ns;
        en <= '0';
        wait for 1000 ns;
    end process;

end architecture;
