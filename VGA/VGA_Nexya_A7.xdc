# Nexys A7 VGA Constraints - 148.5 MHz

# Clock Input (Adjust clock pin based on your setup)
set_property PACKAGE_PIN E3 [get_ports clk]
create_clock -period 6.734 -name clk -waveform {0.000 3.367} [get_ports clk]  # 148.5 MHz period

# VGA Horizontal Sync
set_property PACKAGE_PIN J1 [get_ports VGA_HS_O]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_HS_O]

# VGA Vertical Sync
set_property PACKAGE_PIN H1 [get_ports VGA_VS_O]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_VS_O]

# VGA Red (4-bit)
set_property PACKAGE_PIN G1 [get_ports VGA_R[0]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_R[0]]
set_property PACKAGE_PIN F1 [get_ports VGA_R[1]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_R[1]]
set_property PACKAGE_PIN E1 [get_ports VGA_R[2]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_R[2]]
set_property PACKAGE_PIN D1 [get_ports VGA_R[3]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_R[3]]

# VGA Green (4-bit)
set_property PACKAGE_PIN H2 [get_ports VGA_G[0]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_G[0]]
set_property PACKAGE_PIN G2 [get_ports VGA_G[1]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_G[1]]
set_property PACKAGE_PIN F2 [get_ports VGA_G[2]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_G[2]]
set_property PACKAGE_PIN E2 [get_ports VGA_G[3]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_G[3]]

# VGA Blue (4-bit)
set_property PACKAGE_PIN C2 [get_ports VGA_B[0]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_B[0]]
set_property PACKAGE_PIN B2 [get_ports VGA_B[1]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_B[1]]
set_property PACKAGE_PIN B1 [get_ports VGA_B[2]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_B[2]]
set_property PACKAGE_PIN A1 [get_ports VGA_B[3]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_B[3]]

# Clock constraints for the generated pxl_clk (if needed)

# Example, if the clk_wiz output is named pxl_clk, and is 148.5 MHz
create_clock -period 6.734 -name pxl_clk [get_pins clk_div_inst/clk_out1]
set_property HD.LOCATED 1 [get_clocks pxl_clk]