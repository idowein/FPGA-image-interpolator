library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bilinear_interpolation_unit is
    Port (
        -- Inputs
        clk : in std_logic; -- Clock signal
        rst : in std_logic; -- Reset signal
        A : in std_logic_vector(7 downto 0); -- Top-left pixel
        B : in std_logic_vector(7 downto 0); -- Top-right pixel
        C : in std_logic_vector(7 downto 0); -- Bottom-left pixel
        D : in std_logic_vector(7 downto 0); -- Bottom-right pixel

        -- Outputs
        O11 : out std_logic_vector(7 downto 0); -- Top-left
        O12 : out std_logic_vector(7 downto 0); -- Top-center-left
        O13 : out std_logic_vector(7 downto 0); -- Top-center-right
        O14 : out std_logic_vector(7 downto 0); -- Top-right
        O21 : out std_logic_vector(7 downto 0); -- Middle-top-left
        O22 : out std_logic_vector(7 downto 0); -- Center
        O23 : out std_logic_vector(7 downto 0); -- Middle-top-right
        O24 : out std_logic_vector(7 downto 0); -- Middle-right
        O31 : out std_logic_vector(7 downto 0); -- Middle-bottom-left
        O32 : out std_logic_vector(7 downto 0); -- Bottom-center-left
        O33 : out std_logic_vector(7 downto 0); -- Bottom-center-right
        O34 : out std_logic_vector(7 downto 0); -- Middle-bottom-right
        O41 : out std_logic_vector(7 downto 0); -- Bottom-left
        O42 : out std_logic_vector(7 downto 0); -- Bottom-center-left
        O43 : out std_logic_vector(7 downto 0); -- Bottom-center-right
        O44 : out std_logic_vector(7 downto 0)  -- Bottom-right
    );
end bilinear_interpolation_unit;

architecture Behavioral of bilinear_interpolation_unit is
    -- Internal signals for intermediate computations
    signal P012, P013 : std_logic_vector(7 downto 0); -- Horizontal interpolation between A and B
    signal P042, P043 : std_logic_vector(7 downto 0); -- Horizontal interpolation between C and D
    signal P021, P031 : std_logic_vector(7 downto 0); -- Vertical interpolation between A and C
    signal P024, P034 : std_logic_vector(7 downto 0); -- Vertical interpolation between B and D
    signal P022, P023, P032, P033 : std_logic_vector(7 downto 0); -- Bi-linear interpolation
begin
    -- Synchronous process triggered on the rising edge of the clock
    process(clk, rst)
    begin
        if rst = '1' then
            -- Reset all outputs to 0
            P012 <= (others => '0');
            P013 <= (others => '0');
            P042 <= (others => '0');
            P043 <= (others => '0');
            P021 <= (others => '0');
            P031 <= (others => '0');
            P024 <= (others => '0');
            P034 <= (others => '0');
            P022 <= (others => '0');
            P023 <= (others => '0');
            P032 <= (others => '0');
            P033 <= (others => '0');
        elsif rising_edge(clk) then
            -- Horizontal interpolation for the top and bottom rows
            P012 <= std_logic_vector(resize(unsigned(A)+((unsigned(B) - unsigned(A)) / 3), 8));
            P013 <= std_logic_vector(resize(unsigned(A)+ 2 * ((unsigned(B) - unsigned(A)) / 3), 8));
            P042 <= std_logic_vector(resize(unsigned(C)+(unsigned(D) - unsigned(C)) / 3, 8));
            P043 <= std_logic_vector(resize(unsigned(C)+2 * (unsigned(D) - unsigned(C)) / 3, 8));

            -- Vertical interpolation for the left and right columns
            P021 <= std_logic_vector(resize(unsigned(A)+((unsigned(C) - unsigned(A)) / 3), 8));
            P031 <= std_logic_vector(resize(unsigned(A)+ 2 * ((unsigned(C) - unsigned(A)) / 3), 8));
            P024 <= std_logic_vector(resize(unsigned(B)+((unsigned(D) - unsigned(B)) / 3), 8));
            P034 <= std_logic_vector(resize(unsigned(B)+ 2 * ((unsigned(D) - unsigned(B)) / 3), 8));

            -- Bi-linear interpolation for the center pixels
            P022 <= std_logic_vector(resize((2 * unsigned(A) + unsigned(B) + 2 * unsigned(C) + unsigned(D)) / 6, 8));
            P023 <= std_logic_vector(resize((unsigned(A) + 2 * unsigned(B) + 2 * unsigned(C) + unsigned(D)) / 6, 8));
            P032 <= std_logic_vector(resize((2 * unsigned(A) + unsigned(B) + unsigned(C) + 2 * unsigned(D)) / 6, 8));
            P033 <= std_logic_vector(resize(( unsigned(A) + 2 * unsigned(B) + unsigned(C) + 2 * unsigned(D)) / 6, 8));
        end if;
    end process;

    -- Assign output pixels
    O11 <= A;
    O12 <= P012;
    O13 <= P013;
    O14 <= B;
    O21 <= P021;
    O22 <= P022;
    O23 <= P023;
    O24 <= P024;
    O31 <= P031;
    O32 <= P032;
    O33 <= P033;
    O34 <= P034;
    O41 <= C;
    O42 <= P042;
    O43 <= P043;
    O44 <= D;
end Behavioral;