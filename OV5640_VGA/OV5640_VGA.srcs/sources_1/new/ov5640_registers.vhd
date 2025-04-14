library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ov5640_registers is
    Port (
        clk      : in  std_logic;                        -- System clock
        advance  : in  std_logic;                        -- Signal to advance to the next register
        resend   : in  std_logic;                        -- Signal to resend the configuration
        command  : out std_logic_vector(15 downto 0);    -- 16-bit command: [7:0] = value, [15:8] = register
        finished : out std_logic                         -- Signal that the configuration is complete
    );
end ov5640_registers;

architecture Behavioral of ov5640_registers is
    type reg_array is array (0 to 127) of std_logic_vector(15 downto 0); -- Array to store register configurations
    signal registers : reg_array := (
        -- Example: Fill with actual OV5640 initialization values from the datasheet
        x"3103", x"3008", x"3017", x"3018", -- Power-related settings
        x"3037", x"3820", x"3821", x"3814", -- Clock and timing settings
        x"3618", x"3708", x"3709", x"3800", -- Image quality settings
        x"3801", x"3802", x"3803", x"3804", -- More initialization settings
        others => x"0000" -- Fill unused slots with 0s for safety
    );

    signal index     : integer range 0 to registers'high := 0; -- Index to track the current register
    signal complete  : std_logic := '0';                      -- Internal finished flag
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if resend = '1' then
                index <= 0;                  -- Restart configuration if resend is high
                complete <= '0';
            elsif advance = '1' and complete = '0' then
                if index < registers'high then
                    index <= index + 1;      -- Move to the next register
                else
                    complete <= '1';         -- Set finished flag when all registers are done
                end if;
            end if;
        end if;
    end process;

    command <= registers(index);            -- Output the current register and value
    finished <= complete;                   -- Output the finished flag
end Behavioral;