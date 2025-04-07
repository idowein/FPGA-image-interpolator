library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_level_tb is
end top_level_tb;

architecture Behavioral of top_level_tb is
    signal CLK : STD_LOGIC := '0';
    signal CAM_D : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal CAM_HREF : STD_LOGIC := '0';
    signal CAM_VSYNC : STD_LOGIC := '0';
    signal CAM_PCLK : STD_LOGIC := '0';
    signal VGA_R : STD_LOGIC_VECTOR(3 downto 0);
    signal VGA_G : STD_LOGIC_VECTOR(3 downto 0);
    signal VGA_B : STD_LOGIC_VECTOR(3 downto 0);
    signal VGA_HS : STD_LOGIC;
    signal VGA_VS : STD_LOGIC;

    -- Instantiate the Unit Under Test (UUT)
    component top_level is
        Port (
            CLK : in STD_LOGIC;
            CAM_D : in STD_LOGIC_VECTOR(7 downto 0);
            CAM_HREF : in STD_LOGIC;
            CAM_VSYNC : in STD_LOGIC;
            CAM_PCLK : in STD_LOGIC;
            VGA_R : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_G : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_B : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_HS : out STD_LOGIC;
            VGA_VS : out STD_LOGIC
        );
    end component;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: top_level
        port map (
            CLK => CLK,
            CAM_D => CAM_D,
            CAM_HREF => CAM_HREF,
            CAM_VSYNC => CAM_VSYNC,
            CAM_PCLK => CAM_PCLK,
            VGA_R => VGA_R,
            VGA_G => VGA_G,
            VGA_B => VGA_B,
            VGA_HS => VGA_HS,
            VGA_VS => VGA_VS
        );

    -- Clock generation
    CLK <= not CLK after 10 ns;
    CAM_PCLK <= not CAM_PCLK after 20 ns;

    -- Stimulus process
    stimulus: process
    begin
        -- Initial values
        CAM_D <= "00000000";
        CAM_HREF <= '0';
        CAM_VSYNC <= '0';
        
        wait for 40 ns;
        
        -- Simulate camera data
        CAM_VSYNC <= '1';
        wait for 40 ns;
        CAM_VSYNC <= '0';
        
        CAM_HREF <= '1';
        CAM_D <= "00000001";
        wait for 40 ns;
        
        CAM_D <= "00000010";
        wait for 40 ns;
        
        CAM_D <= "00000011";
        wait for 40 ns;
        
        CAM_HREF <= '0';
        CAM_D <= "00000000";
        wait for 40 ns;
        
        wait;
    end process;
end Behavioral;