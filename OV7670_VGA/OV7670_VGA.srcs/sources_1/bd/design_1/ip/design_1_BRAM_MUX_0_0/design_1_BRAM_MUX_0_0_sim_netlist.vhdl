-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Wed May  7 22:23:29 2025
-- Host        : Ido running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Users/idowe/Projects/Digital-Zoom-FPGA/OV7670_VGA/OV7670_VGA.srcs/sources_1/bd/design_1/ip/design_1_BRAM_MUX_0_0/design_1_BRAM_MUX_0_0_sim_netlist.vhdl
-- Design      : design_1_BRAM_MUX_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_BRAM_MUX_0_0_BRAM_MUX is
  port (
    addr_bram1 : out STD_LOGIC_VECTOR ( 18 downto 0 );
    data_bram1 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    addr_in : in STD_LOGIC_VECTOR ( 18 downto 0 );
    bram_select : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_BRAM_MUX_0_0_BRAM_MUX : entity is "BRAM_MUX";
end design_1_BRAM_MUX_0_0_BRAM_MUX;

architecture STRUCTURE of design_1_BRAM_MUX_0_0_BRAM_MUX is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \addr_bram1[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \addr_bram1[10]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \addr_bram1[11]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \addr_bram1[12]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \addr_bram1[13]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \addr_bram1[14]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \addr_bram1[15]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \addr_bram1[16]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \addr_bram1[17]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \addr_bram1[18]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \addr_bram1[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \addr_bram1[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \addr_bram1[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \addr_bram1[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \addr_bram1[5]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \addr_bram1[6]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \addr_bram1[7]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \addr_bram1[8]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \addr_bram1[9]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \data_bram1[0]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \data_bram1[10]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \data_bram1[1]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \data_bram1[2]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \data_bram1[3]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \data_bram1[4]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \data_bram1[5]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \data_bram1[6]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \data_bram1[7]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \data_bram1[8]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \data_bram1[9]_INST_0\ : label is "soft_lutpair14";
begin
\addr_bram1[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(0),
      I1 => bram_select,
      O => addr_bram1(0)
    );
\addr_bram1[10]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(10),
      I1 => bram_select,
      O => addr_bram1(10)
    );
\addr_bram1[11]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(11),
      I1 => bram_select,
      O => addr_bram1(11)
    );
\addr_bram1[12]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(12),
      I1 => bram_select,
      O => addr_bram1(12)
    );
\addr_bram1[13]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(13),
      I1 => bram_select,
      O => addr_bram1(13)
    );
\addr_bram1[14]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(14),
      I1 => bram_select,
      O => addr_bram1(14)
    );
\addr_bram1[15]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(15),
      I1 => bram_select,
      O => addr_bram1(15)
    );
\addr_bram1[16]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(16),
      I1 => bram_select,
      O => addr_bram1(16)
    );
\addr_bram1[17]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(17),
      I1 => bram_select,
      O => addr_bram1(17)
    );
\addr_bram1[18]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(18),
      I1 => bram_select,
      O => addr_bram1(18)
    );
\addr_bram1[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(1),
      I1 => bram_select,
      O => addr_bram1(1)
    );
\addr_bram1[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(2),
      I1 => bram_select,
      O => addr_bram1(2)
    );
\addr_bram1[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(3),
      I1 => bram_select,
      O => addr_bram1(3)
    );
\addr_bram1[4]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(4),
      I1 => bram_select,
      O => addr_bram1(4)
    );
\addr_bram1[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(5),
      I1 => bram_select,
      O => addr_bram1(5)
    );
\addr_bram1[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(6),
      I1 => bram_select,
      O => addr_bram1(6)
    );
\addr_bram1[7]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(7),
      I1 => bram_select,
      O => addr_bram1(7)
    );
\addr_bram1[8]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(8),
      I1 => bram_select,
      O => addr_bram1(8)
    );
\addr_bram1[9]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addr_in(9),
      I1 => bram_select,
      O => addr_bram1(9)
    );
\data_bram1[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_in(0),
      I1 => bram_select,
      O => data_bram1(0)
    );
\data_bram1[10]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_in(10),
      I1 => bram_select,
      O => data_bram1(10)
    );
\data_bram1[11]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_in(11),
      I1 => bram_select,
      O => data_bram1(11)
    );
\data_bram1[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_in(1),
      I1 => bram_select,
      O => data_bram1(1)
    );
\data_bram1[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_in(2),
      I1 => bram_select,
      O => data_bram1(2)
    );
\data_bram1[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_in(3),
      I1 => bram_select,
      O => data_bram1(3)
    );
