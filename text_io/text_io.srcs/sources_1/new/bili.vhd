----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 10:58:17 AM
-- Design Name: 
-- Module Name: bili - Behavioral
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
USE ieee.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bili is
    Port ( 
            clk      : IN  STD_LOGIC;
            RESET    : IN  STD_LOGIC;
            data_in  : IN  STD_LOGIC_VECTOR (7 downto 0);
            data_out : OUT STD_LOGIC_VECTOR (7 downto 0));
end bili;

architecture Behavioral of bili is

begin
    process( clk, RESET) begin
        if RESET = '1' then 
            data_out <= (others => '0');
        elsif rising_edge(clk) then
            data_out <= data_in + 1;
        end if ;
    end process;
end Behavioral;
