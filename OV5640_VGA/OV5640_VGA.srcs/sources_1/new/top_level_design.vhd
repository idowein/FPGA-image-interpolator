library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

entity top_level_design is
    Port (
        -- External Inputs
        clk_in       : in  STD_LOGIC;   -- 100 MHz input clock
        reset        : in  STD_LOGIC;   -- Reset signal (active high)
        pmod_d       : in  STD_LOGIC_VECTOR(9 downto 0); -- Camera pixel data
        pmod_href    : in  STD_LOGIC;   -- Camera horizontal reference
        pmod_vsync   : in  STD_LOGIC;   -- Camera vertical sync
        pmod_pclk    : in  STD_LOGIC;   -- Camera pixel clock

        -- PMOD-CAMERA Connections
        pmod_scl     : out STD_LOGIC;   -- I2C clock for camera
        pmod_sda     : inout STD_LOGIC; -- I2C data for camera
        pmod_reset_n : out STD_LOGIC;   -- Camera reset (active low)
        pmod_pwdn    : out STD_LOGIC;   -- Camera power-down signal
        pmod_xclk    : out STD_LOGIC;   -- Camera external clock (XCLK)

        -- VGA Outputs
        vga_hsync    : out STD_LOGIC;   -- VGA horizontal sync
        vga_vsync    : out STD_LOGIC;   -- VGA vertical sync
        vga_r        : out STD_LOGIC_VECTOR(3 downto 0); -- VGA red channel
        vga_g        : out STD_LOGIC_VECTOR(3 downto 0); -- VGA green channel
        vga_b        : out STD_LOGIC_VECTOR(3 downto 0)  -- VGA blue channel
    );
end top_level_design;

architecture Behavioral of top_level_design is

    -- Clocking Wizard Signals
    signal clk_24mhz  : STD_LOGIC; -- 24 MHz clock for camera (XCLK)
    signal clk_25mhz  : STD_LOGIC; -- 25 MHz clock for VGA
    signal clk_locked : STD_LOGIC; -- Clocking Wizard locked signal

    -- Frame Buffer Signals
    signal fb_addr_write : STD_LOGIC_VECTOR(18 downto 0); -- Write address
    signal fb_addr_read  : STD_LOGIC_VECTOR(18 downto 0); -- Read address
    signal fb_din        : STD_LOGIC_VECTOR(11 downto 0); -- Data to write
    signal fb_dout       : STD_LOGIC_VECTOR(11 downto 0); -- Data read
    signal fb_we         : STD_LOGIC;                   -- Write enable

    -- OV5640 Controller Signals
    signal config_done : STD_LOGIC; -- Camera configuration complete

    -- Pixel Data Capture Signals
    signal pixel_valid : STD_LOGIC;
    signal pixel_out   : STD_LOGIC_VECTOR(11 downto 0);

    -- VGA Controller Signals
    signal vga_rgb_data : STD_LOGIC_VECTOR(11 downto 0);
    
    -- MMCM signals
    signal locked : STD_LOGIC;
    
    -- BRAM (Frame Buffer) signals
    signal wea : STD_LOGIC;
    signal addra : STD_LOGIC_VECTOR(18 downto 0);
    signal dina : STD_LOGIC_VECTOR(11 downto 0);
    signal addrb : STD_LOGIC_VECTOR(18 downto 0);
    signal doutb : STD_LOGIC_VECTOR(11 downto 0);


    -- MMCM component
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
    
    -- BRAM (Frame Buffer component)
    COMPONENT frame_buffer
      PORT (
        clka : IN STD_LOGIC;
        wea : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        clkb : IN STD_LOGIC;
        addrb : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
        doutb : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
      );
    END COMPONENT;

begin

    -- Instantiate Clocking Wizard
    your_instance_name : clk_wiz_0
       port map ( 
          -- Clock out ports  
           clk_25mhz => clk_25mhz,
           clk_24mhz => clk_24mhz,
          -- Status and control signals                
           reset => reset,
           locked => locked,
           -- Clock in ports
           clk_in1 => clk_in -- The input of the MMCM is the 100 MHZ from the FPGA
     );

    -- Instantiate OV5640 Controller
    ov5640_ctrl_inst : entity work.ov5640_controller
        port map (
            clk             => clk_locked,
            resend          => reset,
            config_finished => config_done,
            i2c_scl         => pmod_scl,
            i2c_sda         => pmod_sda,
            reset_n         => pmod_reset_n,
            pwdn            => pmod_pwdn,
            xclk            => clk_24mhz  -- 24 MHz clock for camera
        );

    -- Instantiate Pixel Data Capture Module
    pixel_data_capture_inst : entity work.pixel_data_capture
        port map (
            pclk       => pmod_pclk,
            href       => pmod_href,
            vsync      => pmod_vsync,
            data       => pmod_d,
            addr_write => fb_addr_write,
            dina       => fb_din,
            wea        => fb_we
        );

    -- Instantiate Frame Buffer (BRAM)
    frame_buhher_inst : frame_buffer
      PORT MAP (
            clka => clk_in,
            wea => wea,
            addra => addra,
            dina => dina,
            clkb => clk_in,
            addrb => addrb,
            doutb => doutb
      );

    -- Instantiate VGA Controller
    vga_ctrl_inst : entity work.vga_controller
        port map (
            clk               => clk_25mhz,
            reset             => reset,
            frame_buffer_read => fb_addr_read,
            rgb_data         => fb_dout,
            hsync            => vga_hsync,
            vsync            => vga_vsync,
            rgb_out          => vga_rgb_data
        );

    -- Map VGA RGB Data
    vga_r <= vga_rgb_data(11 downto 8); -- Red (3 bits)
    vga_g <= vga_rgb_data(7 downto 4); -- Green (3 bits)
    vga_b <= vga_rgb_data(3 downto 0); -- Blue (2 bits)

end Behavioral;