--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
--Date        : Thu Apr 17 19:48:30 2025
--Host        : Ido running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    camera_h_ref : in STD_LOGIC;
    camera_v_sync : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    cntl_in : in STD_LOGIC;
    config_finished : out STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pclk : in STD_LOGIC;
    pwdn : out STD_LOGIC;
    resend_in : in STD_LOGIC;
    reset : out STD_LOGIC;
    resetn : in STD_LOGIC;
    scl : out STD_LOGIC;
    sda : inout STD_LOGIC;
    vga_blue : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_green : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_h_sync : out STD_LOGIC;
    vga_red : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_v_sync : out STD_LOGIC;
    xclk : out STD_LOGIC;
    zoom : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_cntl_0_0 is
  port (
    clk : in STD_LOGIC;
    resend_in : in STD_LOGIC;
    cntl_in : in STD_LOGIC;
    resend_out : out STD_LOGIC;
    cntl_out : out STD_LOGIC
  );
  end component design_1_cntl_0_0;
  component design_1_ov_5640_caputre_0_0 is
  port (
    pclk : in STD_LOGIC;
    camera_v_sync : in STD_LOGIC;
    camera_h_ref : in STD_LOGIC;
    zoom : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addr : out STD_LOGIC_VECTOR ( 18 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 11 downto 0 );
    wr_en : out STD_LOGIC
  );
  end component design_1_ov_5640_caputre_0_0;
  component design_1_clk_wiz_0_0 is
  port (
    resetn : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_vga : out STD_LOGIC;
    clk_reg : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component design_1_clk_wiz_0_0;
  component design_1_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 18 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 11 downto 0 );
    clkb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 18 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component design_1_blk_mem_gen_0_0;
  component design_1_vga_0_0 is
  port (
    pix_clk : in STD_LOGIC;
    cntl : in STD_LOGIC;
    zoom : in STD_LOGIC;
    frame_fix : in STD_LOGIC_VECTOR ( 11 downto 0 );
    vga_h_sync : out STD_LOGIC;
    vga_v_sync : out STD_LOGIC;
    vga_red : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_blue : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_green : out STD_LOGIC_VECTOR ( 3 downto 0 );
    frame_adress : out STD_LOGIC_VECTOR ( 18 downto 0 )
  );
  end component design_1_vga_0_0;
  component design_1_ov5640_controller_0_0 is
  port (
    clk : in STD_LOGIC;
    resend : in STD_LOGIC;
    config_finished : out STD_LOGIC;
    scl : out STD_LOGIC;
    sda : inout STD_LOGIC;
    reset : out STD_LOGIC;
    pwdn : out STD_LOGIC;
    xclk : out STD_LOGIC
  );
  end component design_1_ov5640_controller_0_0;
  signal Net : STD_LOGIC;
  signal camera_h_ref_0_1 : STD_LOGIC;
  signal camera_v_sync_0_1 : STD_LOGIC;
  signal clk_in1_0_1 : STD_LOGIC;
  signal clk_wiz_0_clk_reg : STD_LOGIC;
  signal clk_wiz_0_clk_vga : STD_LOGIC;
  signal cntl_0_cntl_out : STD_LOGIC;
  signal cntl_0_resend_out : STD_LOGIC;
  signal cntl_in_0_1 : STD_LOGIC;
  signal din_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal frame_buffer_doutb : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ov5640_controller_0_config_finished : STD_LOGIC;
  signal ov5640_controller_0_pwdn : STD_LOGIC;
  signal ov5640_controller_0_reset : STD_LOGIC;
  signal ov5640_controller_0_scl : STD_LOGIC;
  signal ov5640_controller_0_xclk : STD_LOGIC;
  signal ov_5640_caputre_0_addr : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal ov_5640_caputre_0_dout : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ov_5640_caputre_0_wr_en : STD_LOGIC;
  signal pclk_0_1 : STD_LOGIC;
  signal resend_in_0_1 : STD_LOGIC;
  signal resetn_0_1 : STD_LOGIC;
  signal vga_0_frame_adress : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal vga_0_vga_H_sync : STD_LOGIC;
  signal vga_0_vga_V_sync : STD_LOGIC;
  signal vga_0_vga_blue : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal vga_0_vga_green : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal vga_0_vga_red : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zoom_0_1 : STD_LOGIC;
  signal NLW_clk_wiz_0_locked_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_in1 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_IN1 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_in1 : signal is "XIL_INTERFACENAME CLK.CLK_IN1, CLK_DOMAIN design_1_clk_in1_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 RST.RESET RST";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of resetn : signal is "xilinx.com:signal:reset:1.0 RST.RESETN RST";
  attribute X_INTERFACE_PARAMETER of resetn : signal is "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  camera_h_ref_0_1 <= camera_h_ref;
  camera_v_sync_0_1 <= camera_v_sync;
  clk_in1_0_1 <= clk_in1;
  cntl_in_0_1 <= cntl_in;
  config_finished <= ov5640_controller_0_config_finished;
  din_0_1(7 downto 0) <= din(7 downto 0);
  pclk_0_1 <= pclk;
  pwdn <= ov5640_controller_0_pwdn;
  resend_in_0_1 <= resend_in;
  reset <= ov5640_controller_0_reset;
  resetn_0_1 <= resetn;
  scl <= ov5640_controller_0_scl;
  vga_blue(3 downto 0) <= vga_0_vga_blue(3 downto 0);
  vga_green(3 downto 0) <= vga_0_vga_green(3 downto 0);
  vga_h_sync <= vga_0_vga_H_sync;
  vga_red(3 downto 0) <= vga_0_vga_red(3 downto 0);
  vga_v_sync <= vga_0_vga_V_sync;
  xclk <= ov5640_controller_0_xclk;
  zoom_0_1 <= zoom;
