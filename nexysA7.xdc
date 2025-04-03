#--------------------------------------------------------------------------------------------------
#Nexys4 DDR Master XDC File
#-------------------------------
##Clock signal
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { sys_clk }];
create_clock -add -name sys_clk -period 10.00 -waveform {0.000 5.000} [get_ports { sys_clk }];

## Switches
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { SW[0] }];
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { SW[1] }];
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { SW[2] }];
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { SW[3] }];
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { SW[4] }];
set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { SW[5] }];
set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports { SW[6] }];
set_property -dict { PACKAGE_PIN T3    IOSTANDARD LVCMOS33 } [get_ports { SW[7] }];
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { SW[8] }];
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { SW[9] }];
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { SW[10] }];
set_property -dict { PACKAGE_PIN W10   IOSTANDARD LVCMOS33 } [get_ports { SW[11] }];
set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33 } [get_ports { SW[12] }];
set_property -dict { PACKAGE_PIN V9    IOSTANDARD LVCMOS33 } [get_ports { SW[13] }];
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { SW[14] }];
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { SW[15] }];

## LEDs
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }];
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }];
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }];
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }];
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { LED[4] }];
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { LED[5] }];
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { LED[6] }];
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { LED[7] }];
set_property -dict { PACKAGE_PIN V4    IOSTANDARD LVCMOS33 } [get_ports { LED[8] }];
set_property -dict { PACKAGE_PIN U4    IOSTANDARD LVCMOS33 } [get_ports { LED[9] }];
set_property -dict { PACKAGE_PIN U5    IOSTANDARD LVCMOS33 } [get_ports { LED[10] }];
set_property -dict { PACKAGE_PIN V5    IOSTANDARD LVCMOS33 } [get_ports { LED[11] }];
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMCMOS33 } [get_ports { LED[12] }];
set_property -dict { PACKAGE_PIN U7    IOSTANDARD LVCMOS33 } [get_ports { LED[13] }];
set_property -dict { PACKAGE_PIN U1    IOSTANDARD LVCMOS33 } [get_ports { LED[14] }];
set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports { LED[15] }];

## Buttons
set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 PULLUP true } [get_ports { BTN[0] }];
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 PULLUP true } [get_ports { BTN[1] }];
set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 PULLUP true } [get_ports { BTN[2] }];
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 PULLUP true } [get_ports { BTN[3] }];
set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 PULLUP true } [get_ports { BTN[4] }];

## 7 segment display
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { seg7[0] }];
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { seg7[1] }];
set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { seg7[2] }];
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { seg7[3] }];
set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { seg7[4] }];
set_property -dict { PACKAGE_PIN J16   IOSTANDARD LVCMOS33 } [get_ports { seg7[5] }];
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { seg7[6] }];
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { seg7[7] }];

set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { an[0] }];
set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { an[1] }];
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { an[2] }];
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { an[3] }];
set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { an[4] }];
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { an[5] }];
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { an[6] }];
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { an[7] }];

## Tri-color LEDs
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { LED1_R }];
set_property -dict { PACKAGE_PIN R11   IOSTANDARD LVCMOS33 } [get_ports { LED1_G }];
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { LED1_B }];
set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33 } [get_ports { LED2_R }];
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { LED2_G }];
set_property -dict { PACKAGE_PIN G16   IOSTANDARD LVCMOS33 } [get_ports { LED2_B }];

## Audio Codec
set_property -dict { PACKAGE_PIN A11   IOSTANDARD LVCMOS33 } [get_ports { AUD_PWM }];

## VGA
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[0] }];
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[1] }];
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[2] }];
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[0] }];
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[1] }];
set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[2] }];
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[0] }];
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[1] }];
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[2] }];
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { VGA_HS }];
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { VGA_VS }];

## USB-UART
set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { UART_RXD }];
set_property -dict { PACKAGE_PIN C4    IOSTANDARD LVCMOS33 } [get_ports { UART_TXD }];

