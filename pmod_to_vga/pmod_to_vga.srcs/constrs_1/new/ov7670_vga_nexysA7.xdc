## OV7670 Camera Module Pin Mapping to PMOD JC and JD ##
## Signal names are aligned with the block diagram, and comments indicate their corresponding names in the OV7670 spec ##

###########################################################################################
#################################### Clock Signals ########################################
###########################################################################################

# clk_in
set_property PACKAGE_PIN E3 [get_ports { clk_in }];  # System clock input (e.g., 100 MHz)
set_property IOSTANDARD LVCMOS33 [get_ports { clk_in }];

# XCLK (Master Clock into Sensor) -> Pin 8 on OV7670 spec
set_property PACKAGE_PIN J3 [get_ports { xclk }];  # JC8
set_property IOSTANDARD LVCMOS33 [get_ports { xclk }];

## Reset Signals
# Reset signal for the system -> Not part of OV7670 spec but used in block diagram
set_property PACKAGE_PIN C12 [get_ports { reset }];  # System reset input
set_property IOSTANDARD LVCMOS33 [get_ports { reset }];

## OV7670 Camera Signals
# PCLK (Pixel Clock output from sensor) -> Pin 7 on OV7670 spec
set_property PACKAGE_PIN H4 [get_ports { pclk }];  # JD1
set_property IOSTANDARD LVCMOS33 [get_ports { pclk }];

# VSYNC (Frame Valid; indicates active frame) -> Pin 5 on OV7670 spec
set_property PACKAGE_PIN J2 [get_ports { camera_y_sync }];  # JC3
set_property IOSTANDARD LVCMOS33 [get_ports { camera_y_sync }];

# HREF (Line/Data Valid; indicates active pixels) -> Pin 6 on OV7670 spec
set_property PACKAGE_PIN G6 [get_ports { camera_h_ref }];  # JC4
set_property IOSTANDARD LVCMOS33 [get_ports { camera_h_ref }];

## Pixel Data Outputs
# DOUT7 (Pixel Data Output 7) -> Pin 11 on OV7670 spec
set_property PACKAGE_PIN H2 [get_ports { din[7] }];  # JD7
set_property IOSTANDARD LVCMOS33 [get_ports { din[7] }];

# DOUT6 (Pixel Data Output 6) -> Pin 12 on OV7670 spec
set_property PACKAGE_PIN G4 [get_ports { din[6] }];  # JD8
set_property IOSTANDARD LVCMOS33 [get_ports { din[6] }];

# DOUT5 (Pixel Data Output 5) -> Pin 13 on OV7670 spec
set_property PACKAGE_PIN G2 [get_ports { din[5] }];  # JD9
set_property IOSTANDARD LVCMOS33 [get_ports { din[5] }];

# DOUT4 (Pixel Data Output 4) -> Pin 14 on OV7670 spec
set_property PACKAGE_PIN F3 [get_ports { din[4] }];  # JD10
set_property IOSTANDARD LVCMOS33 [get_ports { din[4] }];

# DOUT3 (Pixel Data Output 3) -> Pin 15 on OV7670 spec
set_property PACKAGE_PIN G3 [get_ports { din[3] }];  # JD4
set_property IOSTANDARD LVCMOS33 [get_ports { din[3] }];

# DOUT2 (Pixel Data Output 2 - LSB) -> Pin 16 on OV7670 spec
set_property PACKAGE_PIN H5 [get_ports { din[2] }];  # JD5
set_property IOSTANDARD LVCMOS33 [get_ports { din[2] }];

## Two-Wire Serial Interface (I2C)
# SCL (Two-Wire Serial Interface Clock) -> Pin 3 on OV7670 spec
set_property PACKAGE_PIN K1 [get_ports { scl }];  # JC1
set_property IOSTANDARD LVCMOS33 [get_ports { scl }];

# SDATA (Two-Wire Serial Interface Data I/O) -> Pin 4 on OV7670 spec
set_property PACKAGE_PIN F6 [get_ports { sda }];  # JC2
set_property IOSTANDARD LVCMOS33 [get_ports { sda }];

## Power and Ground Pins
# VCC (3.3V power supply) -> Pin 1 on OV7670 spec
set_property PACKAGE_PIN VCC_PIN [get_ports { VCC }];  # Connect to the 3.3V power supply

# GND (Ground) -> Pin 2 on OV7670 spec
set_property PACKAGE_PIN GND_PIN [get_ports { GND }];  # Connect to ground