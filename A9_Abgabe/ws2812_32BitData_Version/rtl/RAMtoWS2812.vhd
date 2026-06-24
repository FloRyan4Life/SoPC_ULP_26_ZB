library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- library work;
-- use work.const_image.all;

entity RAMtoWS2812 is
    generic(
        ADDR_WIDTH : natural := 6;
        DATA_WIDTH : natural := 32;
        UNUSED_BITS : natural := 8;
        MAX_ADDR : natural := 63
    );
    port(
        clk : in std_logic;
        ws2812_out : out std_logic;
        -- sollte es hier nicht heißen din ?? Es ist ja der dateneingang des moduls.
        dout : in std_ulogic_vector((DATA_WIDTH-1) downto 0);
        raddr : out std_ulogic_vector((ADDR_WIDTH-1) downto 0);
        start_send : in std_logic
    );
end RAMtoWS2812;

architecture RAMtoWS2812_a of RAMtoWS2812 is
    --signal clk : std_logic := '0';

    -- top level signals
    --signal ws2812_out : std_logic := '0';
    --signal raddr : std_ulogic_vector(7 downto 0):= "00000000";
    --signal dout : std_ulogic_vector(7 downto 0) := "00000000";
    --signal start_send : std_logic := '0';

    -- intern signals
    signal aserial_run : std_logic := '0';
    signal acnt_eq_max : std_logic := '0';
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

        --clk <= not clk after 10 ns;

        fsm : entity work.fsm
        port map(
            clk => clk,
            start_send => start_send,
            aserial_run => aserial_run,
            acnt_eq_max => acnt_eq_max,
            sfr_done => sfr_done,
            acnt_rst => acnt_rst,
            acnt_inc => acnt_inc,
            sfr_rst => sfr_rst,
            sfr_shift => sfr_shift,
            sfr_load => sfr_load,
            aserial_wnr => aserial_wnr,
            aserial_rst => aserial_rst
        );

        addr_counter : entity work.addresscounter
            generic map(
                ADDR_WIDTH => ADDR_WIDTH,
                MAX_ADDR => MAX_ADDR
            )
        port map(
            clk => clk,
            acnt_rst => acnt_rst,
            acnt_inc => acnt_inc,
            address => raddr,
            acnt_eq_max => acnt_eq_max
        );

        sfr : entity work.shiftregister
        generic map(
            DATA_WIDTH => DATA_WIDTH,
            UNUSED_BITS => UNUSED_BITS
        )
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
        

end architecture RAMtoWS2812_a;