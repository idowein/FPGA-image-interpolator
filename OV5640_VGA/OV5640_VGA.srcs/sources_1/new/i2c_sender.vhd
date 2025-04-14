library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity i2c_sender is
    Port (
        clk   : in  std_logic;                        -- System clock
        send  : in  std_logic;                        -- Signal to start sending I2C data
        taken : out std_logic;                        -- Signal to indicate data was sent
        id    : in  std_logic_vector(7 downto 0);     -- I2C device address
        reg   : in  std_logic_vector(7 downto 0);     -- Register address
        value : in  std_logic_vector(7 downto 0);     -- Data to write to the register
        siod  : inout std_logic;                      -- I2C data line
        sioc  : out std_logic                         -- I2C clock line
    );
end i2c_sender;

architecture Behavioral of i2c_sender is
    type state_type is (IDLE, START, DEVICE_ADDR, REG_ADDR, DATA, STOP);
    signal state    : state_type := IDLE;            -- FSM state
    signal clk_div  : integer := 0;                  -- Clock divider for I2C timing
    signal bit_cnt  : integer range 0 to 7 := 0;     -- Bit counter for I2C data
    signal data_out : std_logic_vector(7 downto 0);  -- Data being sent over I2C
    signal ack      : std_logic := '0';              -- Acknowledgment signal
    signal siod_dir : std_logic := '0';              -- Direction of the SIOD line (1 = output, 0 = input)
begin
    process(clk)
    begin
        if rising_edge(clk) then
            clk_div <= clk_div + 1;
            if clk_div = 100 then -- Adjust for the desired I2C clock frequency
                clk_div <= 0;

                case state is
                    when IDLE =>
                        siod_dir <= '1';            -- Set SIOD as output
                        sioc <= '1';                -- Keep SIOC high in IDLE
                        if send = '1' then
                            state <= START;
                        end if;

                    when START =>
                        siod <= '0';                -- Generate START condition
                        sioc <= '1';
                        state <= DEVICE_ADDR;
                        data_out <= id;             -- Load device address

                    when DEVICE_ADDR =>
                        sioc <= '0';                -- Clock low
                        siod <= data_out(7 - bit_cnt); -- Send MSB first
                        sioc <= '1';                -- Clock high
                        if bit_cnt = 7 then
                            state <= REG_ADDR;
                            data_out <= reg;        -- Load register address
                            bit_cnt <= 0;
                        else
                            bit_cnt <= bit_cnt + 1;
                        end if;

                    when REG_ADDR =>
                        sioc <= '0';                -- Clock low
                        siod <= data_out(7 - bit_cnt); -- Send MSB first
                        sioc <= '1';                -- Clock high
                        if bit_cnt = 7 then
                            state <= DATA;
                            data_out <= value;      -- Load data to write
                            bit_cnt <= 0;
                        else
                            bit_cnt <= bit_cnt + 1;
                        end if;

                    when DATA =>
                        sioc <= '0';                -- Clock low
                        siod <= data_out(7 - bit_cnt); -- Send MSB first
                        sioc <= '1';                -- Clock high
                        if bit_cnt = 7 then
                            state <= STOP;
                            bit_cnt <= 0;
                        else
                            bit_cnt <= bit_cnt + 1;
                        end if;

                    when STOP =>
                        siod <= '1';                -- Generate STOP condition
                        sioc <= '1';
                        taken <= '1';               -- Signal that data is sent
                        state <= IDLE;
                    when others =>
                        state <= IDLE;
                end case;
            end if;
        end if;
    end process;

    -- Set SIOD line as input or output based on the direction
    siod <= 'Z' when siod_dir = '0' else siod;
end Behavioral;