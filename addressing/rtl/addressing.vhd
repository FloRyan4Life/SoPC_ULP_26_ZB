library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity addressing is
    generic (
        -- Für Simulation: 20 (schnell), für Synthese: 3_000_000 (1/4s bei 12MHz)
        DELAY_CYCLES : integer := 3_000_000
    );
    port (
    clk_12MHz : in std_logic; -- zum adr_slave
    clk_50MHz : in std_logic; -- zum adr_master
    led_port : out std_logic_vector(7 downto 0) -- LED Ausgänge Slave
    );
    end addressing;

architecture rtl of addressing is
    signal adr_bus : std_logic_vector(2 downto 0);
    signal d_bus : std_logic;
    signal we_bus : std_logic;
    signal async_reset : std_logic := '1';

begin

    -- async_reset als std_logic Signal anlegen!
    process(clk_12Mhz) is
        variable cnt : unsigned(7 downto 0) := (others => '0');
    begin
        if rising_edge(clk_12Mhz) then
            if cnt < 255 then
                cnt := cnt + 1;
                async_reset <= '1';
            else
                async_reset <= '0';
            end if;
        end if;
    end process;

    master_inst : entity work.master
        generic map(
            DELAY_CYCLES => DELAY_CYCLES 
        )
        port map(
            clk_12MHz => clk_12MHz,
            res => async_reset,
            adr => adr_bus,
            d => d_bus,
            we => we_bus
        );
    
    slave_inst : entity work.slave
        port map(
            clk_50MHz => clk_50MHz,
            res => async_reset,
            adr => adr_bus,
            d => d_bus,
            we => we_bus,
            led => led_port
        );

end architecture;