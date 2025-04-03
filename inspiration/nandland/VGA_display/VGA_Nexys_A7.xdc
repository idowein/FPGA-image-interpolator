#--------------------------------------------------------------------------------------------------
# Nexys4 DDR Master XDC File - Adapted for your VGA Design
#-------------------------------
## Clock signal
create_clock -period 40.000 [get_ports i_Clk]  ; # 25 MHz clock

set_property IOSTANDARD LVCMOS33 [get_ports i_Clk]
set_property PACKAGE_PIN E3 [get_ports i_Clk]  ; #  Clock pin on Nexys4 DDR

## ================== VGA Sync Pulses Constraints ==================   
set_property IOSTANDARD LVCMOS33 [get_ports o_HSync]
set_property PACKAGE_PIN T9 [get_ports o_HSync] ; # VGA_HS

set_property IOSTANDARD LVCMOS33 [get_ports o_VSync]
set_property PACKAGE_PIN R15 [get_ports o_VSync] ; # VGA_VS

# o_Col_Count and o_Row_Count are internal signals, usually don't need direct pin constraints. 
# If you need to observe them on external pins for debugging, assign pins here.  
# Otherwise, you can comment these out.
# For example (replace with actual pins if needed):
# set_property IOSTANDARD LVCMOS33 [get_ports o_Col_Count[9]]
# set_property PACKAGE_PIN A1 [get_ports o_Col_Count[9]]
# set_property IOSTANDARD LVCMOS33 [get_ports o_Col_Count[8]]
# set_property PACKAGE_PIN B1 [get_ports o_Col_Count[8]]
# ...and so on for the rest of the bits.
# Same for o_Row_Count.  If you don't need them externally, REMOVE these lines.
# set_property IOSTANDARD LVCMOS33 [get_ports o_Row_Count[9]]
# set_property PACKAGE_PIN C1 [get_ports o_Row_Count[9]]
# set_property IOSTANDARD LVCMOS33 [get_ports o_Row_Count[8]]
# set_property PACKAGE_PIN D1 [get_ports o_Row_Count[8]]


## ================== Test Pattern Generator Constraints ==================   
# i_Pattern is an *input* to your Test_Pattern_Gen module.  
# You'll need to decide which input (switches, buttons, etc.) on the Nexys4 DDR you want to use to control the pattern.
# I'll use switches SW[3:0] as an example.  Adjust as needed.
set_property IOSTANDARD LVCMOS33 [get_ports i_Pattern[3]]
set_property PACKAGE_PIN V15 [get_ports i_Pattern[3]]  ; # SW[3]
set_property IOSTANDARD LVCMOS33 [get_ports i_Pattern[2]]
set_property PACKAGE_PIN V14 [get_ports i_Pattern[2]]  ; # SW[2]
set_property IOSTANDARD LVCMOS33 [get_ports i_Pattern[1]]
set_property PACKAGE_PIN V16 [get_ports i_Pattern[1]]  ; # SW[1]
set_property IOSTANDARD LVCMOS33 [get_ports i_Pattern[0]]
set_property PACKAGE_PIN V17 [get_ports i_Pattern[0]]  ; # SW[0]

set_property IOSTANDARD LVCMOS33 [get_ports o_Red_Video[2]]
set_property PACKAGE_PIN N15 [get_ports o_Red_Video[2]] ; # VGA_R[2]
set_property IOSTANDARD LVCMOS33 [get_ports o_Red_Video[1]]
set_property PACKAGE_PIN P14 [get_ports o_Red_Video[1]] ; # VGA_R[1]
set_property IOSTANDARD LVCMOS33 [get_ports o_Red_Video[0]]
set_property PACKAGE_PIN G14 [get_ports o_Red_Video[0]] ; # VGA_R[0]

set_property IOSTANDARD LVCMOS33 [get_ports o_Grn_Video[2]]
set_property PACKAGE_PIN M16 [get_ports o_Grn_Video[2]] ; # VGA_G[2]
set_property IOSTANDARD LVCMOS33 [get_ports o_Grn_Video[1]]
set_property PACKAGE_PIN N17 [get_ports o_Grn_Video[1]] ; # VGA_G[1]
set_property IOSTANDARD LVCMOS33 [get_ports o_Grn_Video[0]]
set_property PACKAGE_PIN G14 [get_ports o_Grn_Video[0]] ; # VGA_G[0]

