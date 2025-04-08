----------------------------------------------------------------------------------
-- Updated VGA Controller for 1920x1080 resolution
-- This file is adapted to meet the 1920x1080 @ 60Hz timing standards.
-- Ensure that the pix_clk is generated at about 148.5 MHz.
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity design_1_vga_02_0_0 is
  Port (
    pix_clk      : in  std_logic;  -- Expected 148.5 MHz clock
    cntl         : in  std_logic;
    zoom         : in  std_logic;
    frame_fix    : in  std_logic_vector(11 downto 0);
    VGA_H_sync   : out std_logic;
    vga_V_sync   : out std_logic;
    vga_red      : out std_logic_vector(3 downto 0);
    vga_blue     : out std_logic_vector(3 downto 0);
    vga_green    : out std_logic_vector(3 downto 0);
    frame_adress : out std_logic_vector(18 downto 0)
  );
end design_1_vga_02_0_0;

architecture Behavioral of design_1_vga_02_0_0 is
  -- Timing constants for 1920x1080 @ 60Hz
  constant H_VISIBLE : integer := 1920;
  constant H_FRONT   : integer := 88;
  constant H_SYNC    : integer := 44;
  constant H_BACK    : integer := 148;
  constant H_TOTAL   : integer := H_VISIBLE + H_FRONT + H_SYNC + H_BACK;

  constant V_VISIBLE : integer := 1080;
  constant V_FRONT   : integer := 4;
  constant V_SYNC    : integer := 5;
  constant V_BACK    : integer := 36;
  constant V_TOTAL   : integer := V_VISIBLE + V_FRONT + V_SYNC + V_BACK;

  signal h_cnt       : integer range 0 to H_TOTAL - 1 := 0;
  signal v_cnt       : integer range 0 to V_TOTAL - 1 := 0;
  signal disp_active : std_logic;
begin

  -- Horizontal and Vertical Counters
  process(pix_clk)
  begin
    if rising_edge(pix_clk) then
      if h_cnt = H_TOTAL - 1 then
        h_cnt <= 0;
        if v_cnt = V_TOTAL - 1 then
          v_cnt <= 0;
        else
          v_cnt <= v_cnt + 1;
        end if;
      else
        h_cnt <= h_cnt + 1;
      end if;
    end if;
  end process;

  -- Generate sync signals
  VGA_H_sync <= '0' when (h_cnt >= H_VISIBLE + H_FRONT and h_cnt < H_VISIBLE + H_FRONT + H_SYNC) else '1';
  vga_V_sync  <= '0' when (v_cnt >= V_VISIBLE + V_FRONT and v_cnt < V_VISIBLE + V_FRONT + V_SYNC) else '1';

  -- Determine active video region
  disp_active <= '1' when (h_cnt < H_VISIBLE and v_cnt < V_VISIBLE) else '0';

  -- Pixel color output:passing through frame_fix as the pixel data
  process(pix_clk)
  begin
    if rising_edge(pix_clk) then
      if disp_active = '1' then
        vga_red   <= frame_fix(11 downto 8);
        vga_green <= frame_fix(7 downto 4);
        vga_blue  <= frame_fix(3 downto 0);
      else
        vga_red   <= (others => '0');
        vga_green <= (others => '0');
        vga_blue  <= (others => '0');
      end if;
    end if;
  end process;

  -- Calculate the frame address based on the current pixel location.
  frame_adress <= std_logic_vector(to_unsigned(v_cnt * H_VISIBLE + h_cnt, 19));

end Behavioral;