## Ethernet
set_property -dict { PACKAGE_PIN A9    IOSTANDARD LVCMOS33 } [get_ports { ETH_MDO }];
set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { ETH_MDC }];
set_property -dict { PACKAGE_PIN B3    IOSTANDARD LVCMOS33 } [get_ports { ETH_RSTN }];
set_property -dict { PACKAGE_PIN D10   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXD[1] }];
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXD[0] }];
set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { ETH_RX_ER }];
set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { ETH_TXD[0] }];
set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { ETH_TXD[1] }];
set_property -dict { PACKAGE_PIN B9    IOSTANDARD LVCMOS33 } [get_ports { ETH_TX_EN }];
set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { ETH_CRS_DV }];
set_property -dict { PACKAGE_PIN B8    IOSTANDARD LVCMOS33 } [get_ports { ETH_INTN }];
set_property -dict { PACKAGE_PIN D5    IOSTANDARD LVCMOS33 } [get_ports { ETH_CLK }];

## USB HID
set_property -dict { PACKAGE_PIN B2    IOSTANDARD LVCMOS33 PULLUP true } [get_ports { PS2_CLK }];
set_property -dict { PACKAGE_PIN F4    IOSTANDARD LVCMOS33 PULLUP true } [get_ports { PS2_DATA }];

## Microphone
set_property -dict { PACKAGE_PIN A17   IOSTANDARD LVCMOS33 } [get_ports { MIC_DATA }];
set_property -dict { PACKAGE_PIN A12   IOSTANDARD LVCMOS33 } [get_ports { MIC_LRSEL }];
set_property -dict { PACKAGE_PIN B13   IOSTANDARD LVCMOS33 } [get_ports { MIC_CLK }];

## Accelerometer
set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { ACC_SCL }];
set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { ACC_SDA }];

## Quad SPI Flash
set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVCMOS33 } [get_ports { QSPI_CS }];
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[0] }];
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[1] }];
set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[2] }];
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[3] }];
set_property -dict { PACKAGE_PIN E9    IOSTANDARD LVCMOS33 } [get_ports { QSPI_SCK }];

## SD Card
set_property -dict { PACKAGE_PIN M2    IOSTANDARD LVCMOS33 } [get_ports { SD_DATA[0] }];
set_property -dict { PACKAGE_PIN M1    IOSTANDARD LVCMOS33 } [get_ports { SD_DATA[1] }];
set_property -dict { PACKAGE_PIN L3    IOSTANDARD LVCMOS33 } [get_ports { SD_DATA[2] }];
set_property -dict { PACKAGE_PIN L2    IOSTANDARD LVCMOS33 } [get_ports { SD_DATA[3] }];
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { SD_CMD }];
set_property -dict { PACKAGE_PIN J1    IOSTANDARD LVCMOS33 } [get_ports { SD_CLK }];

##Temp Sensor
set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { TMP_SCL }];
set_property -dict { PACKAGE_PIN A9    IOSTANDARD LVCMOS33 } [get_ports { TMP_SDA }];

##Pmod A
set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { PmodA_0 }];
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { PmodA_1 }];
set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { PmodA_2 }];
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { PmodA_3 }];
set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { PmodA_4 }];
set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { PmodA_5 }];
set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports { PmodA_6 }];
set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { PmodA_7 }];

##Pmod B
set_property -dict { PACKAGE_PIN D14   IOSTANDARD LVCMOS33 } [get_ports { PmodB_0 }];
set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { PmodB_1 }];
set_property -dict { PACKAGE_PIN G16   IOSTANDARD LVCMOS33 } [get_ports { PmodB_2 }];
set_property -dict { PACKAGE_PIN H14   IOSTANDARD LVCMOS33 } [get_ports { PmodB_3 }];
set_property -dict { PACKAGE_PIN E16   IOSTANDARD LVCMOS33 } [get_ports { PmodB_4 }];
set_property -dict { PACKAGE_PIN F13   IOSTANDARD LVCMOS33 } [get_ports { P