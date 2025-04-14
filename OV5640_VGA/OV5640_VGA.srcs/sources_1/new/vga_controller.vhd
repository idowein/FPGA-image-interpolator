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
        rgb_out           : out std_logic_vector(11 downto 0)   -- VGA RGB data
    );
end vga_controller;

architecture Behavioral of vga_controller is
    -- VGA Timing Constants (640x480 @ 60Hz)
    constant H_DISPLAY    : integer := 640;                     -- Horizontal visible area
    constant H_FRONT      : integer := 16;                      -- Horizontal front porch
    constant H_SYNC       : integer := 96;                      -- Horizontal sync pulse
    constant H_BACK       : integer := 48;                      -- Horizontal back porch
    constant H_TOTAL      : integer := H_DISPLAY + H_FRONT + H_SYNC + H_BACK; -- Total horizontal time

    constant V_DISPLAY    : integer := 480;                     -- Vertical visible area
    constant V_FRONT      : integer := 10;                      -- Vertical front porch
    constant V_SYNC       : integer := 2;                       -- Vertical sync pulse
    constant V_BACK       : integer := 33;                      -- Vertical back porch
    constant V_TOTAL      : integer := V_DISPLAY + V_FRONT + V_SYNC + V_BACK; -- Total vertical time

    signal h_count        : integer range 0 to H_TOTAL - 1 := 0; -- Horizontal pixel counter
    signal v_count        : integer range 0 to V_TOTAL - 1 := 0; -- Vertical line counter
    signal pixel_address  : integer := 0;                       -- Frame buffer pixel address

begin
    -- Horizontal and Vertical Counters
    process(pixel_clk)
    begin
        if rising_edge(pixel_clk) then
            if h_count = H_TOTAL - 1 then
                h_count <= 0;                                   -- Reset horizontal counter
                if v_count = V_TOTAL - 1 then
                    v_count <= 0;                               -- Reset vertical counter
                else
                    v_count <= v_count + 1;                     -- Increment vertical counter
                end if;
            else
                h_count <= h_count + 1;                         -- Increment horizontal counter
            end if;
        end if;

        -- Calculate Frame Buffer Address
        if h_count < H_DISPLAY and v_count < V_DISPLAY then
            pixel_address <= v_count * H_DISPLAY + h_count;     -- Visible area address
        else
            pixel_address <= 0;                                 -- Outside visible area
        end if;
    end process;

    -- Map Frame Buffer Address to Output
    frame_buffer_read <= std_logic_vector(to_unsigned(pixel_address, frame_buffer_read'length));

    -- Generate RGB Output (Direct Pass-Through)
    rgb_out <= rgb_data(11 downto 0);

    -- Generate Horizontal Sync Signal
    hsync <= '0' when (h_count >= H_DISPLAY + H_FRONT and h_count < H_DISPLAY + H_FRONT + H_SYNC) else '1';

    -- Generate Vertical Sync Signal
    vsync <= '0' when (v_count >= V_DISPLAY + V_FRONT and v_count < V_DISPLAY + V_FRONT + V_SYNC) else '1';

end Behavioral;