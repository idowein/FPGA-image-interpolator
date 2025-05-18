----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2025 12:01:57 PM
-- Design Name: 
-- Module Name: BILINEAR_INTERPOLATION_TOP - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity BILINEAR_INTERPOLATION_TOP is
  Port ( 
        clk_in1             : in  std_logic; -- 100 MHz
        pixel_in            : in  std_logic_vector(11 downto 0);

        write_enable        : out std_logic; 
        pixel_out           : out std_logic_vector(11 downto 0); 
        address_write       : out std_logic_vector(18 downto 0); 
        address_read        : out std_logic_vector(16 downto 0) 
  );
end BILINEAR_INTERPOLATION_TOP;

architecture Behavioral of BILINEAR_INTERPOLATION_TOP is

    constant WIDTH : integer := 320;
    constant HEIGHT : integer := 240;
    
    constant WIDTH_FULL : integer := 640;
    constant HEIGHT_FULL : integer := 480;
    
    -- Input for calculation
    signal add_read : std_logic_vector(16 downto 0) := (others => '0');
    
    -- After calculation
    signal add_write : std_logic_vector(18 downto 0) := (others => '0');
    signal dout     : std_logic_vector(11 downto 0) := (others => '0');
    signal p00       : std_logic_vector(11 downto 0) := (others => '0');
    signal p03       : std_logic_vector(11 downto 0) := (others => '0');
    signal p30       : std_logic_vector(11 downto 0) := (others => '0');
    signal p33       : std_logic_vector(11 downto 0) := (others => '0');
    
    -- Aditional signal
    signal count    : std_logic_vector(3 downto 0) := (others => '0');
    signal row      : integer range 0 to HEIGHT-1 := 0;
    signal col      : integer range 0 to WIDTH-1 := 0;

begin

address_read  <= add_read;
address_write <= add_write;
pixel_out     <= dout;

process(clk_in1)
begin
    if rising_edge(clk_in1) then
        count <= count + 1;
    end if;
end process;

