library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity tb_shiftregister is
end tb_shiftregister;

Architecture tb_shiftregister_a of tb_shiftregister is
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal shift : std_logic := '0';
    signal load : std_logic := '0';
    signal serout : std_logic;
    signal done : std_logic;
    signal din : std_logic_vector(7 downto 0) := "11001010";

begin
    
    uut : entity work.shiftregister
        port map(
            clk => clk,
            sfr_din => din,
            sfr_rst => rst,
            sfr_shift => shift,
            sfr_load => load,
            sfr_serout => serout,
            sfr_done => done
        );

    -- Clock generation
    clk <= not clk after 10 ns;
    
    -- Test sequence
    process
    begin
        -- Initial reset
        wait for 20 ns;
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        wait for 20 ns;

        -- Load data into shift register
        load <= '1';
        wait for 20 ns;
        load <= '0';
        wait for 20 ns;

        -- Shift data out
        shift <= '1';
        wait for 60 ns; -- Shift first 4 bits (3 * 20 ns)
        shift <= '0';

        wait for 40 ns;
        shift <= '1';
        wait for 80 ns; -- Shift remaining 4 bits (4 * 20 ns)
        shift <= '0';

        -- Wait and finish simulation
        wait for 100 ns;
        assert false report "End of simulation" severity note;
        wait;
    end process;
    

end architecture tb_shiftregister_a;