set_property IOSTANDARD LVCMOS33 [get_ports o_Blu_Video[2]]
set_property PACKAGE_PIN M18 [get_ports o_Blu_Video[2]] ; # VGA_B[2]
set_property IOSTANDARD LVCMOS33 [get_ports o_Blu_Video[1]]
set_property PACKAGE_PIN P17 [get_ports o_Blu_Video[1]] ; # VGA_B[1]
set_property IOSTANDARD LVCMOS33 [get_ports o_Blu_Video[0]]
set_property PACKAGE_PIN R10 [get_ports o_Blu_Video[0]] ; # VGA_B[0]

## ================== VGA Sync Porch Constraints ==================   
#  These are inputs *to* the VGA_Sync_Porch module.  Where do they come from?
#  In your design, they come from the Test_Pattern_Gen module.  
#  Since they are *internal* connections, you do NOT need to constrain them here.
#  Constraints are for *physical* FPGA pins.  Remove these lines.
#  If you were getting them from external pins, THEN you would constrain them.
#  For example, if i_Red_Video came from some other device connected to the board:
#  set_property IOSTANDARD LVCMOS33 [get_ports i_Red_Video]
#  set_property PACKAGE_PIN <some_pin> [get_ports i_Red_Video]
#  BUT REMOVE THESE if they are internal signals!
# set_property IOSTANDARD LVCMOS33 [get_ports i_Red_Video]
# set_property PACKAGE_PIN XX [get_ports i_Red_Video]

# set_property IOSTANDARD LVCMOS33 [get_ports i_Grn_Video]
# set_property PACKAGE_PIN XX [get_ports i_Grn_Video]

# set_property IOSTANDARD LVCMOS33 [get_ports i_Blu_Video]
# set_property PACKAGE_PIN XX [get_ports i_Blu_Video]

# These are *outputs* from the VGA_Sync_Porch module.  They go to the VGA connector.  KEEP these.
set_property IOSTANDARD LVCMOS33 [get_ports o_HSync]
set_property PACKAGE_PIN T9 [get_ports o_HSync];

set_property IOSTANDARD LVCMOS33 [get_ports o_VSync]
set_property PACKAGE_PIN R15 [get_ports o_VSync];

set_property IOSTANDARD LVCMOS33 [get_ports o_Red_Video[2]]
set_property PACKAGE_PIN N15 [get_ports o_Red_Video[2]] ; # VGA_R[2]
set_property IOSTANDARD LVCMOS33 [get_ports o_Red_Video[1]]
set_property PACKAGE_PIN P14 [get_ports o_Red_Video[1]] ; # VGA_R[1]
set_property IOSTANDARD LVCMOS33 [get_ports o_Red_Video[0]]
set_property PACKAGE_PIN G14 [get_ports o_Red_Video[0]] ; # VGA_R[0]

set_property IOSTANDARD LVCMOS33 [get_ports o_Grn_Video[2]]
set_property PACKAGE_PIN M16 [get_ports o_Grn_Video[2]] ; # VGA_G[2]
set_property IOSTANDARD LVCMOS33 [get_ports o_Grn_Video[1]]
set_property PACKAGE_PIN N17 [get_ports o_Grn_Video[1]] ; # VGA_G[1]
set_property IOSTANDARD LVCMOS33 [get_ports o_Grn_Video[0]]
set_property PACKAGE_PIN G14 [get_ports o_Grn_Video[0]] ; # VGA_G[0]

set_property IOSTANDARD LVCMOS33 [get_ports o_Blu_Video[2]]
set_property PACKAGE_PIN M18 [get_ports o_Blu_Video[2]] ; # VGA_B[2]
set_property IOSTANDARD LVCMOS33 [get_ports o_Blu_Video[1]]
set_property PACKAGE_PIN P17 [get_ports o_Blu_Video[1]] ; # VGA_B[1]
set_property IOSTANDARD LVCMOS33 [get_ports o_Blu_Video[0]]
set_property PACKAGE_PIN R10 [get_ports o_Blu_Video[0]] ; # VGA_B[0]

## ================== Sync to Count Constraints ==================   
# o_Col_Count and o_Row_Count are *outputs* from the Sync_To_Count module, but they are 
# internal to your design (used by VGA_Sync_Porch and Test_Pattern_Gen).  
# Therefore, you do NOT need to constrain them here.  REMOVE these lines unless you
# specifically need to bring them out to physical pins for debugging.
set_property IOSTANDARD LVCMOS33 [get_ports o_Col_Count[*]]
set_property IOSTANDARD LVCMOS33 [get_ports o_Row_Count[*]]