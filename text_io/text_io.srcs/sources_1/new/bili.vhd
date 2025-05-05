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
-- Description: Multiply input by 2 using numeric_std
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
use IEEE.NUMERIC_STD.ALL;

entity bili is
    Port ( 
        clk      : IN  STD_LOGIC;
        RESET    : IN  STD_LOGIC;
        data_in  : IN  STD_LOGIC_VECTOR (7 downto 0);
        data_out : OUT STD_LOGIC_VECTOR (7 downto 0)
    );
end bili;

architecture Behavioral of bili is
begin
    process(clk, RESET)
    begin
        if RESET = '1' then
            data_out <= (others => '0');
        elsif rising_edge(clk) then
--            data_out <= std_logic_vector(unsigned(data_in) * 2); -- doesn't work
--        data_out <= std_logic_vector(resize(unsigned(data_in) * 2, 8)); -- mul
        data_out <= std_logic_vector(resize(unsigned(data_in) / 64, 8));
        end if;
    end process;
end Behavioral;
