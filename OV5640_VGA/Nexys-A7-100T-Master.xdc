## CLK
set_property IOSTANDARD LVCMOS33 [get_ports clk_in1]
set_property PACKAGE_PIN E3 [get_ports clk_in1]  # Assigns clk_in1 to pin E3

## VGA Connector
set_property PACKAGE_PIN A3 [get_ports {vga_red[0]}]  # VGA Red bit 0
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[0]}]

set_property PACKAGE_PIN B4 [get_ports {vga_red[1]}]  # VGA Red bit 1
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[1]}]

set_property PACKAGE_PIN C5 [get_ports {vga_red[2]}]  # VGA Red bit 2
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[2]}]

set_property PACKAGE_PIN A4 [get_ports {vga_red[3]}]  # VGA Red bit 3
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[3]}]

set_property PACKAGE_PIN B7 [get_ports {vga_blue[0]}]  # VGA Blue bit 0
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[0]}]

set_property PACKAGE_PIN C7 [get_ports {vga_blue[1]}]  # VGA Blue bit 1
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[1]}]

set_property PACKAGE_PIN D7 [get_ports {vga_blue[2]}]  # VGA Blue bit 2
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[2]}]

set_property PACKAGE_PIN D8 [get_ports {vga_blue[3]}]  # VGA Blue bit 3
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[3]}]

set_property PACKAGE_PIN C6 [get_ports {vga_green[0]}]  # VGA Green bit 0
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[0]}]

set_property PACKAGE_PIN A5 [get_ports {vga_green[1]}]  # VGA Green bit 1
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[1]}]

set_property PACKAGE_PIN B6 [get_ports {vga_green[2]}]  # VGA Green bit 2
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[2]}]

set_property PACKAGE_PIN A6 [get_ports {vga_green[3]}]  # VGA Green bit 3
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[3]}]

set_property PACKAGE_PIN B11 [get_ports VGA_H_sync]  # VGA Horizontal Sync
set_property IOSTANDARD LVCMOS33 [get_ports VGA_H_sync]

set_property PACKAGE_PIN B12 [get_ports vga_V_sync]  # VGA Vertical Sync
set_property IOSTANDARD LVCMOS33 [get_ports vga_V_sync]

## Configuration Finished
set_property PACKAGE_PIN H17 [get_ports config_finished]  # Configuration Finished Signal
set_property IOSTANDARD LVCMOS33 [get_ports config_finished]

## SW
set_property PACKAGE_PIN U12 [get_ports zoom]  # Zoom switch
set_property IOSTANDARD LVCMOS33 [get_ports zoom]

set_property PACKAGE_PIN V10 [get_ports cntl_in]  # Control input
set_property IOSTANDARD LVCMOS33 [get_ports cntl_in]

set_property PACKAGE_PIN U11 [get_ports resend_in]  # Resend input
set_property IOSTANDARD LVCMOS33 [get_ports resend_in]

set_property PACKAGE_PIN H6 [get_ports resetn]  # Active-low reset
set_property IOSTANDARD LVCMOS33 [get_ports resetn]

## Pmod Header JD
set_property PACKAGE_PIN H4 [get_ports {din[7]}]  # JD[1] - Camera data bit 7
set_property IOSTANDARD LVCMOS33 [get_ports {din[7]}]

set_property PACKAGE_PIN H1 [get_ports din[6]]  # JD[2] - Camera data bit 6
set_property IOSTANDARD LVCMOS33 [get_ports din[6]]

set_property PACKAGE_PIN G1 [get_ports din[5]]  # JD[3] - Camera data bit 5
set_property IOSTANDARD LVCMOS33 [get_ports din[5]]

set_property PACKAGE_PIN G3 [get_ports din[4]]  # JD[4] - Camera data bit 4
set_property IOSTANDARD LVCMOS33 [get_ports din[4]]

set_property PACKAGE_PIN H2 [get_ports {din[3]}]  # JD[7] - Camera data bit 3
set_property IOSTANDARD LVCMOS33 [get_ports {din[3]}]

set_property PACKAGE_PIN G4 [get_ports din[2]]  # JD[8] - Camera data bit 2
set_property IOSTANDARD LVCMOS33 [get_ports din[2]]

set_property PACKAGE_PIN G2 [get_ports din[1]]  # JD[9] - Camera data bit 1
set_property IOSTANDARD LVCMOS33 [get_ports din[1]]

set_property PACKAGE_PIN F3 [get_ports din[0]]  # JD[10] - Camera data bit 0
set_property IOSTANDARD LVCMOS33 [get_ports {din[0]}]

## Pmod Header JC
set_property PACKAGE_PIN K1 [get_ports pwdn]  # JC[1] - Camera power down
set_property IOSTANDARD LVCMOS33 [get_ports pwdn]
set_property PULLDOWN true [get_ports pwdn]  # Prevent floating

set_property PACKAGE_PIN F6 [get_ports reset]  # JC[2] - Camera reset
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PULLDOWN true [get_ports reset]  # Prevent floating

set_property PACKAGE_PIN J2 [get_ports pclk]  # JC[3] - Pixel clock
set_property IOSTANDARD LVCMOS33 [get_ports pclk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pclk]  # Non-dedicated clock pin

set_property PACKAGE_PIN G6 [get_ports xclk]  # JC[4] - External clock
set_property IOSTANDARD LVCMOS33 [get_ports xclk]

set_property PACKAGE_PIN E7 [get_ports camera_h_ref]  # JC[7] - Camera horizontal reference
set_property IOSTANDARD LVCMOS33 [get_ports camera_h_ref]

set_property PACKAGE_PIN J3 [get_ports camera_v_sync]  # JC[8] - Camera vertical sync
set_property IOSTANDARD LVCMOS33 [get_ports camera_v_sync]

## I2C Signals
set_property PACKAGE_PIN J4 [get_ports scl]  # JC[9] - I2C clock
set_property IOSTANDARD LVCMOS33 [get_ports scl]
set_property PULLUP true [get_ports scl]  # I2C pull-up

set_property PACKAGE_PIN E6 [get_ports sda]  # JC[10] - I2C data
set_property IOSTANDARD LVCMOS33 [get_ports sda]
set_property PULLUP true [get_ports sda]  # I2C pull-up