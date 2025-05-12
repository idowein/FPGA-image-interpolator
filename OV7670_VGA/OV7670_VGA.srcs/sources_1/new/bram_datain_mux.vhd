----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2025 06:14:58 PM
-- Design Name: 
-- Module Name: bram_datain_mux - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bram_datain_mux is
  Port ( 
        clk                     : in  STD_LOGIC;
        bili_cntl               : in  STD_LOGIC;
        zoom_x2                 : in  STD_LOGIC;
        data_in_zoomed_bram     : in  std_logic_vector(11 downto 0); 
        data_in_full_bram       : in std_logic_vector(11 downto 0);
        data_out                : out std_logic_vector(11 downto 0)   
  );
end bram_datain_mux;

architecture Behavioral of bram_datain_mux is

begin

        process(zoom_x2, data_in_zoomed_bram, data_in_full_bram, bili_cntl)
        begin 
            if zoom_x2 = '1' then -- improve - if zoom = '1' and bili = '0' - only 1 if
                if bili_cntl = '1' then
                    data_out <= data_in_full_bram;
                else
                    data_out <= data_in_zoomed_bram; -- small bram
                end if;
            else 
                data_out <= data_in_full_bram;
            end if;
        end process;

end Behavioral;
