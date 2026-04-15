library ieee;
use IEEE.std_logic_1164.all;


entity counter is

port(
    clk : in std_logic;
    en : in std_logic;
    b0 : inout std_logic;
    b1 : inout std_logic;
    b2 : inout std_logic;
    b3 : inout std_logic
);s

end entity;


architecture rtl of counter is
begin
    process (clk) is        
    begin 
        if rising_edge(clk) then
            if en = '1' then
                    
                if b0 = '0' then
                    b0 <= '1';
                elsif b1 = '0' then
                    b1 <= '1';
                    b0 <= '0';
                elsif b2 = '0' then
                    b2 <= '1';
                    b1 <= '0';
                    b0 <= '0';
                elsif b3 = '0' then
                    b3 <= '1';
                    b2 <= '0';
                    b1 <= '0';
                    b0 <= '0';
                else
                    b3 <= '0';
                    b2 <= '0';
                    b1 <= '0';
                    b0 <= '0';
                end if;
            end if;
        end if;
    end process;
end architecture;