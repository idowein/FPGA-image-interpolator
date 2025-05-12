----------------------------------------------------------------------------------
-- Testbench for ovo_7670_capture
-- Company: 
-- Engineers : Ido Weinstock <ido.weinstock@gmail.com> (23/04/2025)
--             Dvir Hershkovitz <dvirhersh@gmail.com>
--
-- Create Date: 23.04.2025
-- Design Name: 
-- Module Name: tb_ovo_7670_capture - Testbench
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for verifying the functionality of the ovo_7670_capture module.
--
-- Dependencies: ovo_7670_capture.vhd
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_ovo_7670_capture IS
END tb_ovo_7670_capture;

ARCHITECTURE behavior OF tb_ovo_7670_capture IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT ovo_7670_caputre
    PORT(
        pclk            : IN  std_logic;
        camera_v_sync   : IN  std_logic;
        camera_h_ref    : IN  std_logic;
        zoom_x2         : IN  std_logic;
        din             : IN  std_logic_vector(7 downto 0);
        addr            : OUT std_logic_vector(18 downto 0);
        dout            : OUT std_logic_vector(11 downto 0);
        wr_en           : OUT std_logic
    );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL pclk            : std_logic := '0';
    SIGNAL camera_v_sync   : std_logic := '0';
    SIGNAL camera_h_ref    : std_logic := '0';
    SIGNAL zoom_x2         : std_logic := '0';
    SIGNAL din             : std_logic_vector(7 downto 0) := (OTHERS => '0');
    SIGNAL addr            : std_logic_vector(18 downto 0);
    SIGNAL dout            : std_logic_vector(11 downto 0);
    SIGNAL wr_en           : std_logic;

    -- Clock period definitions
    CONSTANT pclk_period : time := 40 ns; -- 25 MHz clock (1/25 MHz = 40 ns)

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: ovo_7670_caputre
    PORT MAP (
        pclk           => pclk,
        camera_v_sync  => camera_v_sync,
        camera_h_ref   => camera_h_ref,
        zoom_x2        => zoom_x2,
        din            => din,
        addr           => addr,
        dout           => dout,
        wr_en          => wr_en
    );

    -- Clock process definitions
    pclk_process :process
    begin
        pclk <= '0';
        wait for pclk_period/2;
        pclk <= '1';
        wait for pclk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Wait for reset
        wait for 100 ns;
        
        -- Simulate camera_v_sync (Vertical Sync Signal)
        camera_v_sync <= '1';
        wait for 1 * pclk_period;
        camera_v_sync <= '0';

        -- Generate camera_h_ref (Horizontal Sync Signal)
        for i in 0 to 10 loop
            camera_h_ref <= '1';
            din <= std_logic_vector(to_unsigned(i, 8)); -- Simulate input pixel data
            wait for 2 * pclk_period;
            camera_h_ref <= '0';
            wait for 2 * pclk_period;
        end loop;

        -- Enable zoom_x2 and repeat
        zoom_x2 <= '1';
        for i in 0 to 10 loop
            camera_h_ref <= '1';
            din <= std_logic_vector(to_unsigned(i + 10, 8)); -- Simulate input pixel data
            wait for 2 * pclk_period;
            camera_h_ref <= '1';
            wait for 2 * pclk_period;
        end loop;

        -- End of simulation
        wait;
    end process;

END;