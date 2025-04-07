----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2025 11:08:15 AM
-- Design Name: 
-- Module Name: TOP_LEVEL - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_LEVEL is
  Port ( 
  
        CLK : in STD_LOGIC;
        CAM_D : in STD_LOGIC_VECTOR(7 downto 0);
        CAM_HREF : in STD_LOGIC;
        CAM_VSYNC : in STD_LOGIC;
        CAM_PCLK : in STD_LOGIC;
        VGA_R : out STD_LOGIC_VECTOR(3 downto 0);
        VGA_G : out STD_LOGIC_VECTOR(3 downto 0);
        VGA_B : out STD_LOGIC_VECTOR(3 downto 0);
        VGA_HS : out STD_LOGIC;
        VGA_VS : out STD_LOGIC
  
  );
end TOP_LEVEL;

architecture Behavioral of TOP_LEVEL is

    -- Signals for clock generation
    signal CLK148_5 : STD_LOGIC;
    signal reset : STD_LOGIC := '0';
    signal locked : STD_LOGIC;

    -- Signals for camera interface
    signal pix_data : STD_LOGIC_VECTOR(7 downto 0);
    signal pix_clk : STD_LOGIC;
    signal href : STD_LOGIC;
    signal vsync : STD_LOGIC;

    -- Signals for frame buffer
    signal frame_addr : STD_LOGIC_VECTOR(18 downto 0);
    signal frame_data : STD_LOGIC_VECTOR(11 downto 0);
    
    component clk_wiz_0
        port (
            clk_in1 : in STD_LOGIC;
            clk_out1 : out STD_LOGIC;
            reset : in STD_LOGIC;
            locked : out STD_LOGIC
        );
    end component;

    component camera_interface is
        Port (
            CAM_D : in STD_LOGIC_VECTOR(7 downto 0);
            CAM_HREF : in STD_LOGIC;
            CAM_VSYNC : in STD_LOGIC;
            CAM_PCLK : in STD_LOGIC;
            PIX_DATA : out STD_LOGIC_VECTOR(7 downto 0);
            PIX_CLK : out STD_LOGIC;
            HREF : out STD_LOGIC;
            VSYNC : out STD_LOGIC
        );
    end component;

    component frame_buffer is
        Port (
            CLK : in STD_LOGIC;
            PIX_DATA : in STD_LOGIC_VECTOR(7 downto 0);
            PIX_CLK : in STD_LOGIC;
            HREF : in STD_LOGIC;
            VSYNC : in STD_LOGIC;
            FRAME_ADDR : out STD_LOGIC_VECTOR(18 downto 0);
            FRAME_DATA : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

    component VGA_CONTROLLER is
        Port (
            CLK : in STD_LOGIC;
            FRAME_ADDR : in STD_LOGIC_VECTOR(18 downto 0);
            FRAME_DATA : in STD_LOGIC_VECTOR(11 downto 0);
            VGA_R : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_G : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_B : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_HS : out STD_LOGIC;
            VGA_VS : out STD_LOGIC
        );
    end component;


begin

    -- Clock generation
    clk_gen : clk_wiz_0
        port map (
            clk_in1 => CLK,
            clk_out1 => CLK148_5,
            reset => reset,
            locked => locked
        );

    -- Camera interface
    cam_if : camera_interface
        port map (
            CAM_D => CAM_D,
            CAM_HREF => CAM_HREF,
            CAM_VSYNC => CAM_VSYNC,
            CAM_PCLK => CAM_PCLK,
            PIX_DATA => pix_data,
            PIX_CLK => pix_clk,
            HREF => href,
            VSYNC => vsync
        );

    -- Frame buffer
    fb : frame_buffer
        port map (
            CLK => CLK148_5,
            PIX_DATA => pix_data,
            PIX_CLK => pix_clk,
            HREF => href,
            VSYNC => vsync,
            FRAME_ADDR => frame_addr,
            FRAME_DATA => frame_data
        );

    -- VGA controller
    vga_ctrl : VGA_CONTROLLER
        port map (
            CLK => CLK148_5,
            FRAME_ADDR => frame_addr,
            FRAME_DATA => frame_data,
            VGA_R => VGA_R,
            VGA_G => VGA_G,
            VGA_B => VGA_B,
            VGA_HS => VGA_HS,
            VGA_VS => VGA_VS
        );

end Behavioral;
