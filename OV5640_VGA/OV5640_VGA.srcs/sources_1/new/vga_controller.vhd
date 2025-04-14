library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_controller is
    Port (
        pixel_clk         : in  std_logic;                      -- Pixel clock
        frame_buffer_read : out std_logic_vector(18 downto 0);  -- Frame buffer read address
        rgb_data          : in  std_logic_vector(11 downto 0);  -- Frame buffer output data
        hsync             : out std_logic;                      -- Horizontal sync
        vsync             : out std_logic;                      -- Vertical sync
        rgb_out           : out std_logic_vector(7 downto 0)    -- VGA RGB data
    );
end vga_controller;

architecture Behavioral of vga_controller is
    -- VGA Timing Constants
    constant H_DISPLAY    : integer := 640;
    constant H_TOTAL      : integer := 800;
    constant V_DISPLAY    : integer := 480;
    constant V_TOTAL      : integer := 525;

    signal h_count        : integer range 0 to H_TOTAL - 1 := 0;
    signal v_count        : integer range 0 to V_TOTAL - 1 := 0;
    signal pixel_address  : integer := 0;

begin
    process(pixel_clk)
    begin
        if rising_edge(pixel_clk) then
            if h_count = H_TOTAL - 1 then
                h_count <= 0;
                if v_count = V_TOTAL - 1 then
                    v_count <= 0;
                else
                    v_count <= v_count + 1;
                end if;
            else
                h_count <= h_count + 1;
            end if;
        end if;

        if h_count < H_DISPLAY and v_count < V_DISPLAY then
            pixel_address <= v_count * H_DISPLAY + h_count;
        else
            pixel_address <= 0;
        end if;
    end process;

    frame_buffer_read <= std_logic_vector(to_unsigned(pixel_address, frame_buffer_read'length));
    rgb_out <= rgb_data(11 downto 4);  -- Map 12-bit RGB to 8-bit output
    hsync <= '0' when h_count >= 656 and h_count < 752 else '1';
    vsync <= '0' when v_count >= 490 and v_count < 492 else '1';
end Behavioral;