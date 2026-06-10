library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addresscounter is
    port(
        clk : in std_logic;
        acnt_rst : in std_logic;
        acnt_inc : in std_logic;
        acnt_eq191  : out std_logic;
        address : out std_ulogic_vector(7 downto 0)
    );
end addresscounter;

architecture addresscounter_a of addresscounter is


begin
    
    process(clk)
    variable addr_cnt : unsigned(7 downto 0);
    variable HasToBeReset : std_logic;
    
    begin
        if rising_edge(clk) then
            if acnt_rst ='1' then

                address <= (others => '0');
                acnt_eq191 <= '0';
                HasToBeReset := '0';
                addr_cnt := x"00";

            elsif acnt_inc = '0' then
                HasToBeReset := '0';
            elsif acnt_inc = '1' then
                if HasToBeReset = '0' then
                    HasToBeReset := '1';
                    address <= std_ulogic_vector(addr_cnt + 1);
                    addr_cnt := addr_cnt + 1;
                    if addr_cnt = 191 then
                        acnt_eq191 <= '1';
                    else
                        acnt_eq191 <= '0';
                    end if;
                end if;

            end if;
        end if;
    end process;

end architecture addresscounter_a;