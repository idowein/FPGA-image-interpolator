library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ov5640_controller is
    Port (
        clk              : in  STD_LOGIC;   -- System clock (e.g., 100 MHz)
        resend           : in  STD_LOGIC;   -- Resend initialization sequence
        config_finished  : out STD_LOGIC;   -- Configuration completion signal
        i2c_scl          : out STD_LOGIC;   -- I2C clock (maps to DVP_SIOC)
        i2c_sda          : inout STD_LOGIC; -- I2C data (maps to DVP_SIOD)
        reset_n          : out STD_LOGIC;   -- Reset signal (maps to CAM_RESET)
        pwdn             : out STD_LOGIC;   -- Power-down signal (maps to CAM_PWDN)
        xclk             : out STD_LOGIC    -- External clock (maps to XCLK)
    );
end ov5640_controller;

architecture Behavioral of ov5640_controller is

    -- I2C configuration signals
    signal send    : std_logic := '0';
    signal taken   : std_logic := '0';
    signal command : std_logic_vector(15 downto 0);
    signal config_done : std_logic := '0';

    constant camera_address : std_logic_vector(7 downto 0) := x"78";

    -- Clock generation for XCLK
    signal clk_div : integer := 0;
    signal xclk_sig : std_logic := '0';

begin

    -- Generate 24 MHz clock for XCLK from the system clock (assuming 100 MHz input)
    process(clk)
    begin
        if rising_edge(clk) then
            if clk_div = 2 then -- Divide 100 MHz clock by approximately 4.17 for ~24 MHz
                clk_div <= 0;
                xclk_sig <= not xclk_sig;
            else
                clk_div <= clk_div + 1;
            end if;
        end if;
    end process;

    xclk <= xclk_sig;

    -- Static Control Signals
    reset_n <= '1';  -- Active low reset (1 = normal operation)
    pwdn    <= '0';  -- Active high power-down (0 = active camera)

    -- Initialize Camera via I2C
    process(clk)
    begin
        if rising_edge(clk) then
            if resend = '1' then
                send <= '1';
                command <= x"3103"; -- Example initialization register and value
                config_done <= '0';
            elsif taken = '1' then
                send <= '0';
                config_done <= '1'; -- Configuration is complete after I2C transaction
            end if;
        end if;
    end process;

    config_finished <= config_done;

    -- Instantiate I2C Sender Component
    i2c_inst : entity work.i2c_sender
        port map (
            clk   => clk,
            send  => send,
            taken => taken,
            id    => camera_address,
            reg   => command(15 downto 8),
            value => command(7 downto 0),
            siod  => i2c_sda,
            sioc  => i2c_scl
        );

end Behavioral;