process(clk_in1)
begin

    if rising_edge(clk_in1) then
        write_enable <= '1'; 
        case count is

            -- PIXEL 00 WRITE
            when "0000" =>
                p00 <= pixel_in;
                dout <= pixel_in;
                add_write <= std_logic_vector(to_unsigned((row * 2 * WIDTH_FULL) + (col * 2), 19)); -- PIXEL P(00) ADDRESS WRITE
                add_read <= std_logic_vector(to_unsigned((row + 1) * WIDTH + col, 17)); -- NEXT PIXEL p(30) ADDRESS
                --add_read <= std_logic_vector(to_unsigned(row * WIDTH + col + 1, 17)); -- NEXT PIXEL P(03) ADDRESS READ
            
            -- PIXEL 03 WRITE
            when "0001" =>
                p03 <= pixel_in;
                dout <= pixel_in;
                add_write <= std_logic_vector(to_unsigned((row * 2 * WIDTH_FULL) + ((col + 1) * 2) + 1, 19)); -- PIXEL P(03) ADDRESS WRITE
                add_read <= std_logic_vector(to_unsigned((row + 1) * WIDTH + col + 1, 17)); -- NEXT PIXEL p(33) ADDRESS
            
            -- PIXEL 30 WRITE    
            when "0010" =>
                p30 <= pixel_in;
                dout <= pixel_in;
                add_write <= std_logic_vector(to_unsigned(((row + 1) * 2 * WIDTH_FULL) + WIDTH_FULL + (col * 2), 19)); -- PIXEL P(30) ADDRESS WRITE
                
            -- PIXEL 33 WRITE
            when "0011" =>
                p33 <= pixel_in;
                dout <= pixel_in;
                add_write <= std_logic_vector(to_unsigned(((row + 1) * 2 * WIDTH_FULL) + WIDTH_FULL + ((col + 1) * 2) + 1, 19)); -- PIXEL P(33) ADDRESS WRITE
            
            -- PIXEL 01 WRITE
            when "0100" =>
                dout <= std_logic_vector(unsigned(p00) + ((unsigned(p03) - unsigned(p00)) / 3));
                add_write <= std_logic_vector(to_unsigned((row * 2 * WIDTH_FULL) + (col * 2) + 1, 19));
                
            -- PIXEL 02 WRITE    
            when "0101" =>
                dout <= std_logic_vector(resize(unsigned(p00) + (((unsigned(p03) - unsigned(p00)) * 2) / 3),12));
                add_write <= std_logic_vector(to_unsigned((row * 2 * WIDTH_FULL) + (col * 2) + 2, 19));
                
            -- PIXEL 10 WRITE     
            when "0110" =>
                dout <= std_logic_vector(unsigned(p00) + ((unsigned(p30) - unsigned(p00)) / 3));
                add_write <= std_logic_vector(to_unsigned((row * 2 * WIDTH_FULL) + WIDTH_FULL + (col * 2), 19));
                
            -- PIXEL 20 WRITE     
            when "0111" =>
                dout <= std_logic_vector(resize(unsigned(p00) + (((unsigned(p30) - unsigned(p00)) * 2) / 3),12));
                add_write <= std_logic_vector(to_unsigned((row * 2 * WIDTH_FULL) + (2 * WIDTH_FULL) + (col * 2), 19));
                
            -- PIXEL 13 WRITE     
            when "1000" =>
                dout <= std_logic_vector(unsigned(p03) + ((unsigned(p33) - unsigned(p03)) / 3));
                add_write <= std_logic_vector(to_unsigned((row * 2 * WIDTH_FULL) + WIDTH_FULL + (col * 2) + 3, 19));
                
            -- PIXEL 23 WRITE     
            when "1001" =>
                dout <= std_logic_vector(resize(unsigned(p03) + (((unsigned(p33) - unsigned(p03)) * 2) / 3),12));
                add_write <= std_logic_vector(to_unsigned((row * 2 * WIDTH_FULL) + (2 * WIDTH_FULL) + (col * 2) + 3, 19));
                
            -- PIXEL 31 WRITE     
            when "1010" =>
                dout <= std_logic_vector(unsigned(p30) + ((unsigned(p33) - unsigned(p30)) / 3));
                add_write <= std_logic_vector(to_unsigned(((row + 1) * 2 * WIDTH_FULL) + WIDTH_FULL + (col * 2) + 1, 19));
                
            -- PIXEL 32 WRITE     
            when "1011" =>
                dout <= std_logic_vector(resize(unsigned(p30) + (((unsigned(p33) - unsigned(p30)) * 2) / 3),12));
                add_write <= std_logic_vector(to_unsigned(((row + 1) * 2 * WIDTH_FULL) + WIDTH_FULL + (col * 2) + 2, 19));
                
            -- PIXEL 11 WRITE     
            when "1100" =>
                dout <= std_logic_vector(resize(((resize(unsigned(p00),14) * 2) + resize(unsigned(p03),14) + (resize(unsigned(p30),14) * 2) + resize(unsigned(p33),14)) / 6, 12));
                add_write <= std_logic_vector(to_unsigned((row * 2 * WIDTH_FULL) + WIDTH_FULL + (col * 2) + 1, 19));
                
            -- PIXEL 12 WRITE     
            when "1101" =>
                dout <= std_logic_vector(resize(((resize(unsigned(p03),14) * 2) + resize(unsigned(p00),14) + (resize(unsigned(p30),14) * 2) + resize(unsigned(p33),14)) / 6, 12));
                add_write <= std_logic_vector(to_unsigned((row * 2 * WIDTH_FULL) + WIDTH_FULL + (col * 2) + 2, 19));
                
            -- PIXEL 21 WRITE
            when "1110" =>
                dout <= std_logic_vector(resize(((resize(unsigned(p00),14) * 2) + resize(unsigned(p03),14) + (resize(unsigned(p33),14) * 2) + resize(unsigned(p30),14)) / 6, 12));
                add_write <= std_logic_vector(to_unsigned((row * 2 * WIDTH_FULL) + (2 * WIDTH_FULL) + (col * 2) + 1, 19));
                
                -- NEXT PIXEL P(00) ADDRESS READ & PREPARE FOR NEXY CYCLE
                if col = WIDTH - 2 then
                    if row = HEIGHT - 2 then -- END OF CENTERD FRAME
                        add_read <= (others => '0'); 
                    else -- KERNEL MOVE TO NEXT ROW
                        add_read <= std_logic_vector(to_unsigned((row + 2) * WIDTH, 17));
                    end if;
                else -- KERNEL MOVE 2 COLUMNS RIGHT
                    add_read <= std_logic_vector(to_unsigned(row * WIDTH + col + 2, 17));
                end if;
                
            -- PIXEL 22 WRITE
            when "1111" =>
                dout <= std_logic_vector(resize(((resize(unsigned(p03),14) * 2) + resize(unsigned(p00),14) + (resize(unsigned(p33),14) * 2) + resize(unsigned(p30),14)) / 6, 12));
                add_write <= std_logic_vector(to_unsigned((row * 2 * WIDTH_FULL) + (2 * WIDTH_FULL) + (col * 2) + 2, 19));
                
                -- NEXT PIXEL P(03) ADDRESS READ & PREPARE FOR NEXY CYCLE
                if col = WIDTH - 2 then
                    col <= 0;
                    if row = HEIGHT - 2 then
                        row <= 0;
                        add_read <= "00000000000000001";
                    else
                        row <= row + 2;
                        add_read <= std_logic_vector(to_unsigned((row + 2) * WIDTH + 1, 17));
                    end if;
                else
                    col <= col + 2;
                    add_read <= std_logic_vector(to_unsigned(row * WIDTH + col + 3, 17));
                end if;
                
            when others =>
                dout <= "111111111111";
                add_write <= (others => '0');
            end case;
            
    end if;

end process;

end Behavioral;