\data_bram1[4]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_in(4),
      I1 => bram_select,
      O => data_bram1(4)
    );
\data_bram1[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_in(5),
      I1 => bram_select,
      O => data_bram1(5)
    );
\data_bram1[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_in(6),
      I1 => bram_select,
      O => data_bram1(6)
    );
\data_bram1[7]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_in(7),
      I1 => bram_select,
      O => data_bram1(7)
    );
\data_bram1[8]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_in(8),
      I1 => bram_select,
      O => data_bram1(8)
    );
\data_bram1[9]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_in(9),
      I1 => bram_select,
      O => data_bram1(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_BRAM_MUX_0_0 is
  port (
    addr_in : in STD_LOGIC_VECTOR ( 18 downto 0 );
    data_in : in STD_LOGIC_VECTOR ( 11 downto 0 );
    write_enable : in STD_LOGIC;
    bram_select : in STD_LOGIC;
    addr_bram1 : out STD_LOGIC_VECTOR ( 18 downto 0 );
    data_bram1 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    we_bram1 : out STD_LOGIC;
    addr_bram2 : out STD_LOGIC_VECTOR ( 16 downto 0 );
    data_bram2 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    we_bram2 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_BRAM_MUX_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_BRAM_MUX_0_0 : entity is "design_1_BRAM_MUX_0_0,BRAM_MUX,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_BRAM_MUX_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_BRAM_MUX_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of design_1_BRAM_MUX_0_0 : entity is "BRAM_MUX,Vivado 2019.2";
end design_1_BRAM_MUX_0_0;

architecture STRUCTURE of design_1_BRAM_MUX_0_0 is
begin
U0: entity work.design_1_BRAM_MUX_0_0_BRAM_MUX
     port map (
      addr_bram1(18 downto 0) => addr_bram1(18 downto 0),
      addr_in(18 downto 0) => addr_in(18 downto 0),
      bram_select => bram_select,
      data_bram1(11 downto 0) => data_bram1(11 downto 0),
      data_in(11 downto 0) => data_in(11 downto 0)
    );
\addr_bram2[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(0),
      O => addr_bram2(0)
    );
\addr_bram2[10]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(10),
      O => addr_bram2(10)
    );
\addr_bram2[11]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(11),
      O => addr_bram2(11)
    );
\addr_bram2[12]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(12),
      O => addr_bram2(12)
    );
\addr_bram2[13]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(13),
      O => addr_bram2(13)
    );
\addr_bram2[14]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(14),
      O => addr_bram2(14)
    );
\addr_bram2[15]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(15),
      O => addr_bram2(15)
    );
\addr_bram2[16]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(16),
      O => addr_bram2(16)
    );
\addr_bram2[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(1),
      O => addr_bram2(1)
    );
\addr_bram2[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(2),
      O => addr_bram2(2)
    );
\addr_bram2[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(3),
      O => addr_bram2(3)
    );
\addr_bram2[4]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(4),
      O => addr_bram2(4)
    );
\addr_bram2[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(5),
      O => addr_bram2(5)
    );
\addr_bram2[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(6),
      O => addr_bram2(6)
    );
\addr_bram2[7]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(7),
      O => addr_bram2(7)
    );
\addr_bram2[8]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(8),
      O => addr_bram2(8)
    );
\addr_bram2[9]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => addr_in(9),
      O => addr_bram2(9)
    );
\data_bram2[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => data_in(0),
      O => data_bram2(0)
    );
\data_bram2[10]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => data_in(10),
      O => data_bram2(10)
    );
\data_bram2[11]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => data_in(11),
      O => data_bram2(11)
    );
\data_bram2[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => data_in(1),
      O => data_bram2(1)
    );
\data_bram2[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => data_in(2),
      O => data_bram2(2)
    );
\data_bram2[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => data_in(3),
      O => data_bram2(3)
    );
\data_bram2[4]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => data_in(4),
      O => data_bram2(4)
    );
\data_bram2[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => data_in(5),
      O => data_bram2(5)
    );
\data_bram2[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => data_in(6),
      O => data_bram2(6)
    );
\data_bram2[7]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => data_in(7),
      O => data_bram2(7)
    );
\data_bram2[8]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => data_in(8),
      O => data_bram2(8)
    );
\data_bram2[9]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => data_in(9),
      O => data_bram2(9)
    );
we_bram1_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => write_enable,
      I1 => bram_select,
      O => we_bram1
    );
we_bram2_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bram_select,
      I1 => write_enable,
      O => we_bram2
    );
end STRUCTURE;
