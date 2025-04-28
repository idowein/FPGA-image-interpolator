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
    signal AB1, AB2 : std_logic_vector(7 downto 0); -- Horizontal interpolation between A and B
    signal CD1, CD2 : std_logic_vector(7 downto 0); -- Horizontal interpolation between C and D
    signal AC1, AC2 : std_logic_vector(7 downto 0); -- Vertical interpolation between A and C
    signal BD1, BD2 : std_logic_vector(7 downto 0); -- Vertical interpolation between B and D
    signal ABCD1, ABCD2, ABCD3, ABCD4 : std_logic_vector(7 downto 0); -- Bi-linear interpolation
begin
    -- Synchronous process triggered on the rising edge of the clock
    process(clk, rst)
    begin
        if rst = '1' then
            -- Reset all outputs to 0
            AB1 <= (others => '0');
            AB2 <= (others => '0');
            CD1 <= (others => '0');
            CD2 <= (others => '0');
            AC1 <= (others => '0');
            AC2 <= (others => '0');
            BD1 <= (others => '0');
            BD2 <= (others => '0');
            ABCD1 <= (others => '0');
            ABCD2 <= (others => '0');
            ABCD3 <= (others => '0');
            ABCD4 <= (others => '0');
        elsif rising_edge(clk) then
            -- Horizontal interpolation for the top and bottom rows
            AB1 <= std_logic_vector(resize(unsigned(A)+((unsigned(B) - unsigned(A)) / 3), 8));
            AB2 <= std_logic_vector(resize(unsigned(A)+ 2 * ((unsigned(B) - unsigned(A)) / 3), 8));
            CD1 <= std_logic_vector(resize(unsigned(C)+(unsigned(D) - unsigned(C)) / 3, 8));
            CD2 <= std_logic_vector(resize(unsigned(C)+2 * (unsigned(D) - unsigned(C)) / 3, 8));

            -- Vertical interpolation for the left and right columns
            AC1 <= std_logic_vector(resize(unsigned(A)+((unsigned(C) - unsigned(A)) / 3), 8));
            AC2 <= std_logic_vector(resize(unsigned(A)+ 2 * ((unsigned(C) - unsigned(A)) / 3), 8));
            BD1 <= std_logic_vector(resize(unsigned(B)+((unsigned(D) - unsigned(B)) / 3), 8));
            BD2 <= std_logic_vector(resize(unsigned(B)+ 2 * ((unsigned(D) - unsigned(B)) / 3), 8));

            -- Bi-linear interpolation for the center pixels
            ABCD1 <= std_logic_vector(resize((unsigned(A) + unsigned(B) + unsigned(C) + unsigned(D)) / 4, 8));
            ABCD2 <= std_logic_vector(resize(((3 * unsigned(A)) + unsigned(B) + (3 * unsigned(C)) + unsigned(D)) / 8, 8));
            ABCD3 <= std_logic_vector(resize((unsigned(A) + (3 * unsigned(B)) + unsigned(C) + (3 * unsigned(D))) / 8, 8));
            ABCD4 <= std_logic_vector(resize(((3 * unsigned(A)) + (3 * unsigned(B)) + (3 * unsigned(C)) + (3 * unsigned(D))) / 12, 8));
        end if;
    end process;

    -- Assign output pixels
    O11 <= A;
    O12 <= AB1;
    O13 <= AB2;
    O14 <= B;
    O21 <= AC1;
    O22 <= ABCD2;
    O23 <= ABCD1;
    O24 <= BD2;
    O31 <= AC2;
    O32 <= ABCD3;
    O33 <= ABCD4;
    O34 <= BD1;
    O41 <= C;
    O42 <= CD1;
    O43 <= CD2;
    O44 <= D;
end Behavioral;