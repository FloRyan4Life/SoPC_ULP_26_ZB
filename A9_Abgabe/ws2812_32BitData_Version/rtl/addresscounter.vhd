library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addresscounter is
    generic(
        ADDR_WIDTH : natural := 8;
        MAX_ADDR : natural := 191
    );
    port(
        clk : in std_logic;
        acnt_rst : in std_logic;
        acnt_inc : in std_logic;
        acnt_eq_max  : out std_logic;
        address : out std_ulogic_vector(ADDR_WIDTH-1 downto 0)
    );
end addresscounter;

architecture addresscounter_a of addresscounter is


begin
    
    process(clk)
    variable addr_cnt : unsigned(ADDR_WIDTH-1 downto 0);
    variable HasToBeReset : std_logic;
    
    begin
        if rising_edge(clk) then
            if acnt_rst ='1' then

                address <= (others => '0');
                acnt_eq_max <= '0';
                HasToBeReset := '0';
                addr_cnt := (others => '0');

            elsif acnt_inc = '0' then
                HasToBeReset := '0';
            elsif acnt_inc = '1' then
                if HasToBeReset = '0' then
                    HasToBeReset := '1';
                    address <= std_ulogic_vector(addr_cnt + 1);
                    addr_cnt := addr_cnt + 1;
                    if addr_cnt = MAX_ADDR then
                        acnt_eq_max <= '1';
                    else
                        acnt_eq_max <= '0';
                    end if;
                end if;

            end if;
        end if;
    end process;

end architecture addresscounter_a;