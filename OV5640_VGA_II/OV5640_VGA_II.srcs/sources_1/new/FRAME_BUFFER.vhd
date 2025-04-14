-- Frame Buffer: Stores camera pixel data temporarily

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Frame_Buffer is
    Port (
        CLK       : in  STD_LOGIC;                      -- Clock signal
        RESET     : in  STD_LOGIC;                      -- Reset signal
        WRITE_EN  : in  STD_LOGIC;                      -- Write enable
        WRITE_ADDR: in  INTEGER;                        -- Address to write data
        WRITE_DATA: in  STD_LOGIC_VECTOR(7 downto 0);   -- Data to write
        READ_ADDR : in  INTEGER;                        -- Address to read data
        READ_DATA : out STD_LOGIC_VECTOR(7 downto 0)    -- Data read from memory
    );
end Frame_Buffer;

architecture Behavioral of Frame_Buffer is
    type memory_array is array (0 to 307199) of STD_LOGIC_VECTOR(7 downto 0); -- 640x480 resolution
    signal memory : memory_array := (others => (others => '0'));
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                -- Reset all memory
                memory <= (others => (others => '0'));
            elsif WRITE_EN = '1' then
                memory(WRITE_ADDR) <= WRITE_DATA; -- Write data to memory
            end if;
            READ_DATA <= memory(READ_ADDR); -- Read data from memory
        end if;
    end process;
end Behavioral;