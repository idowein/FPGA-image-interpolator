library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

entity VGA_TOP is
    Port (
        pix_clk      : in  STD_LOGIC;
        cntl         : in  STD_LOGIC;
        zoom_x2      : in  STD_LOGIC;
        frame_fix    : in  STD_LOGIC_VECTOR (11 downto 0);
        bili_cntl    : in  STD_LOGIC;
        VGA_H_sync   : out STD_LOGIC;
        vga_V_sync   : out STD_LOGIC;
        vga_red      : out STD_LOGIC_VECTOR (3 downto 0);
        vga_blue     : out STD_LOGIC_VECTOR (3 downto 0);
        vga_green    : out STD_LOGIC_VECTOR (3 downto 0);
        frame_adress : out STD_LOGIC_VECTOR (18 downto 0)
    );
end VGA_TOP;

architecture Behavioral of VGA_TOP is
   
     -- constant
    signal H_POSITIVE: std_logic := '1'; -- Indicates positive polarity for horizontal sync signal
    signal V_POSITIVE: std_logic := '1'; -- Indicates positive polarity for vertical sync signal

    signal h_cnt : std_logic_vector(11 downto 0);
    signal v_cnt : std_logic_vector(11 downto 0);
    signal h_sync, v_sync, blank : std_logic;
    signal fr_address : std_logic_vector(18 downto 0);
    
    -- colors
    signal cnt_bg:     std_logic_vector(28 downto 0) := (others => '0'); -- Background color counter for color cycling
    signal cnt_bg_h:   std_logic_vector(11 downto 0); -- Horizontal component of the background color counter
    signal cnt_bg_v:   std_logic_vector(11 downto 0); -- Vertical component of the background color counter
    signal bg_red:     std_logic_vector(3 downto  0); -- Red component of the background color
    signal bg_blue:    std_logic_vector(3 downto  0); -- Blue component of the background color
    signal bg_green:   std_logic_vector(3 downto  0); -- Green component of the background color
    signal bg_red_d:   std_logic_vector(3 downto  0); -- Delayed red component for display stabilization
    signal bg_blue_d:  std_logic_vector(3 downto  0); -- Delayed blue component for display stabilization
    signal bg_green_d: std_logic_vector(3 downto  0); -- Delayed green component for display stabilization

begin
    -- Instantiate VGA Timing Block
    vga_timing_inst : entity work.VGA_TX
        port map (
            pix_clk      => pix_clk,
            h_cnt        => h_cnt,
            v_cnt        => v_cnt,
            h_sync       => h_sync,
            v_sync       => v_sync,
            blank        => blank
        );

    -- Instantiate Pixel Renderer Block
    pixel_renderer_inst : entity work.PIXEL_RENDER
        port map (
            pix_clk      => pix_clk,
            h_cnt        => h_cnt,
            v_cnt        => v_cnt,
            blank        => blank,
            zoom_x2      => zoom_x2,
            bili_cntl    => bili_cntl,
            frame_fix    => frame_fix,
            fr_address   => frame_adress,
            vga_red      => vga_red,
            vga_blue     => vga_blue,
            vga_green    => vga_green,
            cntl         => cntl
        );
        
    -- Sync Outputs
    VGA_H_sync <= h_sync;
    vga_V_sync <= v_sync;
end Behavioral;