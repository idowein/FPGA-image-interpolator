library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_top is
    Port (
        clk_100mhz : in  STD_LOGIC;
        VGA_HS     : out STD_LOGIC;
        VGA_VS     : out STD_LOGIC;
        VGA_R      : out STD_LOGIC_VECTOR (3 downto 0);
        VGA_G      : out STD_LOGIC_VECTOR (3 downto 0);
        VGA_B      : out STD_LOGIC_VECTOR (3 downto 0);
        reset      : in  STD_LOGIC
    );
end vga_top;

architecture Behavioral of vga_top is

    signal clk_pixel : STD_LOGIC;
    signal locked     : STD_LOGIC;

    component clk_wiz_0
        Port (
            clk_in1  : in  STD_LOGIC;
            reset    : in  STD_LOGIC;
            clk_out1 : out STD_LOGIC;
            locked   : out STD_LOGIC
        );
    end component;

    component vga_1080p
        Port (
            CLK     : in  STD_LOGIC;
            VGA_HS  : out STD_LOGIC;
            VGA_VS  : out STD_LOGIC;
            VGA_R   : out STD_LOGIC_VECTOR (3 downto 0);
            VGA_G   : out STD_LOGIC_VECTOR (3 downto 0);
            VGA_B   : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

begin

    -- Instantiate Clock Wizard
    clk_inst : clk_wiz_0
        port map (
            clk_in1  => clk_100mhz,
            reset    => reset,
            clk_out1 => clk_pixel,
            locked   => locked
        );

    -- Instantiate VGA controller
    vga_inst : vga_1080p
        port map (
            CLK     => clk_pixel,
            VGA_HS  => VGA_HS,
            VGA_VS  => VGA_VS,
            VGA_R   => VGA_R,
            VGA_G   => VGA_G,
            VGA_B   => VGA_B
        );

end Behavioral;
