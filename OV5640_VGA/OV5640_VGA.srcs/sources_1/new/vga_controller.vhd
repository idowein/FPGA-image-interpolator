library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_controller is
    Port (
        clk              : in  std_logic;                      -- Input clock
        reset            : in  std_logic;                      -- Reset signal
        frame_buffer_read : out std_logic_vector(18 downto 0); -- Frame buffer read address
        rgb_data         : in  std_logic_vector(11 downto 0);  -- Frame buffer output data
        hsync            : out std_logic;                      -- Horizontal sync
        vsync            : out std_logic;                      -- Vertical sync
        rgb_out          : out std_logic_vector(11 downto 0)   -- VGA RGB data
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
    signal d_h, d_v       : std_logic := '0';                   -- Visible area signals

    signal clk25_175      : std_logic;                          -- 25.175 MHz clock for VGA
    signal locked         : std_logic;                          -- Locked signal from clock generator

    component clk_wiz_0
        port
         (-- Clock in ports
          -- Clock out ports
          clk_25mhz          : out    std_logic;
          clk_24mhz          : out    std_logic;
          -- Status and control signals
          reset             : in     std_logic;
          locked            : out    std_logic;
          clk_in1           : in     std_logic
         );
    end component;

begin
    -------------------------------------------------------------------
    -- MMCM CONFIGURATION TO GENERATE 25.175 MHZ CLOCK
    -------------------------------------------------------------------
    MMCM_CONF : clk_wiz_0
       port map ( 
      -- Clock out ports  
       clk_25mhz => clk25_175,
       clk_24mhz => OPEN,
      -- Status and control signals                
       reset => reset,
       locked => locked,
       -- Clock in ports
       clk_in1 => CLK
     );

    -------------------------------------------------------------------
    -- HORIZONTAL AND VERTICAL COUNTERS
    -------------------------------------------------------------------
    process(clk25_175)
    begin
        if rising_edge(clk25_175) then
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
    end process;

    -------------------------------------------------------------------
    -- VISIBLE AREA DETECTION
    -------------------------------------------------------------------
    d_h <= '1' when h_count < H_DISPLAY else '0';               -- Horizontal visible area
    d_v <= '1' when v_count < V_DISPLAY else '0';               -- Vertical visible area

    -------------------------------------------------------------------
    -- FRAME BUFFER ADDRESS CALCULATION
    -------------------------------------------------------------------
    process(d_h, d_v, h_count, v_count)
    begin
        if d_h = '1' and d_v = '1' then
            pixel_address <= v_count * H_DISPLAY + h_count;     -- Calculate pixel address
        else
            pixel_address <= 0;                                 -- Outside visible area
        end if;
    end process;
    frame_buffer_read <= std_logic_vector(to_unsigned(pixel_address, frame_buffer_read'length));

    -------------------------------------------------------------------
    -- SYNC SIGNAL GENERATION
    -------------------------------------------------------------------
    hsync <= '0' when (h_count >= H_DISPLAY + H_FRONT and h_count < H_DISPLAY + H_FRONT + H_SYNC) else '1';
    vsync <= '0' when (v_count >= V_DISPLAY + V_FRONT and v_count < V_DISPLAY + V_FRONT + V_SYNC) else '1';

    -------------------------------------------------------------------
    -- RGB OUTPUT
    -------------------------------------------------------------------
    rgb_out <= rgb_data when (d_h = '1' and d_v = '1') else (others => '0');

end Behavioral;