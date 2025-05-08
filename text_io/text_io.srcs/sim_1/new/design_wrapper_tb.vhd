library ieee;
use ieee.std_logic_1164.all;

entity design_1_wrapper_tb is
end design_1_wrapper_tb;

architecture behavior of design_1_wrapper_tb is

    -- Component Declaration
    component design_1_wrapper
        port (
            clk_0           : in std_logic;
            clkx3_0         : in std_logic;
            filed_enable_0  : in std_logic;
            line_enable_0   : in std_logic;
            line_sync_0     : in std_logic;
            reset_0         : in std_logic
        );
    end component;

    -- Signals
    signal clk         : std_logic := '0';
    signal clkx3       : std_logic := '0';
    signal filed_enable: std_logic := '0';
    signal line_enable : std_logic := '0';
    signal line_sync   : std_logic := '0';
    signal reset       : std_logic := '0';

    constant clk_period : time := 36 ns;

begin

    -- Instantiate DUT
    uut: design_1_wrapper
        port map (
            clk_0           => clk,
            clkx3_0         => clkx3,
            filed_enable_0  => filed_enable,
            line_enable_0   => line_enable,
            line_sync_0     => line_sync,
            reset_0         => reset
        );

    -- Clock process
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- clkx3 process
    clkx3_process : process
    begin
        clkx3 <= '0';
        wait for clk_period / 6;
        clkx3 <= '1';
        wait for clk_period / 6;
    end process;

    -- reset pulse
    reset <= '1', '0' after 200 ns;

    -- Field enable
    field_enable_process : process
    begin
        filed_enable <= '0';
        wait for clk_period * 650;
        filed_enable <= '1';
        wait for clk_period * 312000;
    end process;

    -- Line enable
    line_enable_process : process
    begin
        line_enable <= '0';
        wait for clk_period * 10;
        line_enable <= '1';
        wait for clk_period * 640;
    end process;

    -- Line sync
    line_sync_process : process
    begin
        line_sync <= '0';
        wait for clk_period * 4;
        line_sync <= '1';
        wait for clk_period * 1;
        line_sync <= '0';
        wait for clk_period * 645;
    end process;

end behavior;
