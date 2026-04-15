library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addressing_tb is
    generic (
        variable_delay : integer := 500
    );

    port(
    clk_12MHz : in std_logic;
    clk_50MHz : in std_logic;
    leds : out std_logic_vector(7 downto 0)
    );
end entity;

architecture addressing_tb_a of addressing_tb is
    signal async_reset : std_logic := '1';
    signal slave_we : std_logic := '0';
    signal slave_d : std_logic := '0';
    signal slave_addr : std_logic_vector(2 downto 0) := "000";
    signal clk_12MHz_sim : std_logic := '0';
    signal clk_50MHz_sim : std_logic := '0';
    signal counter : unsigned(7 downto 0) := (others => '0');
    begin
        
        clk_12MHz_sim <= not clk_12MHz_sim after 41.666666 ns;
        clk_50MHz_sim <= not clk_50MHz_sim after 10 ns;
    
        process(clk_12MHz_sim) is
            variable cnt : unsigned(7 downto 0) := (others => '0');
        begin
            if rising_edge(clk_12MHz_sim) then
                if cnt < 255 then
                    cnt := cnt + 1;
                    counter <= cnt;
                    async_reset <= '1';
                else 
                    counter <= cnt;
                    async_reset <= '0';
                end if;
            end if;
        end process;

    addr_master_instance : entity work.addr_master
    generic map(
        variable_delay => variable_delay
    )
    port map(
        clk => clk_50MHz_sim,
        rst => async_reset,
        adr => slave_addr,
        we => slave_we,
        d => slave_d
    );

    addr_slave_instance : entity work.addr_slave
    port map(
        clk => clk_12MHz_sim,
        we => slave_we,
        d => slave_d,
        rst => async_reset, 
        addr => slave_addr,
        leds => leds
    );


    end architecture addressing_tb_a;