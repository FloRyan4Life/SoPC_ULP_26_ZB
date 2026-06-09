library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_addresscounter is
end tb_addresscounter;

architecture tb_addresscounter_a of tb_addresscounter is
    signal clk : std_logic := '0';
    signal acnt_rst : std_logic := '0';
    signal acnt_inc : std_logic := '0';
    signal acnt_eq191 : std_logic;
    signal address : std_logic_vector(7 downto 0);

begin

    uut : entity work.addresscounter
        port map(
            clk => clk,
            acnt_rst => acnt_rst,
            acnt_inc => acnt_inc,
            acnt_eq191 => acnt_eq191,
            address => address
        );

    -- Clock generation
    clk <= not clk after 10 ns;

    -- Test sequence
    process
    begin
        -- Initial reset
        wait for 20 ns;
        acnt_rst <= '1';
        wait for 20 ns;
        acnt_rst <= '0';
        wait for 20 ns;

        -- Increment address counter
        for i in 0 to 191 loop
            acnt_inc <= '1';
            wait for 20 ns;
            acnt_inc <= '0';
            wait for 20 ns;
        end loop;

        -- Wait and finish simulation
        wait for 100 ns;
        assert false report "End of simulation" severity note;
        wait;
    end process;

end tb_addresscounter_a;