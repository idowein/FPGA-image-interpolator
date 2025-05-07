----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2025 06:10:32 PM
-- Design Name: 
-- Module Name: address_suitable - Behavioral
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

entity address_suitable is
  Port (
        bili_cntl               : in  std_logic; -- 17-bit input address
        bili_addr               : in std_logic_vector(16 downto 0);
        addr_in_full_image      : in  std_logic_vector(18 downto 0); -- 19-bit input address
        addr_out                : out std_logic_vector(16 downto 0)  -- 17-bit output address
   );
end address_suitable;

architecture Behavioral of address_suitable is

begin
     process (bili_cntl)
     begin
         if bili_cntl = '1' then
            addr_out <= bili_addr;
         else 
            addr_out <= addr_in_full_image(16 downto 0);
         end if;
     end process;
end Behavioral;
