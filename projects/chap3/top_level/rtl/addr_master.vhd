library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addr_master is
    generic (
        variable_delay : integer := 12500000
    );
    port(
        clk : in std_logic;
        rst : in std_logic;
        adr : out std_logic_vector(2 downto 0);
        we : out std_logic;
        d : out std_logic
    );
end entity;

architecture addr_master_a of addr_master is
    type state_type is (START, LON, LOFF);
    signal state : state_type := START;
    signal cnt : integer range 0 to 12500000 := 0;
    signal adr_reg : unsigned(2 downto 0) := "000";
    signal delay_cnt : integer range 0 to variable_delay := 0;
    signal slave_we : std_logic := '0';
    signal slave_d : std_logic := '0';
    signal delay_cnt2 : integer range 0 to 20000 := 0;
    signal wait_done : std_logic := '0';
    begin

    process (clk, rst)
    begin

        if rst = '1' then
            state <= START;
            slave_we <= '0';
            slave_d <= '0';
        elsif rising_edge(clk) then
                case state is
                    when START =>
                        state <= LON;
                    when LON =>
                        slave_d <= '1';
                        if delay_cnt = 0 then
                            slave_we <= '1';
                            delay_cnt <= delay_cnt + 1;
                        elsif delay_cnt = variable_delay then
                            delay_cnt <= 0;
                            slave_d <= '0';
                            state <= LOFF;
                        elsif delay_cnt = 10 then
                            slave_we <= '0';
                            delay_cnt <= delay_cnt + 1;
                        else
                            delay_cnt <= delay_cnt + 1;
                        end if;                        
                    when LOFF =>
                        slave_d <= '0';
                        slave_we <= '1';
                        
                        if delay_cnt2 = 10 then
                            delay_cnt2 <= 0;
                            slave_we <= '0';
                            wait_done <= '1';
                        else
                            delay_cnt2 <= delay_cnt2 + 1;
                        end if; 
                        
                        if wait_done = '1' then
                            if adr_reg = "111" then
                                adr_reg <= "000";
                            else
                                adr_reg <= adr_reg + 1;
                            end if;

                            state <= LON;
                            wait_done <= '0';
                        end if;
                end case;
        end if;
    end process;

    adr <= std_logic_vector(adr_reg);
    d <= slave_d;
    we <= slave_we;
end architecture addr_master_a;