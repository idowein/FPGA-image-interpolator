-- Testbench for SCCB_sender
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_SCCB_sender is
end tb_SCCB_sender;

architecture sim of tb_SCCB_sender is

    -- Component Declaration
    component SCCB_sender
        Port (
            clk   : in    STD_LOGIC;
            siod  : inout STD_LOGIC;
            sioc  : out   STD_LOGIC;
            taken : out   STD_LOGIC;
            send  : in    STD_LOGIC;
            id    : in    STD_LOGIC_VECTOR (7 downto 0);
            reg   : in    STD_LOGIC_VECTOR (7 downto 0);
            value : in    STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    -- Signals
    signal clk     : STD_LOGIC := '0';
    signal siod    : STD_LOGIC := 'Z';
    signal sioc    : STD_LOGIC;
    signal taken   : STD_LOGIC;
    signal send    : STD_LOGIC := '0';
    signal id      : STD_LOGIC_VECTOR(7 downto 0) := x"42";
    signal reg     : STD_LOGIC_VECTOR(7 downto 0) := x"12";
    signal value   : STD_LOGIC_VECTOR(7 downto 0) := x"80";

    constant clk_period : time := 40 ns; -- 25 MHz clock

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: SCCB_sender
        Port Map (
            clk   => clk,
            siod  => siod,
            sioc  => sioc,
            taken => taken,
            send  => send,
            id    => id,
            reg   => reg,
            value => value
        );

    -- Clock generation
    clk_process : process
    begin
        while now < 5 ms loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        wait for 1 us;
        send <= '1';
        wait for clk_period;
        send <= '0';

        -- Wait for taken pulse and simulate for some time
        -- wait for 2 ms;
        -- wait;
    end process;

end sim;