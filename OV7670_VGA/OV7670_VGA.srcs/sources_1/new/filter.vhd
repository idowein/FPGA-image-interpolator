----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2025 10:41:03 PM
-- Design Name: 
-- Module Name: filter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_signed.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


use ieee.fixed_pkg.all;
 
entity Filter is
  generic (
    --g_Variable : integer := 10
        g_fixInt : integer := 10; --N bits infront of the point
        g_fixDec : integer := 12; --N bits after the point
        g_FilterCoef : integer := 21; -- Number of filter coefficients
         
        --these must be smaller than g_fixInt
        g_InputBits : integer := 8; --Number of bits in the input std_logic_vector
        g_OutputBits : integer := 8 --Number of bits in the output std_logic_vector
    );
    port 
    (
        clk     : in std_logic;
        reset   :   in  std_logic;
         
        signal_in_int : in std_logic_vector(g_InputBits-1 downto 0);
        signal_out_int : out std_logic_vector(g_OutputBits-1 downto 0)
         
    );
 
end entity;
 
architecture rtl of Filter is
 
type Filter_type is array (0 to g_FilterCoef-1) of sfixed (g_fixInt-1 downto -1*g_fixDec);
type IterBuffer is array (0 to g_FilterCoef-1) of sfixed (g_fixInt-1 downto -1*g_fixDec);
 
--Place here the list of coefficients (Filter Kernel)
signal Filter : Filter_type :=
(  
0   =>to_sfixed (-0.000164, g_fixInt-1,-1*g_fixDec),
1   =>to_sfixed (-0.001286, g_fixInt-1,-1*g_fixDec),
2   =>to_sfixed (0.000000, g_fixInt-1,-1*g_fixDec),
3   =>to_sfixed (0.008320, g_fixInt-1,-1*g_fixDec),
4   =>to_sfixed (0.010323, g_fixInt-1,-1*g_fixDec),
5   =>to_sfixed (-0.019086, g_fixInt-1,-1*g_fixDec),
6   =>to_sfixed (-0.054476, g_fixInt-1,-1*g_fixDec),
7   =>to_sfixed (0.000000, g_fixInt-1,-1*g_fixDec),
8   =>to_sfixed (0.185697, g_fixInt-1,-1*g_fixDec),
9   =>to_sfixed (0.370673, g_fixInt-1,-1*g_fixDec),
10  =>to_sfixed (0.370673, g_fixInt-1,-1*g_fixDec),
11  =>to_sfixed (0.185697, g_fixInt-1,-1*g_fixDec),
12  =>to_sfixed (0.000000, g_fixInt-1,-1*g_fixDec),
13  =>to_sfixed (-0.054476, g_fixInt-1,-1*g_fixDec),
14  =>to_sfixed (-0.019086, g_fixInt-1,-1*g_fixDec),
15  =>to_sfixed (0.010323, g_fixInt-1,-1*g_fixDec),
16  =>to_sfixed (0.008320, g_fixInt-1,-1*g_fixDec),
17  =>to_sfixed (0.000000, g_fixInt-1,-1*g_fixDec),
18  =>to_sfixed (-0.001286, g_fixInt-1,-1*g_fixDec),
19  =>to_sfixed (-0.000164, g_fixInt-1,-1*g_fixDec),
20  =>to_sfixed (-0.000000, g_fixInt-1,-1*g_fixDec)
);
 
--End list of coefficients
 
  
 signal signal_in : sfixed (g_fixInt-1 downto -1*g_fixDec);
 signal signal_out : sfixed (g_fixInt-1 downto -1*g_fixDec);
 signal signal_out_tmp : sfixed (g_fixInt-1 downto -1*g_fixDec);
 
begin
 
    Filter_process: process(clk, reset) 
     
    variable myBuffer : IterBuffer;
    variable signal_tmp : sfixed (2*g_fixInt downto -2*g_fixDec);
     
    begin
        if(reset='0') then
            for I in 0 to g_FilterCoef-1 loop
                myBuffer(I):=to_sfixed (0.0, g_fixInt-1,-1*g_fixDec);
            end loop;
 
        elsif(rising_edge(clk)) then    
        --Do the convolution
        --This part could be piplined for faster operation
            for I in 0 to g_FilterCoef-1 loop
                signal_tmp:=myBuffer(I)+signal_in*Filter(I);
                myBuffer(I):=signal_tmp(g_fixInt-1 downto -1*g_fixDec);
            end loop;
            signal_out_tmp<=myBuffer(0);
             
            for I in 0 to (g_FilterCoef-1)-1 loop--shift the buffer
                myBuffer(I):=myBuffer(1+I);
            end loop;
             
            myBuffer(g_FilterCoef-1):=to_sfixed (0.0, g_fixInt-1,-1*g_fixDec);--Add 0;
             
        end if;
    end process Filter_process;
     
    --Make sure the output comes at the clock edge
    Output_process: process(clk)
    begin
        if(rising_edge(clk)) then
            signal_out<=signal_out_tmp;
        end if;
    end process Output_process;
     
    signal_in<=to_sfixed (signed(signal_in_int), g_fixInt-1,-1*g_fixDec);
    signal_out_int<='0'  &(g_outputBits-2 downto 0 => '1')  when signal_out > 2**(g_outputBits-1) else --max allowed by #bits
                         '1' & (g_outputBits-2 downto 0 => '0') when signal_out < -1*2**(g_outputBits-1) else --min allowed by #bits
                          std_logic_vector(signal_out(g_outputBits-1 downto 0));
end rtl;
