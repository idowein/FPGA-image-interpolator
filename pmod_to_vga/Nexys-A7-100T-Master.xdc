
## Josh Olvik
## Pin assignment
## Revison A
# Clock signal



##VGA Connector
set_property PACKAGE_PIN A3 [get_ports {vga_red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[0]}]

set_property PACKAGE_PIN B4 [get_ports {vga_red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[1]}]

set_property PACKAGE_PIN C5 [get_ports {vga_red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[2]}]

set_property PACKAGE_PIN A4 [get_ports {vga_red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[3]}]

set_property PACKAGE_PIN B7 [get_ports {vga_blue[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[0]}]

set_property PACKAGE_PIN C7 [get_ports {vga_blue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[1]}]

set_property PACKAGE_PIN D7 [get_ports {vga_blue[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[2]}]

set_property PACKAGE_PIN D8 [get_ports {vga_blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[3]}]

set_property PACKAGE_PIN C6 [get_ports {vga_green[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[0]}]

set_property PACKAGE_PIN A5 [get_ports {vga_green[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[1]}]

set_property PACKAGE_PIN B6 [get_ports {vga_green[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[2]}]

set_property PACKAGE_PIN A6 [get_ports {vga_green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[3]}]

set_property PACKAGE_PIN B11 [get_ports VGA_H_sync]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_H_sync]

set_property PACKAGE_PIN B12 [get_ports vga_V_sync]
set_property IOSTANDARD LVCMOS33 [get_ports vga_V_sync]



set_property PACKAGE_PIN H17 [get_ports config_finished]
set_property IOSTANDARD LVCMOS33 [get_ports config_finished]

##Buttons
#set_property PACKAGE_PIN V10 [get_ports resend_in]
#set_property IOSTANDARD LVCMOS33 [get_ports resend_in]

#set_property PACKAGE_PIN U11 [get_ports cntl_in]
#set_property IOSTANDARD LVCMOS33 [get_ports cntl_in]

set_property PACKAGE_PIN U12 [get_ports zoom]
set_property IOSTANDARD LVCMOS33 [get_ports zoom]


##Pmod Header JD

set_property PACKAGE_PIN G4 [get_ports pclk]
set_property IOSTANDARD LVCMOS33 [get_ports pclk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pclk]


set_property PACKAGE_PIN G2 [get_ports camera_v_sync]
set_property IOSTANDARD LVCMOS33 [get_ports camera_v_sync]


set_property PACKAGE_PIN F3 [get_ports sioc]
set_property IOSTANDARD LVCMOS33 [get_ports sioc]
set_property PULLUP true [get_ports sioc]


set_property PACKAGE_PIN H1 [get_ports xclk]
set_property IOSTANDARD LVCMOS33 [get_ports xclk]


set_property PACKAGE_PIN G1 [get_ports camera_h_ref]
set_property IOSTANDARD LVCMOS33 [get_ports camera_h_ref]


set_property PACKAGE_PIN G3 [get_ports siod]
set_property IOSTANDARD LVCMOS33 [get_ports siod]
set_property PULLUP true [get_ports siod]


set_property PACKAGE_PIN H2 [get_ports {din[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[6]}]


set_property PACKAGE_PIN H4 [get_ports {din[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[7]}]

## P-mod JC
set_property PACKAGE_PIN E7 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]


set_property PACKAGE_PIN K1 [get_ports pwdn]
set_property IOSTANDARD LVCMOS33 [get_ports pwdn]


set_property PACKAGE_PIN F6 [get_ports {din[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[0]}]


set_property PACKAGE_PIN J2 [get_ports {din[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[2]}]


set_property PACKAGE_PIN G6 [get_ports {din[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[4]}]



set_property PACKAGE_PIN J3 [get_ports {din[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[1]}]


set_property PACKAGE_PIN J4 [get_ports {din[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[3]}]

set_property PACKAGE_PIN E6 [get_ports {din[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[5]}]

#############################################################
#############################################################


### OV7670 Camera Module Pin Mapping to PMOD JC and JD ##

### Power and Ground Pins
#set_property PACKAGE_PIN VCC_PIN [get_ports { VCC }];  # Connect to 3.3V power supply
#set_property PACKAGE_PIN GND_PIN [get_ports { GND }];  # Connect to ground

### Two-Wire Serial Interface (I2C)
#set_property -dict { PACKAGE_PIN K1 IOSTANDARD LVCMOS33 } [get_ports { SCL }];  # I2C Clock (SCL) - JC1
#set_property -dict { PACKAGE_PIN F6 IOSTANDARD LVCMOS33 } [get_ports { SDATA }];  # I2C Data (SDA) - JC2

### Camera Control Signals
#set_property -dict { PACKAGE_PIN J2 IOSTANDARD LVCMOS33 } [get_ports { VSYNC }];  # Vertical Sync - JC3
#set_property -dict { PACKAGE_PIN G6 IOSTANDARD LVCMOS33 } [get_ports { HREF }];  # Horizontal Reference - JC4
#set_property -dict { PACKAGE_PIN E7 IOSTANDARD LVCMOS33 } [get_ports { PCLK }];  # Pixel Clock - JC7
#set_property -dict { PACKAGE_PIN J3 IOSTANDARD LVCMOS33 } [get_ports { XCLK }];  # Master Clock - JC8

### Pixel Data Outputs
#set_property -dict { PACKAGE_PIN H4 IOSTANDARD LVCMOS33 } [get_ports { DOUT9 }];  # Pixel Data Output 9 (MSB) - JD1
#set_property -dict { PACKAGE_PIN H1 IOSTANDARD LVCMOS33 } [get_ports { DOUT8 }];  # Pixel Data Output 8 - JD2
#set_property -dict { PACKAGE_PIN G1 IOSTANDARD LVCMOS33 } [get_ports { DOUT7 }];  # Pixel Data Output 7 - JD3
#set_property -dict { PACKAGE_PIN G3 IOSTANDARD LVCMOS33 } [get_ports { DOUT6 }];  # Pixel Data Output 6 - JD4
#set_property -dict { PACKAGE_PIN H2 IOSTANDARD LVCMOS33 } [get_ports { DOUT5 }];  # Pixel Data Output 5 - JD7
#set_property -dict { PACKAGE_PIN G4 IOSTANDARD LVCMOS33 } [get_ports { DOUT4 }];  # Pixel Data Output 4 - JD8
#set_property -dict { PACKAGE_PIN G2 IOSTANDARD LVCMOS33 } [get_ports { DOUT3 }];  # Pixel Data Output 3 - JD9
#set_property -dict { PACKAGE_PIN F3 IOSTANDARD LVCMOS33 } [get_ports { DOUT2 }];  # Pixel Data Output 2 (LSB) - JD10


##############################################################
##############################################################

set_property IOSTANDARD LVCMOS33 [get_ports clk_in1]
set_property PACKAGE_PIN E3 [get_ports clk_in1]

set_property IOSTANDARD LVCMOS33 [get_ports resend_in]
set_property IOSTANDARD LVCMOS33 [get_ports cntl_in]
set_property PACKAGE_PIN U11 [get_ports resend_in]
set_property PACKAGE_PIN V10 [get_ports cntl_in]
