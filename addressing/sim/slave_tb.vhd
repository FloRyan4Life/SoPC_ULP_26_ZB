library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity slave_tb is
end entity;

architecture tb of slave_tb is
      
    signal clk_50MHz : std_logic := '0';
    signal led : std_logic_vector(7 downto 0);
    signal res : std_logic := '1';
    signal adr : std_logic_vector(2 downto 0) := "000";
    signal d : std_logic := '0';
    signal we : std_logic := '0';

    constant CLK_PERIOD : time := 20 ns;

begin

    slave_instance: entity work.slave
        port map (
            clk_50MHz => clk_50MHz,
            led => led,
            res => res,
            adr => adr,
            d => d,
            we => we 
        );
    
    clk_50MHz <= not clk_50MHz after CLK_PERIOD / 2;

    process
    begin
        report "Slave Test startet.";
        assert res = '1'
            report "Reset Bit nicht gesetzt" severity error;
        
        wait for 20 ns;
        
        assert led = "00000000"
            report "LED nicht default state"  severity error;

        res <= '0';

        wait for (CLK_PERIOD * 5);

        report "Test 1: LED 6 einschalten...";
        we  <= '1';
        d   <= '1';
        adr <= "110";
        wait for CLK_PERIOD;
        
        assert led(6) = '1' and led = "01000000"
            report "Fehler: LED 6 sollte eingeschaltet sein" severity error;

        report "Test 2: WE=0 - Speicherhaltung testen...";
        we  <= '0';
        adr <= "000";  -- Adresse ändern
        d   <= '1';    -- Daten ändern
        wait for CLK_PERIOD;
        
        assert led = "01000000"
            report "Fehler: Bei WE=0 duerfen keine Aenderungen erfolgen" severity error;


        report "Test 3: LED 0 an, LED 6 aus...";
        
        -- LED 0 einschalten
        we  <= '1';
        adr <= "000";
        d   <= '1';
        wait for CLK_PERIOD;
        
        assert led = "01000001"
            report "Fehler: LED 0 und 6 sollten an sein" severity error;
        
        -- LED 6 ausschalten
        adr <= "110";
        d   <= '0';
        wait for CLK_PERIOD;
        
        assert led = "00000001"
            report "Fehler: Nur LED 0 sollte an sein" severity error;
        
        report "Alle Tests erfolgreich bestanden!";
          
        wait for 100 ns;

        std.env.stop(0); 

    end process;

    process(res)
    begin 
        if(res = '0') then
            report "Reset beendet.";
        end if;
    end process;

end architecture;



        

