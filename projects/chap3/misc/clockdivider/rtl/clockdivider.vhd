library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clockdivider is
    port(
        clk: in std_logic;
        start: in std_logic;
        rst:in std_logic;
        tick: out std_logic
    );
end entity;

architecture clockdivider_a of clockdivider is
    signal cnt : integer range 0 to 12500000 := 0;
    signal done : std_logic := '0';
begin
    process(clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                cnt <= 0;
                tick <= '0';
                done <= '0';
            end if;
            if done = '0' then
                if start = '1' then
                    if cnt = 12500000 then
                        cnt <= 0;
                        tick <= '1';
                        done <= '1';
                    else 
                        cnt <= cnt + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;
end architecture clockdivider_a;