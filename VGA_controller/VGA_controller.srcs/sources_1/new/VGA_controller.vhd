----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ido Weinstock
-- 
-- Create Date: 04/05/2025 08:24:12 PM
-- Design Name: 
-- Module Name: VGA_controller - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGA_controller is
Port ( 
    CLK : in STD_LOGIC;
    SW : in  STD_LOGIC_VECTOR (15 downto 0);
    BTN : in  STD_LOGIC_VECTOR (4 downto 0);
    LED : out  STD_LOGIC_VECTOR (15 downto 0);
    VGA_HS : out STD_LOGIC;
    VGA_VS : out STD_LOGIC;
    VGA_R : out STD_LOGIC_VECTOR (3 downto 0);
    VGA_G : out STD_LOGIC_VECTOR (3 downto 0);
    VGA_B : out STD_LOGIC_VECTOR (3 downto 0)
  );
end VGA_controller;

architecture Behavioral of VGA_controller is

SIGNAL RST : STD_LOGIC :='0';
SIGNAL CLK25 : STD_LOGIC :='0';--//PIXEL CLOCK FREQUENCY
SIGNAL MIN_MENUAL_UPDATE:STD_LOGIC :='0';
SIGNAL HOUR_MENUAL_UPDATE:STD_LOGIC :='0';
SIGNAL START_TIMER:STD_LOGIC :='0';
SIGNAL START_TIMER_EN:STD_LOGIC :='0';
SIGNAL START_TIMER_TMP:STD_LOGIC :='0';
SIGNAL TIMER_FLAG:STD_LOGIC :='0';
SIGNAL COUNTER_CLK : STD_LOGIC_VECTOR (3 DOWNTO 0):=(OTHERS=>'0');
SIGNAL VGA_R_IN : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_G_IN : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_B_IN : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_R_IN_BUFFER : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_G_IN_BUFFER : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_B_IN_BUFFER : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_R_IN_SECOND_BAR : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_G_IN_SECOND_BAR : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_B_IN_SECOND_BAR : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_R_IN_MINUTES_BAR : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_G_IN_MINUTES_BAR : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_B_IN_MINUTES_BAR : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_R_IN_HOUR_BAR : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_G_IN_HOUR_BAR : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL VGA_B_IN_HOUR_BAR : STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'1');
SIGNAL  NUMERIC_DIGIT_S1 :  STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'0');
SIGNAL  NUMERIC_DIGIT_S10 :  STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'0');
SIGNAL  NUMERIC_DIGIT_M1 :  STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'0');
SIGNAL  NUMERIC_DIGIT_M10 :  STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'0');
SIGNAL  NUMERIC_DIGIT_H1 :  STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'0');
SIGNAL  NUMERIC_DIGIT_H10 :  STD_LOGIC_VECTOR (3 downto 0):=(OTHERS=>'0');

SIGNAL DIGIT_S1:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_S10:INTEGER RANGE 0 TO 10:=0;
SIGNAL DIGIT_M1:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_M10:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_H1:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT1_H1:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_H1_TO_CONV:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_H10:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_S1_LATCH:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_S10_LATCH:INTEGER RANGE 0 TO 6:=0;
SIGNAL DIGIT_M1_LATCH:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_M10_LATCH:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_H1_LATCH:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT1_H1_LATCH:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_H10_LATCH:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_S1_DIV:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_S10_DIV:INTEGER RANGE 0 TO 6:=0;
SIGNAL DIGIT_M1_DIV:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_M10_DIV:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_H1_DIV:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT1_H1_DIV:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_H10_DIV:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_S1_DIV_LATCH:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_S10_DIV_LATCH:INTEGER RANGE 0 TO 10:=0;
SIGNAL DIGIT_M1_DIV_LATCH:INTEGER RANGE 0 TO 12:=0;
SIGNAL DIGIT_M10_DIV_LATCH:INTEGER RANGE 0 TO 12:=0;
SIGNAL TIMER_DIGIT_S1:INTEGER RANGE 0 TO 12:=0;
SIGNAL TIMER_DIGIT_S10:INTEGER RANGE 0 TO 10:=0;
SIGNAL TIMER_DIGIT_S10_LATCH:INTEGER RANGE 0 TO 10:=0;
SIGNAL TIMER_DIGIT_M1:INTEGER RANGE 0 TO 12:=0;
SIGNAL TIMER_DIGIT_M10:INTEGER RANGE 0 TO 12:=0;
SIGNAL COUNTER_FLIKER:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL COUNTER1:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL COUNTER1_LATCH:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL COUNTER2:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL COUNTER2_LATCH:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL COUNTER3:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL COUNTER3_LATCH:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL COUNTER_1S:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL COUNTER_S10:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL COUNTER_M1:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL COUNTER_M10:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL COUNTER_H1:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL COUNTER_H10:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL TIMER_1S:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL TIMER_S10:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL TIMER_M1:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL TIMER_M10:INTEGER RANGE 0 TO 200000000:=0;
SIGNAL d_V:INTEGER RANGE 0 TO 479:=0;
SIGNAL d_H:INTEGER RANGE 0 TO 639:=0;

