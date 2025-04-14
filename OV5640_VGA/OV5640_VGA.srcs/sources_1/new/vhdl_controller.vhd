library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_controller is
    Port (
        clk               : in  std_logic;                         -- System clock
        hsync             : out std_logic;                        -- Horizontal sync signal
        vsync             : out std_logic;                        -- Vertical sync signal
        pixel_clk         : in  std_logic;                        -- Pixel clock (e.g., 25 MHz for 640x480)
        rgb_data          : out std_logic_vector(7 downto 0);     -- RGB data (8-bit: 3 bits for R, 3 bits for G, 2 bits for B)
        frame_buffer_read : out std_logic_vector(19 downto 0)     -- Frame buffer address for reading pixel data
    );
end vga_controller;

architecture Behavioral of vga_controller is

    -- VGA Parameters for 640x480 @ 60Hz
    constant H_DISPLAY    : integer := 640;     -- Horizontal display area
    constant H_FRONT_PORCH: integer := 16;      -- Front porch (pixels)
    constant H_SYNC_PULSE : integer := 96;      -- Sync pulse (pixels)
    constant H_BACK_PORCH : integer := 48;      -- Back porch (pixels)
    constant H_TOTAL      : integer := H_DISPLAY + H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH;

    constant V_DISPLAY    : integer := 480;     -- Vertical display area
    constant V_FRONT_PORCH: integer := 10;      -- Front porch (lines)
    constant V_SYNC_PULSE : integer := 2;       -- Sync pulse (lines)
    constant V_BACK_PORCH : integer := 33;      -- Back porch (lines)
    constant V_TOTAL      : integer := V_DISPLAY + V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH;

    -- Horizontal and Vertical Counters
    signal h_count : integer range 0 to H_TOTAL - 1 := 0;
    signal v_count : integer range 0 to V_TOTAL - 1 := 0;

    -- Pixel and Line Enable Signals
    signal h_active : std_logic := '0'; -- High during active horizontal display area
    signal v_active : std_logic := '0'; -- High during active vertical display area

    -- Frame buffer address
    signal pixel_address : integer range 0 to (H_DISPLAY * V_DISPLAY) - 1 := 0;

begin

    -- Horizontal Sync Generator
    process(pixel_clk)
    begin
        if rising_edge(pixel_clk) then
            if h_count = H_TOTAL - 1 then
                h_count <= 0; -- Reset horizontal counter at the end of the line
                if v_count = V_TOTAL - 1 then
                    v_count <= 0; -- Reset vertical counter at the end of the frame
                else
                    v_count <= v_count + 1;
                end if;
            else
                h_count <= h_count + 1;
            end if;
        end if;
    end process;

    -- Horizontal Sync Signal
    hsync <= '0' when (h_count >= H_DISPLAY + H_FRONT_PORCH and h_count < H_DISPLAY + H_FRONT_PORCH + H_SYNC_PULSE) else '1';

    -- Vertical Sync Signal
    vsync <= '0' when (v_count >= V_DISPLAY + V_FRONT_PORCH and v_count < V_DISPLAY + V_FRONT_PORCH + V_SYNC_PULSE) else '1';

    -- Active Pixel Area Signals
    h_active <= '1' when (h_count < H_DISPLAY) else '0';
    v_active <= '1' when (v_count < V_DISPLAY) else '0';

    -- Frame Buffer Address Generation
    process(pixel_clk)
    begin
        if rising_edge(pixel_clk) then
            if h_active = '1' and v_active = '1' then
                pixel_address <= v_count * H_DISPLAY + h_count; -- Calculate pixel address based on current row and column
            else
                pixel_address <= 0; -- Reset address when outside active area
            end if;
        end if;
    end process;

    -- Output Address for Frame Buffer
    frame_buffer_read <= std_logic_vector(to_unsigned(pixel_address, frame_buffer_read'length));

    -- Dummy RGB Data for Testing
    rgb_data <= "11100000" when (h_active = '1' and v_active = '1') else "00000000"; -- Red screen for active area, black otherwise

end Behavioral;