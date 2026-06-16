library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftregister is
    generic(
        DATA_WIDTH : natural := 32;
        ADDR_WIDTH : natural := 8
    );
    port(
        clk : in std_logic;
        sfr_din : in std_ulogic_vector((DATA_WIDTH-1) downto 0);
        sfr_rst : in std_logic;
        sfr_shift : in std_logic;
        sfr_load : in std_logic;
        sfr_serout : out std_logic;
        sfr_done : out std_logic
    );
end shiftregister;

architecture shiftregister_a of shiftregister is
    
    signal shift_reg : std_ulogic_vector((DATA_WIDTH-1) downto 0) := (others => '0');

begin

    process(clk)
        variable shift_cnt : integer range 0 to DATA_WIDTH := 0;
    begin
        if rising_edge(clk) then
            if sfr_rst = '1' then
                shift_reg <= (others => '0');
                shift_cnt := 0;
                sfr_done <= '0';

            elsif sfr_load = '1' then
                shift_reg <= sfr_din;
                shift_cnt := 0;
                sfr_done <= '0';

            elsif sfr_shift = '1' then
                if shift_cnt < DATA_WIDTH then
                shift_reg <= shift_reg((DATA_WIDTH-2) downto 0) & '0';
                shift_cnt := shift_cnt + 1;
                if shift_cnt > (DATA_WIDTH-2) then
                    sfr_done <= '1';
                end if;

                end if;

            end if;
        end if;
    end process;

    sfr_serout <= shift_reg(7);

end shiftregister_a;