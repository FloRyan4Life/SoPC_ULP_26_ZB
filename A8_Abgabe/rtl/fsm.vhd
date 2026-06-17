library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
    port(
        -- extern signals
        clk : in std_logic;
        start_send : in std_logic;
        -- from ws2812 aserial
        aserial_run : in std_logic;
        -- from addresscounter
        acnt_eq191 : in std_logic;
        -- from shiftregister
        sfr_done : in std_logic;
        -- to addresscounter
        acnt_rst : out std_logic;
        acnt_inc : out std_logic;
        -- to shiftregister
        sfr_rst : out std_logic;
        sfr_shift : out std_logic;
        sfr_load : out std_logic;
        -- to ws2812 aserial
        aserial_wnr : out std_logic
    );
end fsm;

architecture fsm_a of fsm is
    type state_type is (LOAD_DATA, SENDING, IDLE);
    signal state : state_type := IDLE;

    begin

        process(clk)
        --variable addr_inc_done : std_logic := '0';
        --variable last_run : std_logic := '0';
        variable first_addr : std_logic := '1';
        variable load_steps : integer := 0;
        variable loading_finished : std_logic := '0';
        begin
            if rising_edge(clk) then
                case state is
                    when LOAD_DATA =>

                    
                    if first_addr = '1' then
                        if load_steps = 0 then
                            
                            sfr_load <= '1';
                            load_steps := load_steps + 1;
                            elsif load_steps = 1 then
                                aserial_wnr <= '1';
                                load_steps := 0;
                                first_addr := '0';
                                load_steps := load_steps + 1;
                                else
                                loading_finished := '1';
                                end if;
                                
                                else 
                                if load_steps = 0 then
                                    acnt_inc <= '1';
                                    --addr_inc_done := '1';
                                    load_steps := load_steps + 1;
                                    elsif load_steps = 1 then
                                        acnt_inc <= '0';
                                        --addr_inc_done := '0';
                                        sfr_load <= '1';
                                        load_steps := load_steps +1;
                                        else
                                        aserial_wnr <= '1';
                                        load_steps := 0;
                                        loading_finished := '1';
                                        end if;
                                end if;
                                        
                                if loading_finished = '1' then
                                    loading_finished := '0';
                                    state <= SENDING;
                                end if;

                    when SENDING =>
                        sfr_load <= '0';
                        if sfr_done = '0' then
                            sfr_shift <= '0';
                            if aserial_run = '0' then                    
                                sfr_shift <= '1';
                            end if; 
                        else 
                            if aserial_run = '0' then

                                state <= LOAD_DATA;  
                            end if;                        
                        end if;

                        if acnt_eq191 = '1' then
                            aserial_wnr <= '0';
                            sfr_shift <= '0';
                            sfr_load <= '0';
                            state <= IDLE;
                        end if;  
                    when IDLE =>
                        if start_send = '1' then
                            first_addr := '1';
                            acnt_rst <= '0';
                            sfr_rst <= '0'; 
                            sfr_shift <= '0';
                            sfr_load <= '0';                          
                            state <= LOAD_DATA;
                        else 
                            acnt_rst <= '1';
                            sfr_rst <= '1';
                            sfr_shift <= '0';
                            sfr_load <= '0';
                        end if;

                end case;


            end if;
        end process;

end architecture fsm_a;