library ieee;
use ieee.std_logic_1164.all;

entity iceduino_sevensegment is
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

architecture iceduino_sevensegment_rtl of iceduino_sevensegment  is
  
  signal module_active : std_ulogic;
  signal module_addr   : std_ulogic_vector(31 downto 0);
  signal reg_sevensegment : std_ulogic_vector(7 downto 0);
  signal seg_pattern : std_ulogic_vector(6 downto 0);
  signal point_status : std_ulogic := '0';

begin
  -- module active
  module_active <= '1' when ((adr_i = sevensegment_addr) and (cyc_i = '1' and stb_i = '1')) else '0';
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
  

  -- KOMBINATORISCHER 7-SEGMENT-DEKODER
  -- Common-Anode: Segment leuchtet bei '0' (LOW)

  seg_pattern <= 
    "0000001" when reg_sevensegment(3 downto 0) = x"0" else   -- 0: a,b,c,d,e,f an, g aus
    "1001111" when reg_sevensegment(3 downto 0) = x"1" else   -- 1: b,c an
    "0010010" when reg_sevensegment(3 downto 0) = x"2" else   -- 2: a,b,d,e,g an
    "0000110" when reg_sevensegment(3 downto 0) = x"3" else   -- 3: a,b,c,d an
    "1001100" when reg_sevensegment(3 downto 0) = x"4" else   -- 4: b,c,f,g an
    "0100100" when reg_sevensegment(3 downto 0) = x"5" else   -- 5: a,c,d,f,g an
    "0100000" when reg_sevensegment(3 downto 0) = x"6" else   -- 6: a,c,d,e,f,g an
    "0001111" when reg_sevensegment(3 downto 0) = x"7" else   -- 7: a,b,c an
    "0000000" when reg_sevensegment(3 downto 0) = x"8" else   -- 8: alle an
    "0000100" when reg_sevensegment(3 downto 0) = x"9" else   -- 9: a,b,c,d,f,g an
    "1111111"; -- alle aus

  -- Zuweisung der Segmentmuster an die Ausgänge, Berücksichtigung des Dezimalpunkts
  sevensegment_o <= (not point_status) & seg_pattern;

end architecture ;
