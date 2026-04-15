library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity master is
    generic (
        DELAY_CYCLES : integer := 3_000_000
    );
    port(
        clk_12MHz : in std_logic;
        res : in std_logic;
        we: out std_logic;
        d : out std_logic;
        adr : out std_logic_vector(2 downto 0)
    );
end entity;

architecture master_rtl of master is
    signal cnt : integer range 0 to DELAY_CYCLES;
    signal dir : std_logic;
    signal adr_reg : unsigned (2 downto 0);

    type state_master is (LED_ON, LED_OFF, IDLE);
    signal state : state_master;
    
begin
 
    process(clk_12MHz, res) is
    begin
        if(res = '1') then
            cnt <= 0;
            dir <= '1';
            adr_reg <= (others => '0');
            state <= IDLE;
        elsif rising_edge(clk_12MHz) then
            if(cnt = 0) then
                if(state = LED_OFF) then
                    if(dir = '1') then
                        adr_reg <= adr_reg + 1;
                    elsif(dir = '0') then
                        adr_reg <= adr_reg - 1;
                    end if;
                end if;    
                state <= LED_ON;
                cnt <= cnt + 1;
            elsif(cnt = DELAY_CYCLES) then           
                if(adr_reg = "000") then
                    dir <= '1';
                elsif(adr_reg = "111") then
                    dir <= '0';
                end if;
                state <= LED_OFF;
                cnt <= 0;
            else
                state <= IDLE;
                cnt <= cnt + 1;
            end if;
        end if;
    end process;

    adr <= std_logic_vector(adr_reg);

    d <= '1' when(state = LED_ON) else '0';

    we <= '1' when(state = LED_ON or state = LED_OFF) else '0';

end architecture;