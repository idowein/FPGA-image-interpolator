----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2025 12:40:00 PM
-- Design Name: 
-- Module Name: BILINEAR_INTERPOLATION_TOP_tb - Testbench
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for BILINEAR_INTERPOLATION_TOP module
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

entity BILINEAR_INTERPOLATION_TOP_tb is
end BILINEAR_INTERPOLATION_TOP_tb;

architecture Behavioral of BILINEAR_INTERPOLATION_TOP_tb is

    -- Component declaration for the Unit Under Test (UUT)
    component BILINEAR_INTERPOLATION_TOP
        Port ( 
            clk_vga             : in  std_logic; -- 25.175MHz
            clk_in1             : in  std_logic; -- 100 MHz
            clk_interpolation   : in  std_logic; -- 25.175/4 MHz
            pixel_in            : in  std_logic_vector(11 downto 0);
            write_enable        : out std_logic; 
            pixel_out           : out std_logic_vector(11 downto 0); 
            address_out         : out std_logic_vector(18 downto 0) 
        );
    end component;

    -- Signals for connecting to UUT
    signal clk_vga             : std_logic := '0';
    signal clk_in1             : std_logic := '0';
    signal clk_interpolation   : std_logic := '0';
    signal pixel_in            : std_logic_vector(11 downto 0) := (others => '0');
    signal write_enable        : std_logic;
    signal pixel_out           : std_logic_vector(11 downto 0);
    signal address_out         : std_logic_vector(18 downto 0);

    -- Clock periods
    constant clk_in1_period    : time := 10 ns;  -- 100 MHz
    constant clk_vga_period    : time := 39.682 ns; -- 25.175 MHz
    constant clk_interpolation_period : time := 158.730 ns; -- 6.3 MHz

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: BILINEAR_INTERPOLATION_TOP
        Port map (
            clk_vga             => clk_vga,
            clk_in1             => clk_in1,
            clk_interpolation   => clk_interpolation,
            pixel_in            => pixel_in,
            write_enable        => write_enable,
            pixel_out           => pixel_out,
            address_out         => address_out
        );

    -- Clock generation for clk_in1 (100 MHz)
    clk_in1_process : process
    begin
        clk_in1 <= '0';
        wait for clk_in1_period / 2;
        clk_in1 <= '1';
        wait for clk_in1_period / 2;
    end process;

    -- Clock generation for clk_vga (25.175 MHz)
    clk_vga_process : process
    begin
        clk_vga <= '0';
        wait for clk_vga_period / 2;
        clk_vga <= '1';
        wait for clk_vga_period / 2;
    end process;

    -- Clock generation for clk_interpolation (6.3 MHz)
    clk_interpolation_process : process
    begin
        clk_interpolation <= '0';
        wait for clk_interpolation_period / 2;
        clk_interpolation <= '1';
        wait for clk_interpolation_period / 2;
    end process;

    -- Stimulus process to provide input to the UUT
    stimulus_process : process
    begin
        -- Provide sample pixel data
        pixel_in <= "000000000001"; -- Pixel value 1
        wait for clk_vga_period;
        pixel_in <= "000000000010"; -- Pixel value 2
        wait for clk_vga_period;
        pixel_in <= "000000000011"; -- Pixel value 3
        wait for clk_vga_period;
        pixel_in <= "000000000100"; -- Pixel value 4
        wait for clk_vga_period;

        -- Continue providing pixels
        pixel_in <= "000000000101"; -- Pixel value 5
        wait for clk_vga_period;
        pixel_in <= "000000000110"; -- Pixel value 6
        wait for clk_vga_period;
        pixel_in <= "000000000111"; -- Pixel value 7
        wait for clk_vga_period;
        pixel_in <= "000000001000"; -- Pixel value 8
        wait for clk_vga_period;

        -- Add a wait to observe the results
        wait for 1 us;

        -- End simulation
        wait;
    end process;

end Behavioral;