CONSTANT HD : INTEGER := 639 ;  --639 HORIZENTAL DISPLAY(640)
CONSTANT HFP: INTEGER := 16 ;  --16 RIGHT BORDER(FRONT PORCH)
CONSTANT HSP : INTEGER := 96 ;  --96 HORIZONTAL SYNC PULSE(RETRACE)
CONSTANT HBP: INTEGER := 48 ;  --48 LEFT BORDER(BACK PORCH)

CONSTANT VD : INTEGER := 479 ;  --479 VERTICAL DISPLAY(480)
CONSTANT VFP: INTEGER := 10 ;  --10 RIGHT BORDER(FRONT PORCH)
CONSTANT VSP : INTEGER := 2 ;  --2 VERTICAL SYNC PULSE(RETRACE)
CONSTANT VBP: INTEGER := 33 ;  --33 LEFT BORDER(BACK PORCH)

SIGNAL HPOS: INTEGER:=0;  --HORIZONTAL PIXEL POSITION
SIGNAL VPOS: INTEGER:=0;  --VERTICAL PIXEL POSITION

SIGNAL DIGITAL_CLOCK_EN: STD_LOGIC :='0';

SIGNAL A_S1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL A_S1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL A_S10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL A_S10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL A_M1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL A_M1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL A_M10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL A_M10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL A_H1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL A_H1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL A_H10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL A_H10_MAX :INTEGER RANGE 0 TO 640:=0;

SIGNAL B_S1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL B_S1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL B_S10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL B_S10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL B_M1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL B_M1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL B_M10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL B_M10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL B_H1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL B_H1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL B_H10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL B_H10_MAX :INTEGER RANGE 0 TO 640:=0;

SIGNAL C_S1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL C_S1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL C_S10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL C_S10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL C_M1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL C_M1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL C_M10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL C_M10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL C_H1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL C_H1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL C_H10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL C_H10_MAX :INTEGER RANGE 0 TO 640:=0;

SIGNAL D_S1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL D_S1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL D_S10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL D_S10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL D_M1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL D_M1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL D_M10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL D_M10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL D_H1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL D_H1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL D_H10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL D_H10_MAX :INTEGER RANGE 0 TO 640:=0;

SIGNAL E_S1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL E_S1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL E_S10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL E_S10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL E_M1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL E_M1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL E_M10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL E_M10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL E_H1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL E_H1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL E_H10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL E_H10_MAX :INTEGER RANGE 0 TO 640:=0;

SIGNAL F_S1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL F_S1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL F_S10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL F_S10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL F_M1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL F_M1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL F_M10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL F_M10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL F_H1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL F_H1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL F_H10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL F_H10_MAX :INTEGER RANGE 0 TO 640:=0;

SIGNAL G_S1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL G_S1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL G_S10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL G_S10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL G_M1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL G_M1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL G_M10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL G_M10_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL G_H1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL G_H1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL G_H10_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL G_H10_MAX :INTEGER RANGE 0 TO 640:=0;

SIGNAL L1V_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL L1V_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL L2V_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL L2V_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL L1H_MIN :INTEGER RANGE 0 TO 480:=0;
SIGNAL L1H_MAX :INTEGER RANGE 0 TO 480:=0;
SIGNAL L2H_MIN :INTEGER RANGE 0 TO 480:=0;
SIGNAL L2H_MAX :INTEGER RANGE 0 TO 480:=0;

SIGNAL SQ1_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ1_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ2_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ2_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ3_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ3_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ4_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ4_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ5_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ5_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ6_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ6_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ7_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ7_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ8_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ8_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ9_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL SQ9_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL TFV_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL TFV_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL BFV_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL BFV_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL V_MINUTES_BAR:INTEGER RANGE 0 TO 640:=0;
SIGNAL V_HOUR_BAR:INTEGER RANGE 0 TO 640:=0;
SIGNAL LFH_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL LFH_MAX :INTEGER RANGE 0 TO 640:=0;
SIGNAL RFH_MIN :INTEGER RANGE 0 TO 640:=0;
SIGNAL RFH_MAX :INTEGER RANGE 0 TO 640:=0;

SIGNAL PLAYER_SELECTOR :STD_LOGIC :='0';
SIGNAL A :STD_LOGIC_VECTOR (8 DOWNTO 0):=(OTHERS=>'0');
SIGNAL B :STD_LOGIC_VECTOR (8 DOWNTO 0):=(OTHERS=>'0');
SIGNAL C :STD_LOGIC_VECTOR (8 DOWNTO 0):=(OTHERS=>'0');
SIGNAL D :STD_LOGIC_VECTOR (8 DOWNTO 0):=(OTHERS=>'0');
SIGNAL E :STD_LOGIC_VECTOR (8 DOWNTO 0):=(OTHERS=>'0');
SIGNAL P1_SQ:STD_LOGIC_VECTOR (8 DOWNTO 0):=(OTHERS=>'0');
SIGNAL P2_SQ:STD_LOGIC_VECTOR (8 DOWNTO 0):=(OTHERS=>'0');
SIGNAL WIN_MARKER:STD_LOGIC_VECTOR (7 DOWNTO 0):=(OTHERS=>'0');

