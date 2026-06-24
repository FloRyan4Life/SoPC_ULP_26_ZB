library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addr_master_tb is
    generic(
        CLK_HALF_PERIOD : time := 10 ns
    );
end entity;

architecture addr_master_tb_a of addr_master_tb is
    signal clk : std_logic := '0';
    signal slave_we : std_logic := '0';
    signal slave_d : std_logic := '0';
    signal rst: std_logic := '1';
    signal adr : std_logic_vector(2 downto 0) := (others => '0');
begin

    addr_master_instance : entity work.addr_master
    generic map(
        CLK_HALF_PERIOD => CLK_HALF_PERIOD
    )
    port map(
        clk => clk,
        rst => rst,
        adr => adr,
        slave_we => slave_we,
        slave_d => slave_d
    );

    clk <= not clk after CLK_HALF_PERIOD; -- 50 MHz clock

    process is
        variable cnt : unsigned(7 downto 0) := (others => '0');
        begin
            if rising_edge(clk) then
                if cnt < 255 then
                    cnt := cnt + 1;
                else 
                    rst <= '0';
                end if;
            end if;


            wait for 10 ns;
    end process;
end architecture addr_master_tb_a;