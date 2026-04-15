library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addr_slave_tb is
end entity;



architecture addr_slave_tb_a of addr_slave_tb is
    signal clk : std_logic := '0';
    signal we : std_logic :='0';
    signal d : std_logic := '0';
    signal reset : std_logic := '0';
    signal addr : std_logic_vector(2 downto 0) := (others => '0');
    signal leds : std_logic_vector(7 downto 0) := (others => '0');
begin
    
    clk <= not clk after 10 ns; -- 50 MHz

    addr_slave_instance : entity work.addr_slave
        port map(
            clk => clk,
            we => we,
            d => d,
            reset => reset,
            addr => addr,
            leds => leds
        );

    process is
        begin

        -- set output bits to a value != 'u'
        reset <= '1';
        wait for 30 ns;
        reset <= '0';


        -- first round
        -- b0, b1, b2 == 0,0,0
        addr <= (others => '0');

        wait for 10 ns;
        d <= '1';
        we <= '1';

        wait for 80 ns;
        assert (leds = "00000001") report "R1: LEDS falsch" severity error;
        assert (addr = "000") report "R1: b0 falsch" severity error;
        report "R1: OK" severity note;
        
        we <= '0';
        wait for 1 ns;
        d <= '0';

        wait for 200 ns;

        -- second round
        addr <= (others => '1');

        wait for 10 ns;
        d <= '1';
        we <= '1';

        wait for 80 ns;
        assert (leds = "10000001") report "R2: LEDS falsch" severity error;
        assert (addr = "111") report "R2: addr falsch" severity error;
        report "R2: OK" severity note;
        
        we <= '0';
        wait for 1 ns;
        d <= '0';

        wait for 200 ns;
        
        -- third round
        addr <= "010";

        wait for 10 ns;
        d <= '1';
        we <= '1';

        wait for 80 ns;
        assert (leds = "10000101") report "R3: LEDS falsch" severity error;
        report "R3: OK" severity note;
        
        we <= '0';
        wait for 200 ns;
        d <= '0';

    end process;
end architecture addr_slave_tb_a; 