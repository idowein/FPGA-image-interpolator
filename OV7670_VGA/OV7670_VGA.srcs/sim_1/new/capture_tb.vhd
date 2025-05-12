library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_ovo_7670_caputre is
end tb_ovo_7670_caputre;

architecture sim of tb_ovo_7670_caputre is

    signal pclk          : std_logic := '0';
    signal camera_v_sync : std_logic := '0';
    signal camera_h_ref  : std_logic := '0';
    signal zoom_x2       : std_logic := '0';
    signal din           : std_logic_vector(7 downto 0) := (others => '0');
    signal addr          : std_logic_vector(18 downto 0);
    signal dout          : std_logic_vector(11 downto 0);
    signal wr_en         : std_logic;
    signal clk_bram      : std_logic;

    constant clk_period : time := 20 ns; -- 50 MHz pclk

begin

    -- Instantiate UUT
    uut: entity work.ovo_7670_caputre
        port map (
            pclk => pclk,
            camera_v_sync => camera_v_sync,
            camera_h_ref  => camera_h_ref,
            zoom_x2       => zoom_x2,
            din           => din,
            addr          => addr,
            dout          => dout,
            wr_en         => wr_en,
            clk_bram      => clk_bram
        );

    -- Clock generation
    clk_process : process
    begin
        while now < 10 us loop
            pclk <= '0';
            wait for clk_period / 2;
            pclk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus
    stim_proc : process
    begin
        wait for 100 ns;
        camera_v_sync <= '0';
        zoom_x2 <= '0';

        -- Simulate one frame line
        for row in 0 to 5 loop
            camera_h_ref <= '1';
            for col in 0 to 5 loop
                din <= std_logic_vector(to_unsigned(col * 16 + row, 8));
                wait for clk_period;
                din <= std_logic_vector(to_unsigned(col * 16 + row + 1, 8));
                wait for clk_period;
            end loop;
            camera_h_ref <= '0';
            wait for clk_period;
        end loop;

        -- Trigger reset by v_sync
        camera_v_sync <= '1';
        wait for clk_period;
        camera_v_sync <= '0';

        -- Enable zoom
        wait for 200 ns;
        zoom_x2 <= '1';

        -- Simulate a zoomed line
        camera_h_ref <= '1';
        for i in 0 to 5 loop
            din <= std_logic_vector(to_unsigned(i + 64, 8));
            wait for clk_period;
            din <= std_logic_vector(to_unsigned(i + 65, 8));
            wait for clk_period;
        end loop;
        camera_h_ref <= '0';

        wait;
    end process;

end sim;