begin

VGA_R_IN_BUFFER(0)<=SW(15);VGA_R_IN_BUFFER(1)<=SW(14);VGA_R_IN_BUFFER(2)<=SW(13);VGA_R_IN_BUFFER(3)<=SW(12);
VGA_G_IN_BUFFER(0)<=SW(11);VGA_G_IN_BUFFER(1)<=SW(10);VGA_G_IN_BUFFER(2)<=SW(9);VGA_G_IN_BUFFER(3)<=SW(8);
VGA_B_IN_BUFFER(0)<=SW(7);VGA_B_IN_BUFFER(1)<=SW(6);VGA_B_IN_BUFFER(2)<=SW(5);VGA_B_IN_BUFFER(3)<=SW(4);

 VGA_R_IN_SECOND_BAR<="1111"; 
 VGA_G_IN_SECOND_BAR<="1111"; 
 VGA_B_IN_SECOND_BAR<="0100";
  
 VGA_R_IN_MINUTES_BAR<="1111"; 
 VGA_G_IN_MINUTES_BAR<="0110"; 
 VGA_B_IN_MINUTES_BAR<="1100"; 

 VGA_R_IN_HOUR_BAR<="0000"; 
 VGA_G_IN_HOUR_BAR<="1111"; 
 VGA_B_IN_HOUR_BAR<="1111"; 


with BTN(4) select --BTNC(N17)
	RST <= '0' 	 when '0',
		   '1' when others;
		   
with BTN(2) select --BTNR(M17)
 MIN_MENUAL_UPDATE <= '0' when '0',
                      '1' when others;	
                      
with BTN(1) select --BTNL(P17)
 HOUR_MENUAL_UPDATE <= '0' when '0',
                       '1' when others; 
                      
with BTN(3) select --BTND(P18)
 START_TIMER_EN <= '0' when '0',
                '1' when others; 

------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------- VGA DRIVER --------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------                
CLK_DIV: process(CLK)--// CLK = 100MHZ 
begin
   if  RST='1'  then
       COUNTER_CLK <= (others => '0');
   elsif CLK='1' and CLK'event then
       COUNTER_CLK <= COUNTER_CLK + 1;  
   end if; 
 end process CLK_DIV;
 -- CLK25 = PIXEL CLOCK FREQUENCY = COUNTER_CLK(1)===> 100MHZ/4=25MHZ 
 CLK25<=COUNTER_CLK(1);
                        
HORIZENTAL_POSITION_COUNTER: process(CLK25,RST)
begin
   if  RST='1'  then
       HPOS<= 0;
   elsif CLK25='1' and CLK25'event then
         if (HPOS= (HD+HFP+HSP+HBP))then
             HPOS<= 0;
         else      
             HPOS<= HPOS+1;
         end if;
   end if;
end process HORIZENTAL_POSITION_COUNTER;
                       
VERTICAL_POSITION_COUNTER: process(CLK25,RST,HPOS)
begin
   if  RST='1'  then
       VPOS<= 0;
   elsif CLK25='1' and CLK25'event then
         if (HPOS= (HD+HFP+HSP+HBP))then
             if (VPOS= (VD+VFP+VSP+VBP))then
                 VPOS<= 0;
             else      
                 VPOS<= VPOS+1;
             end if;
         end if;
   end if;
end process VERTICAL_POSITION_COUNTER;
                       
HORIZENTAL_SYNC: process(CLK25,RST,HPOS)
begin
   if  RST='1'  then
       VGA_HS<= '0';
   elsif CLK25='1' and CLK25'event then
         if ((HPOS <= (HD+HFP))OR (HPOS > (HD+HFP+HSP)))then
             VGA_HS<= '1';
         else      
             VGA_HS<= '0';
         end if;
   end if;
end process HORIZENTAL_SYNC;
                       
VERTICAL_SYNC: process(CLK25,RST,VPOS)
begin
   if  RST='1'  then
       VGA_VS<= '0';
   elsif CLK25='1' and CLK25'event then
         if ((VPOS <= (VD+VFP))OR (VPOS > (VD+VFP+VSP)))then
             VGA_VS<= '1';
         else      
             VGA_VS<= '0';
         end if;
   end if;
end process VERTICAL_SYNC;
                       
VIDEO_ON_PROC: process(CLK25,RST,HPOS,VPOS)
begin
   if  RST='1'  then
       DIGITAL_CLOCK_EN<= '0';
   elsif CLK25='1' and CLK25'event then
         if ((HPOS <= HD)AND (VPOS < VD))then
             DIGITAL_CLOCK_EN<= '1';
         else      
             DIGITAL_CLOCK_EN<= '0';
         end if;
   end if;
