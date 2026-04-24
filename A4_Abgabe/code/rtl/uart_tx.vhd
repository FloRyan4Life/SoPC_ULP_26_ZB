library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity uart_tx is
        port(
            clk : in std_logic;
            byte_in : in std_logic_vector(7 downto 0);
            we : in std_logic;
            out_bit : out std_logic
        );
    end entity;


architecture uart_tx_a of uart_tx is
    signal cnt : unsigned(2 downto 0) := "000";
begin
    process(clk) is
        begin
            if rising_edge(clk) then
                if cnt = "000" then
                    if we = '1' then
                        out_bit <= byte_in(cnt);
                        cnt <= cnt + 1;
                    end if;
                else 
                    out_bit <= byte_in(cnt);
                    if cnt = "111" then
                        cnt <= "000";
                    else
                        cnt <= cnt + 1;
                    end if;
                end if;
            end if;
    end process;
end architecture uart_tx_a;