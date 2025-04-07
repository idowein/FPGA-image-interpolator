library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity frame_buffer_tb is
end frame_buffer_tb;

architecture Behavioral of frame_buffer_tb is
    signal CLK : STD_LOGIC := '0';
    signal PIX_DATA : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal PIX_CLK : STD_LOGIC := '0';
    signal HREF : STD_LOGIC := '0';
    signal VSYNC : STD_LOGIC := '0';
    signal FRAME_ADDR : STD_LOGIC_VECTOR(18 downto 0);
    signal FRAME_DATA : STD_LOGIC_VECTOR(11 downto 0);

    -- Instantiate the Unit Under Test (UUT)
    component frame_buffer is
        Port (
            CLK : in STD_LOGIC;
            PIX_DATA : in STD_LOGIC_VECTOR(7 downto 0);
            PIX_CLK : in STD_LOGIC;
            HREF : in STD_LOGIC;
            VSYNC : in STD_LOGIC;
            FRAME_ADDR : out STD_LOGIC_VECTOR(18 downto 0);
            FRAME_DATA : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: frame_buffer
        port map (
            CLK => CLK,
            PIX_DATA => PIX_DATA,
            PIX_CLK => PIX_CLK,
            HREF => HREF,
            VSYNC => VSYNC,
            FRAME_ADDR => FRAME_ADDR,
            FRAME_DATA => FRAME_DATA
        );

    -- Clock generation
    CLK <= not CLK after 10 ns;
    
    -- Stimulus process
    stimulus: process
    begin
        VSYNC <= '1';
        wait for 20 ns;
        VSYNC <= '0';
        
        HREF <= '1';
        PIX_DATA <= "00001010";
        wait for 20 ns;
        
        PIX_DATA <= "00001100";
        wait for 20 ns;
        
        PIX_DATA <= "00001110";
        wait for 20 ns;
        
        HREF <= '0';
        PIX_DATA <= "00000000";
        wait for 20 ns;
        
        wait;
    end process;
end Behavioral;