clk_wiz_0: component design_1_clk_wiz_0_0
     port map (
      clk_in1 => clk_in1_0_1,
      clk_reg => clk_wiz_0_clk_reg,
      clk_vga => clk_wiz_0_clk_vga,
      locked => NLW_clk_wiz_0_locked_UNCONNECTED,
      resetn => resetn_0_1
    );
cntl_0: component design_1_cntl_0_0
     port map (
      clk => clk_in1_0_1,
      cntl_in => cntl_in_0_1,
      cntl_out => cntl_0_cntl_out,
      resend_in => resend_in_0_1,
      resend_out => cntl_0_resend_out
    );
frame_buffer: component design_1_blk_mem_gen_0_0
     port map (
      addra(18 downto 0) => ov_5640_caputre_0_addr(18 downto 0),
      addrb(18 downto 0) => vga_0_frame_adress(18 downto 0),
      clka => pclk_0_1,
      clkb => clk_wiz_0_clk_vga,
      dina(11 downto 0) => ov_5640_caputre_0_dout(11 downto 0),
      doutb(11 downto 0) => frame_buffer_doutb(11 downto 0),
      wea(0) => ov_5640_caputre_0_wr_en
    );
ov5640_controller_0: component design_1_ov5640_controller_0_0
     port map (
      clk => clk_wiz_0_clk_reg,
      config_finished => ov5640_controller_0_config_finished,
      pwdn => ov5640_controller_0_pwdn,
      resend => cntl_0_resend_out,
      reset => ov5640_controller_0_reset,
      scl => ov5640_controller_0_scl,
      sda => sda,
      xclk => ov5640_controller_0_xclk
    );
ov_5640_caputre_0: component design_1_ov_5640_caputre_0_0
     port map (
      addr(18 downto 0) => ov_5640_caputre_0_addr(18 downto 0),
      camera_h_ref => camera_h_ref_0_1,
      camera_v_sync => camera_v_sync_0_1,
      din(7 downto 0) => din_0_1(7 downto 0),
      dout(11 downto 0) => ov_5640_caputre_0_dout(11 downto 0),
      pclk => pclk_0_1,
      wr_en => ov_5640_caputre_0_wr_en,
      zoom => zoom_0_1
    );
vga_0: component design_1_vga_0_0
     port map (
      cntl => cntl_0_cntl_out,
      frame_adress(18 downto 0) => vga_0_frame_adress(18 downto 0),
      frame_fix(11 downto 0) => frame_buffer_doutb(11 downto 0),
      pix_clk => clk_wiz_0_clk_vga,
      vga_blue(3 downto 0) => vga_0_vga_blue(3 downto 0),
      vga_green(3 downto 0) => vga_0_vga_green(3 downto 0),
      vga_h_sync => vga_0_vga_H_sync,
      vga_red(3 downto 0) => vga_0_vga_red(3 downto 0),
      vga_v_sync => vga_0_vga_V_sync,
      zoom => zoom_0_1
    );
end STRUCTURE;
