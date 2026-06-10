library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.const_image.all;

entity RAMtoWS2812 is
end RAMtoWS2812;

architecture RAMtoWS2812_a of RAMtoWS2812 is
    signal clk : std_logic := '0';

    -- top level signals
    signal ws2812_out : std_logic := '0';
    signal raddr : std_ulogic_vector(7 downto 0):= "00000000";
    signal dout : std_ulogic_vector(7 downto 0) := "00000000";
    signal start_send : std_logic := '0';

    -- intern signals
    signal aserial_run : std_logic := '0';
    signal acnt_eq191 : std_logic := '0';
    signal sfr_done : std_logic := '0';

    signal sfr_rst : std_logic := '0';
    signal sfr_shift : std_logic := '0';
    signal sfr_load : std_logic := '0';
    signal aserial_wnr : std_logic := '0';
    signal acnt_rst : std_logic := '0';
    signal acnt_inc : std_logic := '0';

    signal sfr_serout : std_logic := '0';

    signal aserial_rst : std_logic := '0';

        
    begin

        clk <= not clk after 10 ns;

        fsm : entity work.fsm
        port map(
            clk => clk,
            start_send => start_send,
            aserial_run => aserial_run,
            acnt_eq191 => acnt_eq191,
            sfr_done => sfr_done,
            acnt_rst => acnt_rst,
            acnt_inc => acnt_inc,
            sfr_rst => sfr_rst,
            sfr_shift => sfr_shift,
            sfr_load => sfr_load,
            aserial_wnr => aserial_wnr
        );

        addr_counter : entity work.addresscounter
        port map(
            clk => clk,
            acnt_rst => acnt_rst,
            acnt_inc => acnt_inc,
            address => raddr,
            acnt_eq191 => acnt_eq191
        );

        sfr : entity work.shiftregister
        port map(
            clk => clk,
            sfr_din => dout,
            sfr_rst => sfr_rst,
            sfr_shift => sfr_shift,
            sfr_load => sfr_load,
            sfr_done => sfr_done,
            sfr_serout => sfr_serout
        );

        ws2812_aserial : entity work.ws2812_aserial
        port map (
            reset => aserial_rst,
            clk => clk,
            data_in => sfr_serout,
            wnr => aserial_wnr,
            ws2812_out => ws2812_out,
            run => aserial_run
        );
        

        process
        begin

            wait for 100 ns;
            dout <= x"ff";
            start_send <= '1';

            -- for i in 0 to 1000 loop

            --     wait for 5 ns;
            -- end loop;

            -- command to put data from the array into the dut
            
            
            --dout <= rom_image1(to_integer(unsigned(raddr)));
            wait for 10000 ns;
            dout <= x"66";

            wait for 10000 ns;
        end process;

end architecture RAMtoWS2812_a;