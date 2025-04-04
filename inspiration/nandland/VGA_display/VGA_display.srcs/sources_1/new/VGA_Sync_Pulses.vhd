----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ido Weinstock
-- 
-- Create Date: 03/31/2025 01:06:12 PM
-- Design Name: 
-- Module Name: none - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 

-- This module is designed for 640x480 with a 25 MHz input clock.
 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGA_Sync_Pulses is
  generic (
    g_TOTAL_COLS  : integer := 800;
    g_TOTAL_ROWS  : integer := 525;
    g_ACTIVE_COLS : integer := 640;
    g_ACTIVE_ROWS : integer := 480   
    );
  port (
    i_Clk       : in  std_logic;
    o_HSync     : out std_logic;
    o_VSync     : out std_logic;
    o_Col_Count : out std_logic_vector(9 downto 0);
    o_Row_Count : out std_logic_vector(9 downto 0)
    );
end entity VGA_Sync_Pulses;

architecture RTL of VGA_Sync_Pulses is

  signal r_Col_Count : integer range 0 to g_TOTAL_COLS-1 := 0;
  signal r_Row_Count : integer range 0 to g_TOTAL_ROWS-1 := 0;

begin

  p_Row_Col_Count : process (i_Clk) is
  begin
    if rising_edge(i_Clk) then
      if r_Col_Count = g_TOTAL_COLS-1 then
        if r_Row_Count = g_TOTAL_ROWS-1 then
          r_Row_Count <= 0;
        else
          r_Row_Count <= r_Row_Count + 1;
        end if;
        r_Col_Count <= 0;
      else
        r_Col_Count <= r_Col_Count + 1;
      end if;
    end if;
  end process p_Row_Col_Count;

  o_HSync <= '1' when r_Col_Count < g_ACTIVE_COLS else '0';
  o_VSync <= '1' when r_Row_Count < g_ACTIVE_ROWS else '0';

  o_Col_Count <= std_logic_vector(to_unsigned(r_Col_Count, o_Col_Count'length));
  o_Row_Count <= std_logic_vector(to_unsigned(r_Row_Count, o_Row_Count'length));
  
end architecture RTL;
