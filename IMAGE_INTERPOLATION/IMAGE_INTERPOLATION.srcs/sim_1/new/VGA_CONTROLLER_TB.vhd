library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VGA_CONTROLLER_tb is
end VGA_CONTROLLER_tb;

architecture Behavioral of VGA_CONTROLLER_tb is
    signal CLK : STD_LOGIC := '0';
    signal FRAME_ADDR : STD_LOGIC_VECTOR(18 downto 0) := (others => '0');
    signal FRAME_DATA : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
    signal VGA_R : STD_LOGIC_VECTOR(3 downto 0);
    signal VGA_G : STD_LOGIC_VECTOR(3 downto 0);
    signal VGA_B : STD_LOGIC_VECTOR(3 downto 0);
    signal VGA_HS : STD_LOGIC;
    signal VGA_VS : STD_LOGIC;

    -- Instantiate the Unit Under Test (UUT)
    component VGA_CONTROLLER is
        Port (
            CLK : in STD_LOGIC;
            FRAME_ADDR : in STD_LOGIC_VECTOR(18 downto 0);
            FRAME_DATA : in STD_LOGIC_VECTOR(11 downto 0);
            VGA_R : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_G : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_B : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_HS : out STD_LOGIC;
            VGA_VS : out STD_LOGIC
        );
    end component;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: VGA_CONTROLLER
        port map (
            CLK => CLK,
            FRAME_ADDR => FRAME_ADDR,
            FRAME_DATA => FRAME_DATA,
            VGA_R => VGA_R,
            VGA_G => VGA_G,
            VGA_B => VGA_B,
            VGA_HS => VGA_HS,
            VGA_VS => VGA_VS
        );

    -- Clock generation
    CLK <= not CLK after 10 ns;
    
    -- Stimulus process
    stimulus: process
    begin
        FRAME_ADDR <= (others => '0');
        FRAME_DATA <= "111100000000";  -- Red color
        wait for 20 ns;
        
        FRAME_ADDR <= FRAME_ADDR + 1;
        FRAME_DATA <= "000011110000";  -- Green color
        wait for 20 ns;
        
        FRAME_ADDR <= FRAME_ADDR + 1;
        FRAME_DATA <= "000000001111";  -- Blue color
        wait for 20 ns;
        
        wait;
    end process;
end Behavioral;