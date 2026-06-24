library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ws2812 is
end entity;

architecture sim of tb_ws2812 is
    -- Takt
    signal clk          : std_logic := '0';
    constant CLK_PERIOD : time := 20 ns; -- 50 MHz
    
    -- DUT Signale
    signal reset        : std_logic := '1';
    signal wnr          : std_logic := '0';
    signal data_in      : std_logic := '0';
    signal ws2812_out   : std_logic;
    signal run          : std_logic;
    
    -- Testbench intern
    signal data_vector  : std_logic_vector(3 downto 0) := "1010";
    signal bit_idx      : integer range 0 to 3 := 0;
    
begin

    -----------------------------------------------------------------------
    -- Taktgenerator (50 MHz = 20 ns Periode)
    -----------------------------------------------------------------------
    clk <= not clk after CLK_PERIOD / 2;

    -----------------------------------------------------------------------
    -- DUT Instanziierung
    -----------------------------------------------------------------------
    dut : entity work.ws2812_aserial
        port map (
            reset       => reset,
            clk         => clk,
            wnr         => wnr,
            data_in     => data_in,
            ws2812_out  => ws2812_out,
            run         => run
        );

    -----------------------------------------------------------------------
    -- Stimulus-Prozess: Sendet "1010" mit korrektem Handshaking
    -----------------------------------------------------------------------
    stim_proc : process
    begin
        -- 1. Power-On-Reset (ca. 1 us)
        reset <= '1';
        wnr   <= '0';
        data_in <= '0';
        wait for 1 us;
        
        -- 2. Reset freigeben
        reset <= '0';
        wait until rising_edge(clk);

        -- 3. Bit-Sequenz "1010" senden
        for i in 0 to 3 loop
            -- Warten bis Modul bereit (run = '0')
            
            wait until rising_edge(clk);
            
            -- Nächstes Bit anlegen und Senden starten
            data_in <= data_vector(3-i);
            wnr     <= '1';
            
            -- Warten bis Modul die Übertragung beginnt (run = '1')
            wait until run = '1';

            wait until run = '0';
            
            -- WICHTIG: Keine Pause! Nächstes Bit wird sofort 
            -- in der nächsten Iteration angelegt.
        end loop;
        
        -- 4. Senden beenden
        --wait until rising_edge(clk);
        wnr <= '0';
        
        -- 5. Zeit für die letzten Flanken lassen (Reset-Code > 50 us)
        wait for 100 us;
        
        -- Simulation beenden
        assert false report "Simulation beendet" severity warning;
    end process stim_proc;

end architecture;