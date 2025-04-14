-- Top-Level Module: Connect OV5640 Camera to VGA Display

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Camera_To_VGA is
    Port (
        PCLK       : in  STD_LOGIC;                      -- Camera pixel clock
        HREF       : in  STD_LOGIC;                      -- Horizontal reference signal
        VSYNC      : in  STD_LOGIC;                      -- Vertical sync signal
        DATA       : in  STD_LOGIC_VECTOR(7 downto 0);   -- Camera pixel data
        VGA_CLK    : in  STD_LOGIC;                      -- VGA clock
        RESET      : in  STD_LOGIC;                      -- Reset signal
        HSYNC      : out STD_LOGIC;                      -- Horizontal sync signal for VGA
        VSYNC_OUT  : out STD_LOGIC;                      -- Vertical sync signal for VGA
        VGA_R      : out STD_LOGIC_VECTOR(3 downto 0);   -- Red channel
        VGA_G      : out STD_LOGIC_VECTOR(3 downto 0);   -- Green channel
        VGA_B      : out STD_LOGIC_VECTOR(3 downto 0)    -- Blue channel
    );
end Camera_To_VGA;

architecture Structural of Camera_To_VGA is
    signal write_enable : STD_LOGIC;
    signal write_addr   : INTEGER;
    signal pixel_data   : STD_LOGIC_VECTOR(7 downto 0);
    signal read_addr    : INTEGER;
    signal read_data    : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Camera Write Logic
    process(PCLK, RESET)
    begin
        if RESET = '1' then
            write_addr <= 0;
            write_enable <= '0';
        elsif rising_edge(PCLK) then
            if HREF = '1' then
                write_addr <= write_addr + 1;
                write_enable <= '1';
                pixel_data <= DATA;
            else
                write_enable <= '0';
            end if;
        end if;
    end process;

    -- Instantiate Frame Buffer
    Frame_Buffer_Inst : entity work.Frame_Buffer
        Port map (
            CLK => PCLK,
            RESET => RESET,
            WRITE_EN => write_enable,
            WRITE_ADDR => write_addr,
            WRITE_DATA => pixel_data,
            READ_ADDR => read_addr,
            READ_DATA => read_data
        );

    -- Instantiate VGA Controller
    VGA_Controller_Inst : entity work.VGA_Controller
        Port map (
            CLK => VGA_CLK,
            RESET => RESET,
            HSYNC => HSYNC,
            VSYNC => VSYNC_OUT,
            VGA_R => VGA_R,
            VGA_G => VGA_G,
            VGA_B => VGA_B,
            READ_ADDR => read_addr,
            PIXEL_DATA => read_data
        );

end Structural;