library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addr_counter is
    port(
        clk: in std_logic;
        en:in std_logic;
        rst : in std_logic;
        done : out std_logic;
        addr:out std_logic_vector(2 downto 0)
    );
end entity;

architecture addr_counter_a of addr_counter is
    signal addr_num : integer := 0;
    signal old_en : std_logic := '0';
begin

    process(clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                addr_num <= 0;
            elsif en = '1' then
                if addr_num = 7 then
                    addr_num <= 0;
                else 
                    addr_num <= addr_num + 1;
                end if;
                done <= '1';
            elsif en = '0' then
                done <= '0';
            end if;
        end if;
    end process;

    addr <= std_logic_vector(to_unsigned(addr_num, 3));
end architecture addr_counter_a;