end process VIDEO_ON_PROC;
------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------- END OF VGA DRIVER -------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
 process(CLK,RST)
begin
   if  RST='1'  then
       COUNTER_FLIKER <= 0;
   elsif CLK='1' and CLK'event then
     if COUNTER_FLIKER<100000000 then
       COUNTER_FLIKER <= COUNTER_FLIKER + 1; 
     else 
       COUNTER_FLIKER <= 0;  
     end if; 
    end if;
 end process;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------- DIGITAL CLOCK DESIGNING -------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------SECOND ONE COUNTER-----------------------------------------------------

LED(0)<=NUMERIC_DIGIT_S1(0);
LED(1)<=NUMERIC_DIGIT_S1(1);
LED(2)<=NUMERIC_DIGIT_S1(2);
LED(3)<=NUMERIC_DIGIT_S1(3);

process(RST,CLK)   
begin
if RST='1' then 
  COUNTER_1S<=0;
elsif CLK='1' and CLK'event then
    if (MIN_MENUAL_UPDATE='0') and (HOUR_MENUAL_UPDATE='0') and (SW(0)='0')and (COUNTER_1S<100000000)then
      COUNTER_1S<=COUNTER_1S+1;
   else
      COUNTER_1S<=0;
   end if;
end if;
end process;

process(RST,CLK,COUNTER_1S)
begin
if RST='1' then
   DIGIT_S1<= 0;
   DIGIT_S1_LATCH<=0;  
elsif CLK='1' and CLK'event then
   if ( DIGIT_S1 <=9) then
        if (COUNTER_1S=100000000) then
           DIGIT_S1<=DIGIT_S1+1;
           DIGIT_S1_LATCH<=DIGIT_S1+1;
        else
           DIGIT_S1<=DIGIT_S1_LATCH; 
        end if;
   else
       DIGIT_S1<= 0;
       DIGIT_S1_LATCH<=0;      
   end if  ;
end if;
end process;
------------------------------------------------------------------------------------------
--------------------SECOND TEN COUNTER-----------------------------------------------------

process(RST,CLK,NUMERIC_DIGIT_S1)
begin
if RST='1' then
   COUNTER_S10<= 0;
elsif CLK='1' and CLK'event then
    if ((MIN_MENUAL_UPDATE='0') and (HOUR_MENUAL_UPDATE='0')and (SW(0)='0') and (COUNTER_S10<100000000) and ( NUMERIC_DIGIT_S1="1001"))then    
       COUNTER_S10<=COUNTER_S10+1;
    else
       COUNTER_S10<= 0; 
    end if  ;
end if;
end process;

process(RST,CLK,COUNTER_S10)
begin
if RST='1' then
   DIGIT_S10<= 0;
   DIGIT_S10_LATCH<=0;  
elsif CLK='1' and CLK'event then
   if ( DIGIT_S10 <6) then
        if (COUNTER_S10=100000000) then
           DIGIT_S10<=DIGIT_S10+1;
           DIGIT_S10_LATCH<=DIGIT_S10+1;
        else
           DIGIT_S10<=DIGIT_S10_LATCH; 
        end if;
   else
       DIGIT_S10<= 0;
       DIGIT_S10_LATCH<=0;      
   end if  ;
end if;
end process;
------------------------------------------------------------------------------------------
--------------------MIN ONE COUNTER-----------------------------------------------------

process(RST,CLK,NUMERIC_DIGIT_S1,NUMERIC_DIGIT_S10)
begin
if RST='1' then
   COUNTER_M1<= 0;
elsif CLK='1' and CLK'event then
    if ((MIN_MENUAL_UPDATE='0')and (SW(0)='0')and(COUNTER_M1<100000000) and ( NUMERIC_DIGIT_S10="0101")and ( NUMERIC_DIGIT_S1="1001"))
     or ((SW(0)='0')and(MIN_MENUAL_UPDATE='1')and(COUNTER_M1<100000000)) then 
        
       COUNTER_M1<=COUNTER_M1+1;
    else
       COUNTER_M1<= 0; 
    end if  ;
end if;
end process;

process(RST,CLK,COUNTER_M1)
begin
if RST='1' then
   DIGIT_M1<= 0;
   DIGIT_M1_LATCH<=0;  
elsif CLK='1' and CLK'event then
   if ( DIGIT_M1 <10)  then
        if (COUNTER_M1=100000000) then
           DIGIT_M1<=DIGIT_M1+1;
           DIGIT_M1_LATCH<=DIGIT_M1+1;
        else
           DIGIT_M1<=DIGIT_M1_LATCH; 
        end if;
   else
       DIGIT_M1<= 0;
       DIGIT_M1_LATCH<=0;      
   end if  ;
end if;
end process;
------------------------------------------------------------------------------------------
--------------------MIN TEN COUNTER-----------------------------------------------------

