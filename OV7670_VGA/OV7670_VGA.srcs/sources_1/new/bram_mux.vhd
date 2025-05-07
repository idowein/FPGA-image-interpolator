library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BRAM_MUX is
    Port (
        -- Inputs
        addr_in      : in std_logic_vector(18 downto 0);
        data_in      : in std_logic_vector(11 downto 0);
        write_enable : in std_logic;
        bram_select  : in std_logic; -- 0 = BRAM1, 1 = BRAM2

        -- BRAM1 Ports
        addr_bram1   : out std_logic_vector(18 downto 0);
        data_bram1   : out std_logic_vector(11 downto 0);
        we_bram1     : out std_logic;

        -- BRAM2 Ports
        addr_bram2   : out std_logic_vector(16 downto 0);
        data_bram2   : out std_logic_vector(11 downto 0);
        we_bram2     : out std_logic
    );
end BRAM_MUX;

architecture Behavioral of BRAM_MUX is
begin
    process (addr_in, data_in, write_enable, bram_select)
    begin
        if bram_select = '0' then
            -- Connect to BRAM1
            addr_bram1   <= addr_in;
            data_bram1   <= data_in;
            we_bram1     <= write_enable;

            -- Disconnect BRAM2
            addr_bram2   <= (others => '0');
            data_bram2   <= (others => '0');
            we_bram2     <= '0';
        else
            -- Connect to BRAM2
            addr_bram2   <= addr_in(16 downto 0);
            data_bram2   <= data_in;
            we_bram2     <= write_enable;

            -- Disconnect BRAM1
            addr_bram1   <= (others => '0');
            data_bram1   <= (others => '0');
            we_bram1     <= '0';
        end if;
    end process;
end Behavioral;