library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SEVEN_SEG_DISP_UNIT is
    Port (  CLK : in  STD_LOGIC;
           SW  : in  STD_LOGIC_VECTOR (15 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0);  -- Note:  In this design, LED is also used for 7-seg control
           VGA_HS : out STD_LOGIC;
           VGA_VS : out STD_LOGIC;
           VGA_R  : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_G  : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_B  : out STD_LOGIC_VECTOR (3 downto 0)
           );
end SEVEN_SEG_DISP_UNIT;

architecture Behavioral of SEVEN_SEG_DISP_UNIT is

  -- VGA parameters for 1920x1080 @ 60Hz
  constant H_ACTIVE : integer := 1920;  -- Horizontal active pixels
  constant H_FRONT  : integer := 88;    -- Horizontal front porch
  constant H_SYNC   : integer := 44;    -- Horizontal sync pulse
  constant H_BACK   : integer := 148;   -- Horizontal back porch
  constant V_ACTIVE : integer := 1080;  -- Vertical active lines
  constant V_FRONT  : integer := 4;     -- Vertical front porch
  constant V_SYNC   : integer := 5;     -- Vertical sync pulse
  constant V_BACK   : integer := 36;    -- Vertical back porch

  -- Calculate total horizontal and vertical pixels
  constant H_TOTAL  : integer := H_ACTIVE + H_FRONT + H_SYNC + H_BACK;
  constant V_TOTAL  : integer := V_ACTIVE + V_FRONT + V_SYNC + V_BACK;

  -- Clock frequency -  For 1920x1080 @ 60Hz, the clock is 148.5 MHz
  constant CLK_FREQ : integer := 148500000;  -- 148.5 MHz

  --Derived constants
  constant H_PERIOD : integer := CLK_FREQ / (CLK_FREQ / H_TOTAL);  -- Clock cycles per horizontal line
  constant V_PERIOD : integer := H_PERIOD * V_TOTAL;              -- Clock cycles per vertical frame
  
  -- Internal signals
  signal h_count : integer range 0 to H_TOTAL - 1 := 0;
  signal v_count : integer range 0 to V_TOTAL - 1 := 0;
  signal rgb_temp : STD_LOGIC_VECTOR (11 downto 0);  -- Temporary RGB signal

begin

  -- 7-Segment Display (using the LED output as in your original entity)
  process (CLK)
  begin
    if rising_edge(CLK) then
      --  IMPORTANT:  LED is also used for 7-segment control.  
      --  This process will interfere with using LEDs for other purposes.
      --  If you want to use the LEDs separately, you'll need to change the entity
      --  and architecture to have separate LED outputs and 7-segment outputs.
      LED <= SW;  --  Directly assign switch values to LEDs
    end if;
  end process;

  -- VGA Signal Generation
  process (CLK)
  begin
    if rising_edge(CLK) then
      -- Horizontal Counter
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

      -- HSync and VSync Generation
      VGA_HS <= '1';  -- Default to '1' (active low)
      if (h_count >= H_ACTIVE + H_FRONT) and (h_count < H_ACTIVE + H_FRONT + H_SYNC) then
        VGA_HS <= '0';
      end if;

      VGA_VS <= '1';
      if (v_count >= V_ACTIVE + V_FRONT) and (v_count < V_ACTIVE + V_FRONT + V_SYNC) then
        VGA_VS <= '0';
      end if;

      -- RGB Color Selection based on Switches
      rgb_temp <= SW(11 downto 0);  -- Use the first 12 switches for RGB

      VGA_R <= rgb_temp(11 downto 8);   -- Map MSB 4 bits to Red
      VGA_G <= rgb_temp(7 downto 4);    -- Map middle 4 bits to Green
      VGA_B <= rgb_temp(3 downto 0);    -- Map LSB 4 bits to Blue

    end if;
  end process;

end Behavioral;