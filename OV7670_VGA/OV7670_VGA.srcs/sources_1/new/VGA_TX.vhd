library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity VGA_TX is
    Port (
        pix_clk      : in  STD_LOGIC;
        h_cnt        : out std_logic_vector(11 downto 0);
        v_cnt        : out std_logic_vector(11 downto 0);
        h_sync       : out std_logic;
        v_sync       : out std_logic;
        blank        : out std_logic
    );
end VGA_TX;

architecture Behavioral of VGA_TX is
    signal h_cnt_reg : std_logic_vector(11 downto 0) := (others => '0');
    signal v_cnt_reg : std_logic_vector(11 downto 0) := (others => '0');
    
    -- Updated constants for 640x480 resolution
    constant FRAME_WIDTH : integer := 640;   -- Width of the frame
    constant FRAME_HEIGHT : integer := 480;  -- Height of the frame
    constant H_FP : integer := 16;           -- Horizontal Front Porch
    constant H_PW : integer := 96;           -- Horizontal Pulse Width
    constant H_MAX : integer := 800;         -- Total Horizontal Pixels (640 + Front Porch + Back Porch + Sync)
    constant V_FP : integer := 10;           -- Vertical Front Porch
    constant V_PW : integer := 2;            -- Vertical Pulse Width
    constant V_MAX : integer := 525;         -- Total Vertical Pixels (480 + Front Porch + Back Porch + Sync)
    constant BITS_WIDTH : integer := 12;     -- Data width for bits
    constant ADDR_WIDTH : integer := 19;     -- Address width
    constant PIX_WIDTH : integer := 12;      -- Pixel data width
    constant VGABIT_WIDTH : integer := 4;    -- VGA color depth
    constant CAMERA_WIDTH : integer := 640;  -- Camera width
    constant CAMERA_HEIGHT : integer := 480; -- Camera height
    
     -- constant
    signal H_POSITIVE: std_logic := '1'; -- Indicates positive polarity for horizontal sync signal
    signal V_POSITIVE: std_logic := '1'; -- Indicates positive polarity for vertical sync signal
    
begin
    h_cnt <= h_cnt_reg;
    v_cnt <= v_cnt_reg;

    -- Horizontal Counter
    process(pix_clk)
    begin
        if rising_edge(pix_clk) then
            if h_cnt_reg = (H_MAX - 1) then
                h_cnt_reg <= (others => '0');
            else
                h_cnt_reg <= h_cnt_reg + 1;
            end if;
        end if;
    end process;

    -- Vertical Counter
    process(pix_clk)
    begin
        if rising_edge(pix_clk) then
            if h_cnt_reg = (H_MAX - 1) then
                if v_cnt_reg = (V_MAX - 1) then
                    v_cnt_reg <= (others => '0');
                else
                    v_cnt_reg <= v_cnt_reg + 1;
                end if;
            end if;
        end if;
    end process;

    -- Horizontal Sync Signal
    process(pix_clk)
    begin
        if rising_edge(pix_clk) then
            if (h_cnt_reg >= (H_FP + FRAME_WIDTH - 1)) and (h_cnt_reg < (H_FP + FRAME_WIDTH + H_PW - 1)) then
                h_sync <= H_POSITIVE;
            elsif h_cnt_reg = (H_MAX - 1) then
                h_sync <= not H_POSITIVE;
            end if;
        end if;
    end process;

    -- Vertical Sync Signal
    process(pix_clk)
    begin
        if rising_edge(pix_clk) then
            if (v_cnt_reg >= (V_FP + FRAME_HEIGHT - 1)) and (v_cnt_reg < (V_FP + FRAME_HEIGHT + V_PW - 1)) then
                v_sync <= V_POSITIVE;
            elsif h_cnt_reg = (H_MAX - 1) then
                v_sync <= not V_POSITIVE;
            end if;
        end if;
    end process;

    -- Blanking Signal
    blank <= '1' when (h_cnt_reg >= FRAME_WIDTH or v_cnt_reg >= FRAME_HEIGHT) else '0';
end Behavioral;