process(RST,CLK,NUMERIC_DIGIT_S1,NUMERIC_DIGIT_S10,NUMERIC_DIGIT_M1)
begin
if RST='1' then
   COUNTER_M10<= 0;
elsif CLK='1' and CLK'event then
    if ((MIN_MENUAL_UPDATE='0') and (SW(0)='0')and (COUNTER_M10<100000000) and ( NUMERIC_DIGIT_S10="0101")and ( NUMERIC_DIGIT_S1="1001") and ( NUMERIC_DIGIT_M1="1001"))
    or ((SW(0)='0')and(MIN_MENUAL_UPDATE='1')and ( NUMERIC_DIGIT_M1="1001")and (COUNTER_M10<100000000)) then 
       
       COUNTER_M10<=COUNTER_M10+1;
    else
       COUNTER_M10<= 0; 
    end if  ;
end if;
end process;

process(RST,CLK,COUNTER_M10)
begin
if RST='1' then
   DIGIT_M10<= 0;
   DIGIT_M10_LATCH<=0;  
elsif CLK='1' and CLK'event then
   if ( DIGIT_M10 <6) then
        if (COUNTER_M10=100000000) then
           DIGIT_M10<=DIGIT_M10+1;
           DIGIT_M10_LATCH<=DIGIT_M10+1;
        else
           DIGIT_M10<=DIGIT_M10_LATCH; 
        end if;
   else
       DIGIT_M10<= 0;
       DIGIT_M10_LATCH<=0;      
   end if  ;
end if;
end process;

------------------------------------------------------------------------------------------
--------------------HOUR ONE COUNTER-----------------------------------------------------

process(RST,CLK,DIGIT_H10)
begin
if RST='1' then
   DIGIT_H1_TO_CONV<= 0;  
elsif CLK='1' and CLK'event then
   if ( DIGIT_H10 <2) then
        DIGIT_H1_TO_CONV<=DIGIT_H1;          
   else
        DIGIT_H1_TO_CONV<=DIGIT1_H1;
   end if  ;
end if;
end process;
process(RST,CLK,NUMERIC_DIGIT_S1,NUMERIC_DIGIT_S10,NUMERIC_DIGIT_M1,NUMERIC_DIGIT_H1,NUMERIC_DIGIT_H10)
begin
if RST='1' then
   COUNTER_H1<= 0;
elsif CLK='1' and CLK'event then
    if ((HOUR_MENUAL_UPDATE='0') and (SW(0)='0')and (COUNTER_H1<100000000) and ( NUMERIC_DIGIT_S10="0101")and ( NUMERIC_DIGIT_S1="1001") and ( NUMERIC_DIGIT_M1="1001")and ( NUMERIC_DIGIT_M10="0101"))
    or ((SW(0)='0')and(HOUR_MENUAL_UPDATE='1') and (COUNTER_H1<100000000)) then    
       COUNTER_H1<=COUNTER_H1+1;
    else
       COUNTER_H1<= 0; 
    end if  ;
end if;
end process;

process(RST,CLK,COUNTER_H1)
begin
if RST='1' then
   DIGIT_H1<= 0;
   DIGIT_H1_LATCH<=0;  
elsif CLK='1' and CLK'event then
   if ( DIGIT_H10 <2)and ( DIGIT_H1 <10) then
        if (COUNTER_H1=100000000) then
           DIGIT_H1<=DIGIT_H1+1;
           DIGIT_H1_LATCH<=DIGIT_H1+1;
        else
           DIGIT_H1<=DIGIT_H1_LATCH; 
        end if;
   elsif( DIGIT_H10 =2)and ( DIGIT_H1 <4) then
        if (COUNTER_H1=100000000) then
            DIGIT1_H1<=DIGIT1_H1+1;
            DIGIT1_H1_LATCH<=DIGIT1_H1+1;
        else
            DIGIT1_H1<=DIGIT1_H1_LATCH; 
        end if;
   else        
       DIGIT1_H1<= 0;
       DIGIT1_H1_LATCH<=0;
       DIGIT_H1<= 0;
       DIGIT_H1_LATCH<=0;       
   end if  ;
end if;
end process;
------------------------------------------------------------------------------------------
--------------------HOUR TEN COUNTER-----------------------------------------------------
process(RST,CLK,NUMERIC_DIGIT_S1,NUMERIC_DIGIT_S10,NUMERIC_DIGIT_M1,NUMERIC_DIGIT_H1,NUMERIC_DIGIT_H10)
begin
if RST='1' then
   COUNTER_H10<= 0;
