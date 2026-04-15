library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addr_counter_tb is
end entity;

architecture addr_counter_tb_a of addr_counter_tb is
    signal clk : std_logic := '0';
    signal en : std_logic := '0';
    signal rst: std_logic := '0';
    signal addr : std_logic_vector(2 downto 0) := (others => '0');
begin

    clk <= not clk after 10 ns; -- 50 MHz clock

    addr_counter_instance : entity work.addr_counter
    port map(
        clk => clk,
        en => en,
        rst => rst,
        addr => addr
    );

    
    process is
        begin
            
        rst <= '1';
        wait for 22 ns;
        rst <= '0';

        for i in 0 to 14 loop

            wait for 50 ns;
            en <= '1';
            wait for 20 ns;
            en <= '0';

        end loop;
        
        wait for 100 ns;
    end process;
end architecture addr_counter_tb_a;