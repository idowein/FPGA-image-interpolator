-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_ov7670_controller_0_0_1/sim/design_1_ov7670_controller_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_cntl_0_0_1/sim/design_1_cntl_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_ovo_7670_caputre_0_0_1/sim/design_1_ovo_7670_caputre_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_vga_0_0_1/sim/design_1_vga_0_0.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../../OV7670_VGA.srcs/sources_1/bd/design_1/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_blk_mem_gen_0_0_1/sim/design_1_blk_mem_gen_0_0.v" \
  "../../../bd/design_1/ip/design_1_clk_wiz_0_0_1/design_1_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/design_1/ip/design_1_clk_wiz_0_0_1/design_1_clk_wiz_0_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/sim/design_1.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

