library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SIMPLE_VGA_GREEN is
    Port (
        CLK     : in  STD_LOGIC;  -- Must be 25 MHz!
        VGA_HS  : out STD_LOGIC;
        VGA_VS  : out STD_LOGIC;
        VGA_R   : out STD_LOGIC_VECTOR (3 downto 0);
        VGA_G   : out STD_LOGIC_VECTOR (3 downto 0);
        VGA_B   : out STD_LOGIC_VECTOR (3 downto 0)
    );
end SIMPLE_VGA_GREEN;

architecture Behavioral of SIMPLE_VGA_GREEN is

    -- VGA 640x480 @ 60Hz timings
    constant H_ACTIVE : integer := 640;
    constant H_FRONT  : integer := 16;
    constant H_SYNC   : integer := 96;
    constant H_BACK   : integer := 48;

    constant V_ACTIVE : integer := 480;
    constant V_FRONT  : integer := 10;
    constant V_SYNC   : integer := 2;
    constant V_BACK   : integer := 33;

    constant H_TOTAL  : integer := H_ACTIVE + H_FRONT + H_SYNC + H_BACK;  -- 800
    constant V_TOTAL  : integer := V_ACTIVE + V_FRONT + V_SYNC + V_BACK;  -- 525

    signal h_count : integer range 0 to H_TOTAL - 1 := 0;
    signal v_count : integer range 0 to V_TOTAL - 1 := 0;

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            -- Horizontal counter
            if h_count = H_TOTAL - 1 then
                h_count <= 0;
                -- Vertical counter
                if v_count = V_TOTAL - 1 then
                    v_count <= 0;
                else
                    v_count <= v_count + 1;
                end if;
            else
                h_count <= h_count + 1;
            end if;

            -- Sync signals
            if (h_count >= H_ACTIVE + H_FRONT) and (h_count < H_ACTIVE + H_FRONT + H_SYNC) then
                VGA_HS <= '0';  -- Active low
            else
                VGA_HS <= '1';
            end if;

            if (v_count >= V_ACTIVE + V_FRONT) and (v_count < V_ACTIVE + V_FRONT + V_SYNC) then
                VGA_VS <= '0';  -- Active low
            else
                VGA_VS <= '1';
            end if;

            -- Display area: Green only
            if (h_count < H_ACTIVE) and (v_count < V_ACTIVE) then
                VGA_R <= "0000";
                VGA_G <= "1111";  -- Bright green
                VGA_B <= "0000";
            else
                VGA_R <= "0000";
                VGA_G <= "0000";
                VGA_B <= "0000";
            end if;
        end if;
    end process;

end Behavioral;
