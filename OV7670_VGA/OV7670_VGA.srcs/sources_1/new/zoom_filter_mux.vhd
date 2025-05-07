----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2025 11:49:48 AM
-- Design Name: 
-- Module Name: zoom_filter_mux - Behavioral
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

entity zoom_filter_mux is
    Port ( bili_cntl : in STD_LOGIC;
           doutb_without_filter : in STD_LOGIC_VECTOR (11 downto 0);
           doutb_with_filter : in STD_LOGIC_VECTOR (11 downto 0);
           address_bili : in STD_LOGIC_VECTOR (18 downto 0);
           address_vga : in STD_LOGIC_VECTOR (18 downto 0);
           addrb_bram_1 : out STD_LOGIC_VECTOR (18 downto 0);
           addrb_bram_2 : out STD_LOGIC_VECTOR (18 downto 0);
           dout_bram_1 : out STD_LOGIC_VECTOR (18 downto 0);
           dout_bram_2 : out STD_LOGIC_VECTOR (18 downto 0));
end zoom_filter_mux;

architecture Behavioral of zoom_filter_mux is

begin


end Behavioral;
