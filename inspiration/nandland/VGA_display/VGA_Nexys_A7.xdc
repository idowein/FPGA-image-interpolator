#VGA Connector
#Bank = 35, Pin name = IO_L8N_T1_AD14N_35,					Sch name = VGA_R0
set_property PACKAGE_PIN A3 [get_ports {o_Red_Video[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Red_Video[0]}]
#Bank = 35, Pin name = IO_L7N_T1_AD6N_35,					Sch name = VGA_R1
set_property PACKAGE_PIN B4 [get_ports {o_Red_Video[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Red_Video[1]}]
#Bank = 35, Pin name = IO_L1N_T0_AD4N_35,					Sch name = VGA_R2
set_property PACKAGE_PIN C5 [get_ports {o_Red_Video[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Red_Video[2]}]
#Bank = 35, Pin name = IO_L8P_T1_AD14P_35,					Sch name = VGA_R3
set_property PACKAGE_PIN A4 [get_ports {o_Red_Video[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Red_Video[3]}]
#Bank = 35, Pin name = IO_L2P_T0_AD12P_35,					Sch name = VGA_B0
set_property PACKAGE_PIN B7 [get_ports {o_Blu_Video[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Blu_Video[0]}]
#Bank = 35, Pin name = IO_L4N_T0_35,						Sch name = VGA_B1
set_property PACKAGE_PIN C7 [get_ports {o_Blu_Video[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Blu_Video[1]}]
#Bank = 35, Pin name = IO_L6N_T0_VREF_35,					Sch name = VGA_B2
set_property PACKAGE_PIN D7 [get_ports {o_Blu_Video[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Blu_Video[2]}]
#Bank = 35, Pin name = IO_L4P_T0_35,						Sch name = VGA_B3
set_property PACKAGE_PIN D8 [get_ports {o_Blu_Video[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Blu_Video[3]}]
#Bank = 35, Pin name = IO_L1P_T0_AD4P_35,					Sch name = VGA_G0
set_property PACKAGE_PIN C6 [get_ports {o_Grn_Video[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Grn_Video[0]}]
#Bank = 35, Pin name = IO_L3N_T0_DQS_AD5N_35,				Sch name = VGA_G1
set_property PACKAGE_PIN A5 [get_ports {o_Grn_Video[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Grn_Video[1]}]
#Bank = 35, Pin name = IO_L2N_T0_AD12N_35,					Sch name = VGA_G2
set_property PACKAGE_PIN B6 [get_ports {o_Grn_Video[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Grn_Video[2]}]
#Bank = 35, Pin name = IO_L3P_T0_DQS_AD5P_35,				Sch name = VGA_G3
set_property PACKAGE_PIN A6 [get_ports {o_Grn_Video[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Grn_Video[3]}]
#Bank = 15, Pin name = IO_L4P_T0_15,						Sch name = VGA_HS
set_property PACKAGE_PIN B11 [get_ports o_HSync]						
	set_property IOSTANDARD LVCMOS33 [get_ports o_HSync]
#Bank = 15, Pin name = IO_L3N_T0_DQS_AD1N_15,				Sch name = VGA_VS
set_property PACKAGE_PIN B12 [get_ports o_VSync]						
	set_property IOSTANDARD LVCMOS33 [get_ports o_VSync]
	
# VGA test generator (SW)
