library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pixel_data_capture is
    Port (
        pclk       : in  std_logic;                      -- Pixel clock
        href       : in  std_logic;                      -- Horizontal reference
        vsync      : in  std_logic;                      -- Vertical sync
        data       : in  std_logic_vector(9 downto 0);   -- Pixel data
        addr_write : out std_logic_vector(18 downto 0);  -- Frame buffer write address
        dina       : out std_logic_vector(11 downto 0);  -- Frame buffer input data
        wea        : out std_logic                       -- Frame buffer write enable
    );
end pixel_data_capture;

architecture Behavioral of pixel_data_capture is
    signal addr : integer := 0;

begin
    process(pclk)
    begin
        if rising_edge(pclk) then
            if vsync = '1' then
                addr <= 0;  -- Reset address on new frame
            elsif href = '1' then
                addr <= addr + 1;
                dina <= std_logic_vector(resize(unsigned(data), 12));  -- Convert 10-bit to 12-bit
                wea <= '1';  -- Enable write
            else
                wea <= '0';  -- Disable write
            end if;
        end if;
    end process;

    addr_write <= std_logic_vector(to_unsigned(addr, addr_write'length));
end Behavioral;