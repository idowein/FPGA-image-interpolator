library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
use ieee.std_logic_textio.all;

entity write_640x480_tb is
    port (
        clk           : in  std_logic;
        reset         : in  std_logic;
        field_enable  : in  std_logic;
        line_enable   : in  std_logic;
        line_sync     : in  std_logic;
        pixel_in      : in  std_logic_vector(11 downto 0)
    );
end write_640x480_tb;

architecture behavior of write_640x480_tb is
    file output_file : text open write_mode is "output_picture_640x480.txt";
    signal pixel_reg : std_logic_vector(11 downto 0);
    signal line_sync_d : std_logic := '0';
    signal col_count : std_logic_vector(10 downto 0) := (others => '0'); -- max 2047
begin

    process(clk)
    begin
        if rising_edge(clk) then
            line_sync_d <= line_sync;
        end if;
    end process;

    process(clk, reset)
        variable l : line;
        variable temp_int : integer := 0;
    begin
        if reset = '1' then
            col_count <= (others => '0');
        elsif rising_edge(clk) then
            pixel_reg <= pixel_in;

            if field_enable = '1' and line_enable = '1' then
                temp_int := conv_integer(unsigned(pixel_reg));
                write(l, temp_int);
                write(l, string'(" "));
                col_count <= col_count + 1;
            end if;

            if field_enable = '1' and line_sync = '1' and line_sync_d = '0' then
                writeline(output_file, l);
                col_count <= (others => '0');
            end if;
        end if;
    end process;
end behavior;
