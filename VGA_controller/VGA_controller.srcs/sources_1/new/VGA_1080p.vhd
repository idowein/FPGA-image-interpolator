library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_1080p is
    Port (
        CLK     : in  STD_LOGIC;
        VGA_HS  : out STD_LOGIC;
        VGA_VS  : out STD_LOGIC;
        VGA_R   : out STD_LOGIC_VECTOR (3 downto 0);
        VGA_G   : out STD_LOGIC_VECTOR (3 downto 0);
        VGA_B   : out STD_LOGIC_VECTOR (3 downto 0)
    );
end vga_1080p;

architecture Behavioral of vga_1080p is

    constant H_ACTIVE : integer := 1920;
    constant H_FRONT  : integer := 88;
    constant H_SYNC   : integer := 44;
    constant H_BACK   : integer := 148;

    constant V_ACTIVE : integer := 1080;
    constant V_FRONT  : integer := 4;
    constant V_SYNC   : integer := 5;
    constant V_BACK   : integer := 36;

    constant H_TOTAL  : integer := H_ACTIVE + H_FRONT + H_SYNC + H_BACK;  -- 2200
    constant V_TOTAL  : integer := V_ACTIVE + V_FRONT + V_SYNC + V_BACK;  -- 1125

    signal h_count : integer range 0 to H_TOTAL - 1 := 0;
    signal v_count : integer range 0 to V_TOTAL - 1 := 0;

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if h_count = H_TOTAL - 1 then
                h_count <= 0;
                if v_count = V_TOTAL - 1 then
                    v_count <= 0;
                else
                    v_count <= v_count + 1;
                end if;
            else
                h_count <= h_count + 1;
            end if;

            -- HSync
            if (h_count >= H_ACTIVE + H_FRONT) and (h_count < H_ACTIVE + H_FRONT + H_SYNC) then
                VGA_HS <= '0';
            else
                VGA_HS <= '1';
            end if;

            -- VSync
            if (v_count >= V_ACTIVE + V_FRONT) and (v_count < V_ACTIVE + V_FRONT + V_SYNC) then
                VGA_VS <= '0';
            else
                VGA_VS <= '1';
            end if;

            -- Display area
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
