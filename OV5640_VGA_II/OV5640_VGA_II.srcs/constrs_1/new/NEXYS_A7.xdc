## OV5640 Camera Interface and VGA Output XDC for Nexys A7-100T

## Clock signal
set_property PACKAGE_PIN E3 [get_ports clk_in]
set_property IOSTANDARD LVCMOS33 [get_ports clk_in]

## Reset Signal
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS33} [get_ports reset]

## OV5640 Camera Interface Signals
set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33} [get_ports pmod_pwdn]      # PWDN (Power Down)
set_property -dict {PACKAGE_PIN F6 IOSTANDARD LVCMOS33} [get_ports pmod_reset_n]  # RESET (Active Low)
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports pmod_pclk]     # Pixel Clock
set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS33} [get_ports pmod_xclk}     # External Clock
set_property -dict {PACKAGE_PIN E7 IOSTANDARD LVCMOS33} [get_ports pmod_href]     # Horizontal Reference Signal
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports pmod_scl]      # I2C Clock
set_property -dict {PACKAGE_PIN E6 IOSTANDARD LVCMOS33} [get_ports pmod_sda]      # I2C Data

## Camera Data Bus (8-bit)
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports {pmod_d[7]}]   # Data Bit 7
set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports {pmod_d[6]}]   # Data Bit 6
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {pmod_d[5]}]   # Data Bit 5
set_property -dict {PACKAGE_PIN G3 IOSTANDARD LVCMOS33} [get_ports {pmod_d[4]}]   # Data Bit 4
set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports {pmod_d[3]}]   # Data Bit 3
set_property -dict {PACKAGE_PIN G4 IOSTANDARD LVCMOS33} [get_ports {pmod_d[2]}]   # Data Bit 2
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {pmod_d[1]}]   # Data Bit 1
set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS33} [get_ports {pmod_d[0]}]   # Data Bit 0

## VGA Output Signals
# Red Channel
set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {vga_r[0]}]
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS33} [get_ports {vga_r[1]}]
set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVCMOS33} [get_ports {vga_r[2]}]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {vga_r[3]}]

# Green Channel
set_property -dict {PACKAGE_PIN C6 IOSTANDARD LVCMOS33} [get_ports {vga_g[0]}]
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS33} [get_ports {vga_g[1]}]
set_property -dict {PACKAGE_PIN B6 IOSTANDARD LVCMOS33} [get_ports {vga_g[2]}]
set_property -dict {PACKAGE_PIN A6 IOSTANDARD LVCMOS33} [get_ports {vga_g[3]}]

# Blue Channel
set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS33} [get_ports {vga_b[0]}]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS33} [get_ports {vga_b[1]}]
set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVCMOS33} [get_ports {vga_b[2]}]
set_property -dict {PACKAGE_PIN D8 IOSTANDARD LVCMOS33} [get_ports {vga_b[3]}]

# VGA Sync Signals
set_property -dict {PACKAGE_PIN B11 IOSTANDARD LVCMOS33} [get_ports vga_hsync]    # Horizontal Sync
set_property -dict {PACKAGE_PIN B12 IOSTANDARD LVCMOS33} [get_ports vga_vsync]    # Vertical Sync