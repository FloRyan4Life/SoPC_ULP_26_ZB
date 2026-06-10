library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addresscounter is
    port(
        clk : in std_logic;
        acnt_rst : in std_logic;
        acnt_inc : in std_logic;
        acnt_eq191  : out std_logic;
        address : inout std_logic_vector(7 downto 0)
    );
end addresscounter;

architecture addresscounter_a of addresscounter is


begin
    
    process(clk)
    begin
        if rising_edge(clk) then
            if acnt_rst ='1' then

                address <= (others => '0');

            elsif acnt_inc = '1' then

                address <= std_logic_vector(unsigned(address) + 1);
                if unsigned(address) = 191 then
                    acnt_eq191 <= '1';
                else
                    acnt_eq191 <= '0';
                end if;

            end if;
        end if;
    end process;

end architecture addresscounter_a;