library ieee;
use ieee.std_logic_1164.all;

entity iceduino_led is
  generic (
    sevensegment_addr : std_ulogic_vector(31 downto 0)
  );
  port (
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
    -- parallel io --
    sevensegment_o : out std_ulogic_vector(7 downto 0)
  );
end entity;

architecture iceduino_led_rtl of iceduino_led  is
  
  signal module_active : std_ulogic;
  signal module_addr   : std_ulogic_vector(31 downto 0);
  signal reg_sevensegment : std_ulogic_vector(7 downto 0);
  signal point_status : std_ulogic := '0';

begin
  -- module active
  module_active <= '1' when ((adr_i = led_addr) and (cyc_i = '1' and stb_i = '1')) else '0';
  module_addr   <= adr_i;
  
  w_access: process(clk_i)
  begin
    if rising_edge(clk_i) then    
      -- handshake
      err_o <= '0';
      if (module_active = '1') then
        ack_o <= '1';        
      else   
        ack_o <= '0';
      end if;
      --write  
      if (module_active = '1' and we_i = '1') then
          reg_sevensegment <= dat_i(7 downto 0);          
      end if;
      --read
      dat_o(31 downto 0) <= (others => '0');  
      if (module_active = '1' and we_i = '0') then
        dat_o(7 downto 0) <= reg_sevensegment;             
      end if;      
    end if;
  end process w_access;
  
  -- output
  case reg_sevensegment is
    when 0 =>
        sevensegment_o <= "1111110" & point_status;
    when 1 =>
        sevensegment_o <= "0110000" & point_status;
    when 2 =>
        sevensegment_o <= "1101101" & point_status;
    when 3 =>
        sevensegment_o <= "1111001" & point_status;
    when 4 =>
        sevensegment_o <= "0110011" & point_status;
    when 5 =>
        sevensegment_o <= "1011011" & point_status;
    when 6 =>
        sevensegment_o <= "1011111" & point_status;
    when 7 =>
        sevensegment_o <= "1110000" & point_status;
    when 8 =>
        sevensegment_o <= "1111111" & point_status;
    when 9 =>
        sevensegment_o <= "1111011" & point_status;
    when others =>
        sevensegment_o <= "0000000" & point_status;
end case;
  
end architecture ;
