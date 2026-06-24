library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library iceduino;



entity ram_bus_bridge is
    generic(
        ram_bus_bridge_addr : std_ulogic_vector(31 downto 0);
        ADDR_WIDTH : natural := 6;
        DATA_WIDTH : natural := 32;
        UNUSED_BITS : natural := 8;
        MAX_ADDR : natural := 63
    );
    port (
    -- wishbone ports
    clk_i  : in  std_ulogic; -- global clock line
    rstn_i 	: in  std_ulogic; -- global reset line, low-active
    --wishbone-
    adr_i 	: in  std_ulogic_vector(31 downto 0); 
    dat_i	: in  std_ulogic_vector(31 downto 0); --write to slave
    dat_o	: out std_ulogic_vector(31 downto 0);       
    we_i  	: in  std_ulogic;
    stb_i  	: in  std_ulogic;
    cyc_i  	: in  std_ulogic;
    ack_o  	: out  std_ulogic;
    err_o  	: out  std_ulogic;
    
    -- specific ports
    ws2812_out : out std_ulogic;
    start_send : in std_ulogic
    
    );
end entity ram_bus_bridge;

architecture ram_bus_bridge_a of ram_bus_bridge is

    signal ram_waddr : std_ulogic_vector((ADDR_WIDTH-1) downto 0) := (others => '0');
    signal ram_wdata : std_ulogic_vector((DATA_WIDTH - 1) downto 0) := (others => '0');
    
    signal ram_raddr : std_ulogic_vector((ADDR_WIDTH-1) downto 0) := (others => '0');
    signal ram_rdata : std_ulogic_vector((DATA_WIDTH - 1) downto 0) := (others => '0');
    
    signal ram_we : std_ulogic := '0';

    signal module_active : std_ulogic := '1';


begin

    dat_o <= (others => '0');

    ram_waddr <= adr_i((ADDR_WIDTH-1) downto 0);

    ramtows2812_instance : entity iceduino.RAMtoWS2812
        generic map(
                ADDR_WIDTH => ADDR_WIDTH,
                DATA_WIDTH => DATA_WIDTH,
                UNUSED_BITS => UNUSED_BITS,
                MAX_ADDR => MAX_ADDR
        )
        port map(
                clk => clk_i,
                ws2812_out => ws2812_out,
                dout => ram_rdata,
                raddr => ram_raddr,
                start_send => start_send
        );

    ram_instance : entity iceduino.ram
        generic map(
                ADDR_WIDTH => ADDR_WIDTH,
                DATA_WIDTH => DATA_WIDTH
        )
        port map(
            write_en => ram_we,
            waddr => ram_waddr,
            wclk => clk_i,
            raddr => ram_raddr,
            rclk => clk_i,
            din => ram_wdata,
            dout => ram_rdata
        );
            
    
    w_access: process(clk_i)
        begin
            if rising_edge(clk_i) then
                ack_o <= '0';
                ram_we <= '0';
                err_o <= '0';
                ack_o <= module_active;

                if (module_active = '1' and we_i = '1') then
                    ram_wdata <= dat_i((DATA_WIDTH - 1) downto 0);
                    ram_we <= '1';
                else
                    ram_we <= '0';
                end if;
            end if;
    end process w_access;
    

        
end architecture ram_bus_bridge_a;