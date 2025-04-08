----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ido Weinstock
--
-- Create Date: 2025-04-07
-- Module Name: VGA_CAMERA_TOP - Top-Level Design
-- Description: Integrates the CAMERA_INTERFACE, FRAME_BUFFER, and VGA timing logic
--              to display a camera feed on a VGA monitor.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VGA_CONTROLLER is
    Port (
        CLK         : in  std_logic;
        SW          : in  std_logic_vector(15 downto 0);
        BTN         : in  std_logic_vector(4 downto 0);
        LED         : out std_logic_vector(15 downto 0);
        VGA_HS      : out std_logic;
        VGA_VS      : out std_logic;
        VGA_R       : out std_logic_vector(3 downto 0);
        VGA_G       : out std_logic_vector(3 downto 0);
        VGA_B       : out std_logic_vector(3 downto 0);
        CAM_D       : in  std_logic_vector(7 downto 0);
        CAM_HREF    : in  std_logic;
        CAM_VSYNC   : in  std_logic;
        CAM_PCLK    : in  std_logic
    );
end VGA_CONTROLLER;

architecture Behavioral of VGA_CONTROLLER is

    -- Clock wizard to generate required clock frequency (148.5 MHz)
    component clk_wiz_0 is
        port(
            clk_in1  : in  std_logic;
            clk_out1 : out std_logic;
            reset    : in  std_logic;
            locked   : out std_logic
        );
    end component;

    -- Camera interface: captures raw camera signals and generates PIX signals.
    component CAMERA_INTERFACE is
        port(
            CAM_D     : in  std_logic_vector(7 downto 0);
            CAM_HREF  : in  std_logic;
            CAM_VSYNC : in  std_logic;
            CAM_PCLK  : in  std_logic;
            PIX_DATA  : out std_logic_vector(7 downto 0);
            PIX_CLK   : out std_logic;
            HREF      : out std_logic;
            VSYNC     : out std_logic
        );
    end component;

    -- Frame buffer: stores camera pixel data.
    -- NOTE: This module should be updated so that FRAME_ADDR is an input to allow reading.
    component FRAME_BUFFER is
        port(
            CLK         : in  std_logic;
            PIX_DATA    : in  std_logic_vector(7 downto 0);
            PIX_CLK     : in  std_logic;
            HREF        : in  std_logic;
            VSYNC       : in  std_logic;
            FRAME_ADDR  : in  std_logic_vector(18 downto 0); -- Changed to input for reading
            FRAME_DATA  : out std_logic_vector(11 downto 0)
        );
    end component;

    -- VGA Timing Constants (for 1920x1080 @ 60Hz)
    constant H_VISIBLE : integer := 1920;
    constant H_FRONT   : integer := 88;
    constant H_SYNC    : integer := 44;
    constant H_BACK    : integer := 148;
    constant H_TOTAL   : integer := H_VISIBLE + H_FRONT + H_SYNC + H_BACK;

    constant V_VISIBLE : integer := 1080;
    constant V_FRONT   : integer := 4;
    constant V_SYNC    : integer := 5;
    constant V_BACK    : integer := 36;
    constant V_TOTAL   : integer := V_VISIBLE + V_FRONT + V_SYNC + V_BACK;

    signal CLK148_5      : std_logic;
    signal reset_sig     : std_logic := '0';
    signal locked_sig    : std_logic;

    signal H_CNT         : integer range 0 to H_TOTAL - 1 := 0;
    signal V_CNT         : integer range 0 to V_TOTAL - 1 := 0;
    signal DISP_ACTIVE   : std_logic;

    -- Signals between Camera Interface and Frame Buffer
    signal PIX_DATA      : std_logic_vector(7 downto 0);
    signal PIX_CLK       : std_logic;
    signal INT_HREF      : std_logic;
    signal INT_VSYNC     : std_logic;

    -- Frame buffer read signals
    signal FRAME_ADDR    : std_logic_vector(18 downto 0);
    signal FRAME_DATA    : std_logic_vector(11 downto 0);

begin

    LED <= SW;

    -------------------------------------------------------------------
    -- Clock Generation (148.5 MHz)
    -------------------------------------------------------------------
    CLK_GEN: clk_wiz_0
        port map(
            clk_in1  => CLK,
            clk_out1 => CLK148_5,
            reset    => reset_sig,
            locked   => locked_sig
        );

    -------------------------------------------------------------------
    -- Camera Interface instantiation
    -------------------------------------------------------------------
    CAM_IF: CAMERA_INTERFACE
        port map(
            CAM_D     => CAM_D,
            CAM_HREF  => CAM_HREF,
            CAM_VSYNC => CAM_VSYNC,
            CAM_PCLK  => CAM_PCLK,
            PIX_DATA  => PIX_DATA,
            PIX_CLK   => PIX_CLK,
            HREF      => INT_HREF,
            VSYNC     => INT_VSYNC
        );

    -------------------------------------------------------------------
    -- Frame Buffer instantiation
    -------------------------------------------------------------------
    FB: FRAME_BUFFER
        port map(
            CLK         => CLK148_5,
            PIX_DATA    => PIX_DATA,
            PIX_CLK     => PIX_CLK,
            HREF        => INT_HREF,
            VSYNC       => INT_VSYNC,
            FRAME_ADDR  => FRAME_ADDR,
            FRAME_DATA  => FRAME_DATA
        );

    -------------------------------------------------------------------
    -- VGA Timing Counters
    -------------------------------------------------------------------
    VGA_TIMING: process(CLK148_5)
    begin
        if rising_edge(CLK148_5) then
            if H_CNT = H_TOTAL - 1 then
                H_CNT <= 0;
                if V_CNT = V_TOTAL - 1 then
                    V_CNT <= 0;
                else
                    V_CNT <= V_CNT + 1;
                end if;
            else
                H_CNT <= H_CNT + 1;
            end if;
        end if;
    end process;

    DISP_ACTIVE <= '1' when (H_CNT < H_VISIBLE and V_CNT < V_VISIBLE) else '0';

    -------------------------------------------------------------------
    -- VGA Sync Generation
    -------------------------------------------------------------------
    VGA_HS <= '0' when (H_CNT >= H_VISIBLE + H_FRONT and H_CNT < H_VISIBLE + H_FRONT + H_SYNC) else '1';
    VGA_VS <= '0' when (V_CNT >= V_VISIBLE + V_FRONT and V_CNT < V_VISIBLE + V_FRONT + V_SYNC) else '1';

    -------------------------------------------------------------------
    -- Frame Buffer Address Generation for VGA Read
    -------------------------------------------------------------------
    -- Compute the address based on current pixel location.
    FRAME_ADDR <= std_logic_vector(to_unsigned(V_CNT * H_VISIBLE + H_CNT, 19));

    -------------------------------------------------------------------
    -- VGA Color Generation: Map Frame Buffer data to VGA outputs.
    -------------------------------------------------------------------
    process(CLK148_5)
    begin
        if rising_edge(CLK148_5) then
            if DISP_ACTIVE = '1' then
                VGA_R <= FRAME_DATA(11 downto 8);
                VGA_G <= FRAME_DATA(7 downto 4);
                VGA_B <= FRAME_DATA(3 downto 0);
            else
                VGA_R <= (others => '0');
                VGA_G <= (others => '0');
                VGA_B <= (others => '0');
            end if;
        end if;
    end process;

end Behavioral;