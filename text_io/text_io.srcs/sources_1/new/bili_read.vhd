library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
use ieee.std_logic_textio.all;

entity read_320x240_tb is
    port (
        clk           : in  std_logic;
        clkx3         : in  std_logic;
        filed_enable  : in  std_logic;
        line_enable   : in  std_logic;
        line_sync     : in  std_logic;
        reset         : in  std_logic;
        pixel_out     : out std_logic_vector(11 downto 0)
    );
end read_320x240_tb;

architecture behavior of read_320x240_tb is
    file input_file : text open read_mode is "input_picture_320x240.txt";
    signal pixel_tmp : std_logic_vector(11 downto 0);
begin
    process(clk, reset)
        variable l : line;
        variable temp_pixel : integer;
    begin
        if reset = '1' then
            pixel_tmp <= (others => '0');
        elsif rising_edge(clk) then
            if line_sync = '1' and filed_enable = '1' then
                if not endfile(input_file) then
                    readline(input_file, l);
                end if;
            elsif filed_enable = '1' and line_enable = '1' then
                if not endfile(input_file) then
                    read(l, temp_pixel);
                    pixel_tmp <= conv_std_logic_vector(temp_pixel, 12);
                end if;
            end if;
        end if;
    end process;
    pixel_out <= pixel_tmp;
end behavior;
