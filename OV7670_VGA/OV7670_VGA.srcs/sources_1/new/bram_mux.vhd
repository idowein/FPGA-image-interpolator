library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BRAM_MUX is
    Port (
        -- Inputs
        addr_in         : in std_logic_vector(18 downto 0);
        data_in         : in std_logic_vector(11 downto 0);
        capture_wea     : in std_logic;
        zoom            : in std_logic; -- 0 = BRAM1, 1 = BRAM2
        bili_cntl       : in std_logic;
        
        pclk            : in std_logic;
        bili_clk        : in std_logic;

        -- inputs from bili
        bili_pixel_in       : in std_logic_vector(11 downto 0); 
        bili_address_write  : in std_logic_vector(18 downto 0);
        bili_wea            : in std_logic;

        -- big BRAM (full) Ports
        addr_bram_full      : out std_logic_vector(18 downto 0);
        data_bram_full      : out std_logic_vector(11 downto 0);
        we_bram_full        : out std_logic;

        -- small BRAM (1/4) Ports
        addr_bram_small      : out std_logic_vector(16 downto 0);
        data_bram_small      : out std_logic_vector(11 downto 0);
        we_bram_small        : out std_logic;
        
        wr_clk               : out std_logic
    );
end BRAM_MUX;

architecture Behavioral of BRAM_MUX is
begin
    process (addr_in, data_in, capture_wea, zoom, bili_cntl)
    begin
        if zoom = '0' then
            -- Connect to BRAM1
            wr_clk          <= pclk;
            addr_bram_full   <= addr_in;
            data_bram_full   <= data_in;
            we_bram_full     <= capture_wea;
            

            -- Disconnect BRAM2
            addr_bram_small   <= (others => '0');
            data_bram_small   <= (others => '0');
            we_bram_small     <= '0';
        else -- if zoom is enabled:
            -- Connect to BRAM2
            wr_clk            <= pclk;
            addr_bram_small   <= addr_in(16 downto 0);
            data_bram_small   <= data_in;
            we_bram_small     <= capture_wea;

            if bili_cntl = '0' then
                -- Disconnect BRAM1
                addr_bram_full   <= (others => '0');
                data_bram_full   <= (others => '0');
                we_bram_full     <= '0';
            else -- bili_cntl = '1' -> full BRAM is needed
                wr_clk           <= bili_clk;
                addr_bram_full   <= bili_address_write;
                data_bram_full   <= bili_pixel_in;
                we_bram_full     <= bili_wea;
            end if;
        end if;
    end process;
end Behavioral;