elsif CLK='1' and CLK'event then
    if ((HOUR_MENUAL_UPDATE='0') and (SW(0)='0')and (COUNTER_H10<100000000) and ( NUMERIC_DIGIT_S10="0101")and ( NUMERIC_DIGIT_S1="1001")
      and ( NUMERIC_DIGIT_M1="1001")and ( NUMERIC_DIGIT_M10="0101")and ( NUMERIC_DIGIT_H1="1001")and ( NUMERIC_DIGIT_H10<"0010"))
     OR  ((SW(0)='0')and(HOUR_MENUAL_UPDATE='0') and (COUNTER_H10<100000000) and ( NUMERIC_DIGIT_S10="0101")and ( NUMERIC_DIGIT_S1="1001") 
      and ( NUMERIC_DIGIT_M1="1001")and ( NUMERIC_DIGIT_M10="0101")and ( NUMERIC_DIGIT_H1="0011")and ( NUMERIC_DIGIT_H10="0010"))
     OR ((SW(0)='0')and(HOUR_MENUAL_UPDATE='1')and ( NUMERIC_DIGIT_H1="1001")and ( NUMERIC_DIGIT_H10<"0010")and (COUNTER_H10<100000000))
      OR ((HOUR_MENUAL_UPDATE='1')and ( NUMERIC_DIGIT_H1="0011")and ( NUMERIC_DIGIT_H10="0010")and (COUNTER_H10<100000000))then  
       
       COUNTER_H10<=COUNTER_H10+1;
    else
       COUNTER_H10<= 0; 
    end if  ;
end if;
end process;

process(RST,CLK,COUNTER_H10)
begin
if RST='1' then
   DIGIT_H10<= 0;
   DIGIT_H10_LATCH<=0;  
elsif CLK='1' and CLK'event then
   if ( DIGIT_H10 <3) then
        if (COUNTER_H10=100000000) then
           DIGIT_H10<=DIGIT_H10+1;
           DIGIT_H10_LATCH<=DIGIT_H10+1;
        else
           DIGIT_H10<=DIGIT_H10_LATCH; 
        end if;  
   else        
       DIGIT_H10<= 0;
       DIGIT_H10_LATCH<=0;       
   end if  ;
end if;
end process;

---------------------------------------------------------------------------------------------------------------
-----------------------------------COUNTER FOR SECOND BAR------------------------------------------------------
process(CLK,RST,COUNTER_1S)
begin
if RST='1' then
    COUNTER1<=0;
    COUNTER1_LATCH<=0;
elsif CLK='1' and CLK'event then
    if COUNTER1<=59 then
        if (COUNTER_1S=100000000-1) then
             COUNTER1<=COUNTER1+1;    
             COUNTER1_LATCH<=COUNTER1+1;
        else
            COUNTER1<=COUNTER1_LATCH;
        end if;
    else
        COUNTER1<=0;
        COUNTER1_LATCH<=0;
    end if;
 end if;
 end process;
 
 ---------------------------------------------------------------------------------------------------------------
 -----------------------------------COUNTER FOR MINUTES BAR-----------------------------------------------------
 
 process(CLK,RST,COUNTER1,COUNTER_1S,MIN_MENUAL_UPDATE)
 begin
 if RST='1' then
     COUNTER2<=0;
     COUNTER2_LATCH<=0;
 elsif CLK='1' and CLK'event then
    if COUNTER2<=59 then
        if (COUNTER1=59 and (COUNTER_1S=100000000-1))or ((MIN_MENUAL_UPDATE='1')and (COUNTER_M1=100000000)) then
            COUNTER2<=COUNTER2+1;    
            COUNTER2_LATCH<=COUNTER2+1;
        else
            COUNTER2<=COUNTER2_LATCH;
        end if;
    else
        COUNTER2<=0;
        COUNTER2_LATCH<=0;
    end if;
 end if;
 end process;

---------------------------------------------------------------------------------------------------------------
-----------------------------------COUNTER FOR HOUR BAR--------------------------------------------------------
 
 process(CLK,RST,COUNTER1,COUNTER_1S,MIN_MENUAL_UPDATE)
 begin
 if RST='1' then
     COUNTER3<=0;
     COUNTER3_LATCH<=0;
 elsif CLK='1' and CLK'event then
    if COUNTER3<=23 then
        if (COUNTER2=59 and (COUNTER_M1=100000000-1))or ((HOUR_MENUAL_UPDATE='1')and (COUNTER_H1=100000000)) then
            COUNTER3<=COUNTER3+1;    
            COUNTER3_LATCH<=COUNTER3+1;
        else
            COUNTER3<=COUNTER3_LATCH;
        end if;
    else
        COUNTER3<=0;
        COUNTER3_LATCH<=0;
    end if;
 end if;
 end process;
 
------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------- END OF DIGITAL CLOCK DESIGNING ------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------



--****************************************************************************************************************************************************************--
--********************************* DIGITAL TIMER  DESIGNING *******************************************************************************************************--
--****************************************************************************************************************************************************************--

process(RST,CLK)   
begin
if RST='1' then 
  START_TIMER<='0';
  
elsif CLK='1' and CLK'event then
    if (START_TIMER_EN='1')then
      START_TIMER<='1';
      
   else
      START_TIMER<=START_TIMER_TMP;
   end if;
end if;
end process;

--*****************************************************************************************************--
--*******************************TIMER-ONE-SEC*********************************************************--
process(RST,CLK)   
begin
if RST='1' then 
  TIMER_1S<=0;
