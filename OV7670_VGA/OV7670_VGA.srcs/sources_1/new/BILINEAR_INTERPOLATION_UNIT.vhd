library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bilinear_interpolation_unit is
    Port (
        -- Input 2x2 Block
        A : in unsigned(7 downto 0); -- Top-left pixel
        B : in unsigned(7 downto 0); -- Top-right pixel
        C : in unsigned(7 downto 0); -- Bottom-left pixel
        D : in unsigned(7 downto 0); -- Bottom-right pixel

        -- Output 4x4 Block
        O11 : out unsigned(7 downto 0); -- Top-left
        O12 : out unsigned(7 downto 0); -- Top-center-left
        O13 : out unsigned(7 downto 0); -- Top-center-right
        O14 : out unsigned(7 downto 0); -- Top-right
        O21 : out unsigned(7 downto 0); -- Middle-top-left
        O22 : out unsigned(7 downto 0); -- Center
        O23 : out unsigned(7 downto 0); -- Middle-top-right
        O24 : out unsigned(7 downto 0); -- Middle-right
        O31 : out unsigned(7 downto 0); -- Middle-bottom-left
        O32 : out unsigned(7 downto 0); -- Bottom-center-left
        O33 : out unsigned(7 downto 0); -- Bottom-center-right
        O34 : out unsigned(7 downto 0); -- Middle-bottom-right
        O41 : out unsigned(7 downto 0); -- Bottom-left
        O42 : out unsigned(7 downto 0); -- Bottom-center-left
        O43 : out unsigned(7 downto 0); -- Bottom-center-right
        O44 : out unsigned(7 downto 0)  -- Bottom-right
    );
end bilinear_interpolation_unit;

architecture Behavioral of bilinear_interpolation_unit is

    -- Internal signals for intermediate computations
    signal AB1, AB2 : unsigned(7 downto 0); -- Horizontal interpolation between A and B
    signal CD1, CD2 : unsigned(7 downto 0); -- Horizontal interpolation between C and D
    signal AC1, AC2 : unsigned(7 downto 0); -- Vertical interpolation between A and C
    signal BD1, BD2 : unsigned(7 downto 0); -- Vertical interpolation between B and D
    signal ABCD1, ABCD2, ABCD3, ABCD4 : unsigned(7 downto 0); -- Bi-linear interpolation

begin
    -- Horizontal interpolation for the top and bottom rows
    AB1 <= (A + B) / 2; -- Midpoint between A and B
    AB2 <= (3*A + B) / 4; -- Weighted closer to A
    CD1 <= (C + D) / 2;
    CD2 <= (3*C + D) / 4; -- Weighted closer to C

    -- Vertical interpolation for the left and right columns
    AC1 <= (A + C) / 2; -- Midpoint between A and C
    AC2 <= (3*A + C) / 4; -- Weighted closer to A
    BD1 <= (B + D) / 2; -- Midpoint between B and D
    BD2 <= (3*B + D) / 4; -- Weighted closer to B

    -- Bi-linear interpolation for the center pixels
    ABCD1 <= (A + B + C + D) / 4; -- True center
    ABCD2 <= (3*A + B + 3*C + D) / 8; -- Weighted towards A and C
    ABCD3 <= (A + 3*B + C + 3*D) / 8; -- Weighted towards B and D
    ABCD4 <= (3*A + 3*B + 3*C + 3*D) / 12; -- Weighted average

    -- Assign output pixels
    O11 <= A;        -- Top-left stays the same
    O12 <= AB2;      -- Interpolated between A and B (closer to A)
    O13 <= AB1;      -- Interpolated between A and B (midpoint)
    O14 <= B;        -- Top-right stays the same

    O21 <= AC2;      -- Interpolated between A and C (closer to A)
    O22 <= ABCD2;    -- Bi-linear interpolation (closer to A and C)
    O23 <= ABCD1;    -- Bi-linear midpoint
    O24 <= BD2;      -- Interpolated between B and D (closer to B)

    O31 <= AC1;      -- Interpolated between A and C (midpoint)
    O32 <= ABCD3;    -- Bi-linear interpolation (closer to B and D)
    O33 <= ABCD4;    -- Bi-linear weighted average
    O34 <= BD1;      -- Interpolated between B and D (midpoint)

    O41 <= C;        -- Bottom-left stays the same
    O42 <= CD2;      -- Interpolated between C and D (closer to C)
    O43 <= CD1;      -- Interpolated between C and D (midpoint)
    O44 <= D;        -- Bottom-right stays the same

end Behavioral;