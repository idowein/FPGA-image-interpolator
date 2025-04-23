vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/blk_mem_gen_v8_4_4

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap blk_mem_gen_v8_4_4 modelsim_lib/msim/blk_mem_gen_v8_4_4

vlog -work xpm -64 -incr -sv "+incdir+../../../../OV7670_VGA.srcs/sources_1/bd/design_1/ipshared/4fba" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_ov7670_controller_0_0_1/sim/design_1_ov7670_controller_0_0.vhd" \
"../../../bd/design_1/ip/design_1_cntl_0_0_1/sim/design_1_cntl_0_0.vhd" \
"../../../bd/design_1/ip/design_1_ovo_7670_caputre_0_0_1/sim/design_1_ovo_7670_caputre_0_0.vhd" \
"../../../bd/design_1/ip/design_1_vga_0_0_1/sim/design_1_vga_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_4 -64 -incr "+incdir+../../../../OV7670_VGA.srcs/sources_1/bd/design_1/ipshared/4fba" \
"../../../../OV7670_VGA.srcs/sources_1/bd/design_1/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../OV7670_VGA.srcs/sources_1/bd/design_1/ipshared/4fba" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_0_1/sim/design_1_blk_mem_gen_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0_1/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0_1/design_1_clk_wiz_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/sim/design_1.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