elsif CLK='1' and CLK'event then
    if (MIN_MENUAL_UPDATE='0') and (SW(0)='1')and (TIMER_1S<100000000) then
      TIMER_1S<=TIMER_1S+1;
   else
      TIMER_1S<=0;
   end if;
end if;
end process;

process(RST,CLK,TIMER_1S,START_TIMER)
begin
if RST='1' then
   TIMER_DIGIT_S1<= 0;
   DIGIT_S1_DIV<= 0;
   DIGIT_S1_DIV_LATCH<=0;
   START_TIMER_TMP<='0';  
elsif CLK='1' and CLK'event then
 if (START_TIMER='1')then
   START_TIMER_TMP<='1';
   if ( DIGIT_S1_DIV <=9) then
     if ((TIMER_DIGIT_M1=0 and TIMER_DIGIT_M10=0 and TIMER_DIGIT_S1=0 and TIMER_DIGIT_S10=0))then
            DIGIT_S1_DIV<= 0;
            DIGIT_S1_DIV_LATCH<=0;
            TIMER_DIGIT_S1<= 0;
            START_TIMER_TMP<='0';           
     else
        if (TIMER_1S=100000000) then
           TIMER_DIGIT_S1<=9-DIGIT_S1_DIV;
           DIGIT_S1_DIV<=DIGIT_S1_DIV+1;
           DIGIT_S1_DIV_LATCH<=DIGIT_S1_DIV+1;
           TIMER_FLAG<='1';
        else
           DIGIT_S1_DIV<=DIGIT_S1_DIV_LATCH;
           TIMER_DIGIT_S1<=9-DIGIT_S1_DIV; 
        end if;
     end if;
   else
       DIGIT_S1_DIV<= 0;
       DIGIT_S1_DIV_LATCH<=0;
       TIMER_DIGIT_S1<= 0;      
   end if  ;
 else
    TIMER_DIGIT_S1<= 0;
 end if;   
end if;
end process;

--*****************************************************************************************************--
--******************************TIMER-TEN-SEC**********************************************************--

process(RST,CLK)
begin
if RST='1' then
   TIMER_S10<= 0;
elsif CLK='1' and CLK'event then
    if ((MIN_MENUAL_UPDATE='0') and (SW(0)='1') and (TIMER_S10<100000000) and ( NUMERIC_DIGIT_S1="0000"))then    
       TIMER_S10<=TIMER_S10+1;
    else
       TIMER_S10<= 0; 
    end if  ;
end if;
end process;

process(RST,CLK,TIMER_S10,START_TIMER)
begin
if RST='1' then
   DIGIT_S10_DIV<= 0;
   DIGIT_S10_DIV_LATCH<=0;  
elsif CLK='1' and CLK'event then
 if  (START_TIMER='1')then
   if (DIGIT_S10_DIV>=0 and DIGIT_S10_DIV <6)then
      if ( TIMER_DIGIT_S1=0)then
        if (TIMER_S10=100000000) then
           DIGIT_S10_DIV<=DIGIT_S10_DIV+1; 
           DIGIT_S10_DIV_LATCH<=DIGIT_S10_DIV_LATCH+1; 
        else
           DIGIT_S10_DIV<=DIGIT_S10_DIV_LATCH;
        end if;     
      else
        DIGIT_S10_DIV<=DIGIT_S10_DIV_LATCH;
      end if; 
   else
     DIGIT_S10_DIV<= 0;
     DIGIT_S10_DIV_LATCH<=0; 
   end if;      
 else
   DIGIT_S10_DIV<= 0;
   DIGIT_S10_DIV_LATCH<=0;
 end if;
end if;
end process;
  
process(RST,CLK,TIMER_S10,START_TIMER)
begin
if RST='1' then
   TIMER_DIGIT_S10<= 0;    
elsif CLK='1' and CLK'event then
 if  (START_TIMER='1')then
    if (DIGIT_S10_DIV>=0 and DIGIT_S10_DIV <=5) then 
        TIMER_DIGIT_S10<=5-DIGIT_S10_DIV;
    else
        TIMER_DIGIT_S10<=5 ;
   end if;     
 else
   TIMER_DIGIT_S10<= 0; 
  end if;
end if;
end process;

--*****************************************************************************************************--
--*******************************TIMER-ONE-MIN*********************************************************--
process(RST,CLK,NUMERIC_DIGIT_S1,NUMERIC_DIGIT_S10)
begin
if RST='1' then
   TIMER_M1<= 0;
elsif CLK='1' and CLK'event then
    if ((MIN_MENUAL_UPDATE='0')and (SW(0)='1')and(TIMER_M1<100000000) and ( NUMERIC_DIGIT_S10="0000")and ( NUMERIC_DIGIT_S1="0000"))
     or ((SW(0)='1')and (MIN_MENUAL_UPDATE='1')and(TIMER_M1<100000000)) then  
       TIMER_M1<=TIMER_M1+1;
    else
       TIMER_M1<= 0; 
    end if  ;
