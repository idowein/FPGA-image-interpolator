library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bilinear_interpolation_unit_tb is
-- Testbench has no ports
end bilinear_interpolation_unit_tb;

architecture Behavioral of bilinear_interpolation_unit_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component bilinear_interpolation_unit
        Port (
            clk : in std_logic;
            rst : in std_logic;
            A   : in std_logic_vector(7 downto 0);
            B   : in std_logic_vector(7 downto 0);
            C   : in std_logic_vector(7 downto 0);
            D   : in std_logic_vector(7 downto 0);
            O11 : out std_logic_vector(7 downto 0);
            O12 : out std_logic_vector(7 downto 0);
            O13 : out std_logic_vector(7 downto 0);
            O14 : out std_logic_vector(7 downto 0);
            O21 : out std_logic_vector(7 downto 0);
            O22 : out std_logic_vector(7 downto 0);
            O23 : out std_logic_vector(7 downto 0);
            O24 : out std_logic_vector(7 downto 0);
            O31 : out std_logic_vector(7 downto 0);
            O32 : out std_logic_vector(7 downto 0);
            O33 : out std_logic_vector(7 downto 0);
            O34 : out std_logic_vector(7 downto 0);
            O41 : out std_logic_vector(7 downto 0);
            O42 : out std_logic_vector(7 downto 0);
            O43 : out std_logic_vector(7 downto 0);
            O44 : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Testbench signals
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal A   : std_logic_vector(7 downto 0) := (others => '0');
    signal B   : std_logic_vector(7 downto 0) := (others => '0');
    signal C   : std_logic_vector(7 downto 0) := (others => '0');
    signal D   : std_logic_vector(7 downto 0) := (others => '0');
    signal O11, O12, O13, O14 : std_logic_vector(7 downto 0);
    signal O21, O22, O23, O24 : std_logic_vector(7 downto 0);
    signal O31, O32, O33, O34 : std_logic_vector(7 downto 0);
    signal O41, O42, O43, O44 : std_logic_vector(7 downto 0);

    -- Clock period constant
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: bilinear_interpolation_unit
        Port map (
            clk => clk,
            rst => rst,
            A   => A,
            B   => B,
            C   => C,
            D   => D,
            O11 => O11,
            O12 => O12,
            O13 => O13,
            O14 => O14,
            O21 => O21,
            O22 => O22,
            O23 => O23,
            O24 => O24,
            O31 => O31,
            O32 => O32,
            O33 => O33,
            O34 => O34,
            O41 => O41,
            O42 => O42,
            O43 => O43,
            O44 => O44
        );

    -- Clock generation process
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stimulus_process : process
    begin
        -- Apply reset
        rst <= '1';
        wait for clk_period * 2;
        rst <= '0';

--        -- Test Case 1: Uniform Inputs
--        A <= "00001111"; -- 15
--        B <= "00001111"; -- 15
--        C <= "00001111"; -- 15
--        D <= "00001111"; -- 15
--        wait for clk_period * 10;

        -- Test Case 2: Increasing inputs
        A <= "00001010"; -- 10
        B <= "00010100"; -- 20
        C <= "00011110"; -- 30
        D <= "00101000"; -- 40
        wait for clk_period * 10;

--        -- Test Case 3: High values
--        A <= "11111111"; -- 255
--        B <= "11111111"; -- 255
--        C <= "11111111"; -- 255
--        D <= "11111111"; -- 255
--        wait for clk_period * 10;

--        -- Test Case 4: Mixed values
--        A <= "00000000"; -- 0
--        B <= "11111111"; -- 255
--        C <= "11111111"; -- 255
--        D <= "00000000"; -- 0
--        wait for clk_period * 10;

--        -- Test Case 5: Random values
--        A <= "01010101"; -- 85
--        B <= "10101010"; -- 170
--        C <= "11001100"; -- 204
--        D <= "00110011"; -- 51
--        wait for clk_period * 10;

        -- End simulation
        wait;
    end process;

end Behavioral;