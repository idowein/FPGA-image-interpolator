-- VGA Controller for 640x480 resolution

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VGA_Controller is
    Port (
        CLK        : in  STD_LOGIC;                      -- System clock
        RESET      : in  STD_LOGIC;                      -- Reset signal
        HSYNC      : out STD_LOGIC;                      -- Horizontal sync signal
        VSYNC      : out STD_LOGIC;                      -- Vertical sync signal
        VGA_R      : out STD_LOGIC_VECTOR(3 downto 0);   -- Red channel
        VGA_G      : out STD_LOGIC_VECTOR(3 downto 0);   -- Green channel
        VGA_B      : out STD_LOGIC_VECTOR(3 downto 0);   -- Blue channel
        READ_ADDR  : out INTEGER;                        -- Read address for frame buffer
        PIXEL_DATA : in  STD_LOGIC_VECTOR(7 downto 0)    -- Pixel data from frame buffer
    );
end VGA_Controller;

architecture Behavioral of VGA_Controller is

    -- VGA Timing Constants for 640x480 @ 60Hz
    constant H_ACTIVE    : INTEGER := 640;  -- Active horizontal pixels
    constant H_FRONT     : INTEGER := 16;   -- Horizontal front porch
    constant H_SYNC      : INTEGER := 96;   -- Horizontal sync pulse
    constant H_BACK      : INTEGER := 48;   -- Horizontal back porch
    constant H_TOTAL     : INTEGER := H_ACTIVE + H_FRONT + H_SYNC + H_BACK;

    constant V_ACTIVE    : INTEGER := 480;  -- Active vertical lines
    constant V_FRONT     : INTEGER := 10;   -- Vertical front porch
    constant V_SYNC      : INTEGER := 2;    -- Vertical sync pulse
    constant V_BACK      : INTEGER := 33;   -- Vertical back porch
    constant V_TOTAL     : INTEGER := V_ACTIVE + V_FRONT + V_SYNC + V_BACK;

    -- Counters
    signal h_counter : INTEGER range 0 to H_TOTAL - 1 := 0;
    signal v_counter : INTEGER range 0 to V_TOTAL - 1 := 0;

    -- Pixel Validity Signal
    signal pixel_valid : STD_LOGIC := '0';

begin

    -- Horizontal and Vertical Counters
    process(CLK, RESET)
    begin
        if RESET = '1' then
            h_counter <= 0;
            v_counter <= 0;
        elsif rising_edge(CLK) then
            if h_counter = H_TOTAL - 1 then
                h_counter <= 0;
                if v_counter = V_TOTAL - 1 then
                    v_counter <= 0;
                else
                    v_counter <= v_counter + 1;
                end if;
            else
                h_counter <= h_counter + 1;
            end if;
        end if;
    end process;

    -- Generate Sync Signals
    process(CLK)
    begin
        if rising_edge(CLK) then
            -- Generate HSYNC
            if (h_counter >= H_ACTIVE + H_FRONT) and (h_counter < H_ACTIVE + H_FRONT + H_SYNC) then
                HSYNC <= '0'; -- Active low
            else
                HSYNC <= '1';
            end if;

            -- Generate VSYNC
            if (v_counter >= V_ACTIVE + V_FRONT) and (v_counter < V_ACTIVE + V_FRONT + V_SYNC) then
                VSYNC <= '0'; -- Active low
            else
                VSYNC <= '1';
            end if;
        end if;
    end process;

    -- Pixel Validity
    pixel_valid <= '1' when (h_counter < H_ACTIVE) and (v_counter < V_ACTIVE) else '0';

    -- Read Address Calculation
    READ_ADDR <= v_counter * H_ACTIVE + h_counter;

    -- Map Pixel Data to VGA Signals
    VGA_R <= PIXEL_DATA(7 downto 5); -- Use higher bits for red
    VGA_G <= PIXEL_DATA(4 downto 2); -- Use middle bits for green
    VGA_B <= PIXEL_DATA(1 downto 0); -- Use lower bits for blue

end Behavioral;