end if;
end process;

process(RST,CLK,TIMER_M1)
begin
if RST='1' then
   TIMER_DIGIT_M1<= 0;
   DIGIT_M1_DIV<= 0;
   DIGIT_M1_DIV_LATCH<=0;  
elsif CLK='1' and CLK'event then 
   if ( TIMER_DIGIT_M1 >=0 and TIMER_DIGIT_M1 <=9)  then
     if ((START_TIMER='1')and (MIN_MENUAL_UPDATE='0')) then
       if ((TIMER_DIGIT_M10 >=0)and (TIMER_DIGIT_M1 >0)) then
          if (TIMER_M1=100000000) then
              TIMER_DIGIT_M1<=DIGIT_M1_DIV-1;
              DIGIT_M1_DIV_LATCH<=DIGIT_M1_DIV_LATCH-1;
          else
              DIGIT_M1_DIV<=DIGIT_M1_DIV_LATCH;
              TIMER_DIGIT_M1<=DIGIT_M1_DIV-1;  
          end if;
       else
          if (TIMER_M1=100000000) then
            TIMER_DIGIT_M1<= 9;
            DIGIT_M1_DIV<= 10;
            DIGIT_M1_DIV_LATCH<=10;
          end if; 
       end if;
      
     elsif ((START_TIMER='0')and (MIN_MENUAL_UPDATE='1')) then
        if (TIMER_M1=100000000) then
           DIGIT_M1_DIV<=DIGIT_M1_DIV+1;
           DIGIT_M1_DIV_LATCH<=DIGIT_M1_DIV_LATCH+1;
           TIMER_DIGIT_M1<=DIGIT_M1_DIV;
        else
           DIGIT_M1_DIV<=DIGIT_M1_DIV_LATCH;
           TIMER_DIGIT_M1<=DIGIT_M1_DIV; 
        end if;
     end if;      
   else
       TIMER_DIGIT_M1<= 0;
       DIGIT_M1_DIV<= 0;
       DIGIT_M1_DIV_LATCH<=0;      
   end if  ;
end if;
end process;

--*****************************************************************************************************--
--*******************************TIMER-TEN-MIN*********************************************************--

process(RST,CLK,NUMERIC_DIGIT_S1,NUMERIC_DIGIT_S10,NUMERIC_DIGIT_M1)
begin
if RST='1' then
  TIMER_M10<= 0;
elsif CLK='1' and CLK'event then
    if ((MIN_MENUAL_UPDATE='0') and (SW(0)='1')and (TIMER_M10<100000000) and ( NUMERIC_DIGIT_S10="0000")and ( NUMERIC_DIGIT_S1="0000") and ( NUMERIC_DIGIT_M1="0000"))
    or ((SW(0)='1')and (MIN_MENUAL_UPDATE='1')and ( NUMERIC_DIGIT_M1="1001")and (TIMER_M10<100000000)) then    
       TIMER_M10<=TIMER_M10+1;
    else
       TIMER_M10<= 0; 
    end if  ;
end if;
end process;

process(RST,CLK,TIMER_M10)
begin
if RST='1' then
   TIMER_DIGIT_M10<= 0;
   DIGIT_M10_DIV<= 0;
   DIGIT_M10_DIV_LATCH<=0;  
elsif CLK='1' and CLK'event then
  if ( TIMER_DIGIT_M10 >=0 and TIMER_DIGIT_M10 <6) then
    if (START_TIMER='1')and (MIN_MENUAL_UPDATE='0') then
      if ( TIMER_DIGIT_M10 >0)then
        if (TIMER_M10=100000000) then
           TIMER_DIGIT_M10<=DIGIT_M10_DIV-1;
           DIGIT_M10_DIV_LATCH<=DIGIT_M10_DIV-1;
        else
           DIGIT_M10_DIV<=DIGIT_M10_DIV_LATCH;
           TIMER_DIGIT_M10<=DIGIT_M10_DIV;   
        end if;
      end if;
    elsif (START_TIMER='0')and (MIN_MENUAL_UPDATE='1')  then
        if (TIMER_M10=100000000) then
           TIMER_DIGIT_M10<=DIGIT_M10_DIV;
           DIGIT_M10_DIV<=DIGIT_M10_DIV+1;
           DIGIT_M10_DIV_LATCH<=DIGIT_M10_DIV+1;
        else
           TIMER_DIGIT_M10<=DIGIT_M10_DIV;
           DIGIT_M10_DIV<=DIGIT_M10_DIV_LATCH; 
        end if; 
    end if;  
  else
       TIMER_DIGIT_M10<= 0;
       DIGIT_M10_DIV<= 0;
       DIGIT_M10_DIV_LATCH<=0;      
  end if  ;
end if;
end process;

--*****************************************************************************************************************************************************************--
--********************************* END OF DIGITAL TIMER DESIGNING*************************************************************************************************--
--*****************************************************************************************************************************************************************--

end Behavioral;
