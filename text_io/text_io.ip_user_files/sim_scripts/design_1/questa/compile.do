vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_bh_write_file_0_0/sim/design_1_bh_write_file_0_0.vhd" \
"../../../bd/design_1/ip/design_1_fpga_exp7_0_0/sim/design_1_fpga_exp7_0_0.vhd" \
"../../../bd/design_1/ip/design_1_bili_0_0/sim/design_1_bili_0_0.vhd" \
"../../../bd/design_1/sim/design_1.vhd" \


