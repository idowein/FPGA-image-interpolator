----------------------------------------------------------------------------------
-- Company: 
-- Engineers : Ido weinstock <ido.weinstock@gmail.com> (23/04/2025)
--             Dvir Hershkovitz <dvirhersh@gmail.com>
-- 
-- Create Date: 23.04.2025 
-- Design Name: 
-- Module Name: ovo_7670_caputre - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ovo_7670_caputre is
    Port ( pclk  : in   STD_LOGIC;
           camera_v_sync : in   STD_LOGIC;
           camera_h_ref  : in   STD_LOGIC;
           zoom_x2 : in STD_logic ;
           din     : in   STD_LOGIC_VECTOR (7 downto 0);
           addr  : out  STD_LOGIC_VECTOR (18 downto 0);
           dout  : out  STD_LOGIC_VECTOR (11 downto 0);
           wr_en    : out  STD_LOGIC;
           clk_bram  : out   STD_LOGIC); -- 1/2 fo pclk
end ovo_7670_caputre;

architecture Behavioral of ovo_7670_caputre is

	signal  address : STD_LOGIC_VECTOR (18 downto 0):= (others =>'0');
	signal  address_next :STD_LOGIC_VECTOR (18 downto 0):= (others =>'0');
	signal 	write_state :std_logic_vector (1 downto 0);
	signal  latch_href :std_logic;
	signal 	latced_data :std_logic_vector (15 downto 0):= (others =>'0');
	signal  counter_col,counter_row:std_logic_Vector(10 downto 0 ):= (others=> '0');
	signal  clk_bram_sig : std_logic := '0';

begin
    addr <=address;
    clk_bram <= clk_bram_sig;
    
    -- clk divider : clk_bram = pclk / 2
    process(pclk) begin
        if rising_edge(pclk) then
            clk_bram_sig <= not clk_bram_sig;
        end if;
    end process;

    
        process(pclk)
        begin
            if rising_edge(pclk) then
                 if(camera_v_sync = '1') then
                     address <= (others =>'0');
                     counter_row<=(others =>'0');
                     counter_col<=(others=>'0');
                     write_state <= (others =>'0');
                     wr_en <= '0';
                 else 
                     dout <= latced_data(15 downto 12) & latced_data(10 downto 7)  & latced_data(4 downto 1);
                     if (camera_h_ref = '1' and latch_href = '0') then 
                         counter_row<=std_logic_vector(unsigned(counter_row)+1);
                         counter_col<=(others=>'0');
                     end if;
                     write_state <= write_state(0) & (camera_h_ref and not (write_state(0)));
                     latced_data <= latced_data(7 downto 0) & din;
                     if( write_state(1) = '1') then
                            counter_col<=std_logic_vector(unsigned(counter_col)+1);
                            if (zoom_x2='1') then
                                 if(counter_row >= 120) and (counter_row < 360)  and (counter_col >= 160) and (counter_col < 480) then
                                    wr_en <= '1';
                                    address <= std_logic_vector(unsigned(address)+1);
                                 end if;    
                            else
                                 wr_en <= '1';
                                 address <= std_logic_vector(unsigned(address)+1);
                            end if;	              
                     else
--                        wr_en <= '0';
                     end if;
                     latch_href<=camera_h_ref;
            end if;
        end if;
    end process;
    
end Behavioral;
