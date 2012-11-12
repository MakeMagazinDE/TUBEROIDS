----------------------------------------------------------------------------------
-- Company:        OHO-Elektronik
-- Engineer:       M.Randelzhofer
-- 
-- Create Date:    17.01.09 
-- Design Name: 
-- Module Name:    Demo_Dy1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 1.00 - File Created

-- Additional Comments: 
-- Revision 1.01 - Brightness support
-- Revision 1.02 - Added display test
-- Revision 1.03 - display update support, new interface signal names
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;
use work.OhoPack.all ;


entity demo_dy1 is
Port (
	m49,sw1,sw2,sout,rts,c13,d13:                             in  std_logic ;
	DIGIT_1, DIGIT_2, DIGIT_3:      std_logic_vector(3 downto 0) ;
	cts,cso,vs2,sin:                                          inout  std_logic ;
	tvs1,tvs0,tmosi,tdin,tcclk,tm1,thsw:                      inout  std_logic
) ;
end demo_dy1 ;


architecture Behavioral of demo_dy1 is

signal sclk,ser,rclk:                   std_logic ;
signal dy_update:                       std_logic ;
signal dy_frameend:                     std_logic ;
signal dy_frameend_q:                   std_logic ;
signal dy_frameend_c:                   std_logic ;
signal dy_frame:                        std_logic ;
signal dp0,dp1,dp2,dp3:                 std_logic ;

signal dy_data:                         y2d_type ;
signal clkdiv:			                   std_logic_vector (31 downto 0) ;
signal dy_pwm:                          std_logic_vector(3 downto 0) ;


component Oho_Dy1
port (
  dy_clock:         in std_logic ;
  dy_rst_n:         in std_logic ;
  dy_data:          in y2d_type ;
  dy_update:        in std_logic ;
  dy_frame:         out std_logic ;
  dy_frameend:      out std_logic ;
  dy_frameend_c:    out std_logic ;
  dy_pwm:           in std_logic_vector(3 downto 0) ;
  dy_counter:       out std_logic_vector(31 downto 0) ;
  dy_sclk:          out std_logic ;
  dy_ser:           out std_logic ;
  dy_rclk:          out std_logic
) ;
end component ;


begin

-- instantiate OHO_DY1 core
DY1:Oho_Dy1 port map (
	dy_clock => m49,
	dy_rst_n => c13,
	dy_data => dy_data,
	dy_update  => dy_update,
	dy_frame  => dy_frame,
	dy_frameend  => dy_frameend,
	dy_frameend_c  => dy_frameend_c,
	dy_pwm => dy_pwm,
	dy_counter => clkdiv,
	dy_sclk => sclk,
	dy_ser => ser,
	dy_rclk => rclk
) ;

-- brightness adjust
dy_pwm <= sw2 & not sw1 & not sw1 & not sw1 ;
-- continuous display update
dy_update <= '1' ;


-- connect Oho_Dy1 core signals to the test connector
tmosi <= rclk ; -- '595 RCLK OR OE; catch register clock togrther with output enable
tdin <=  sclk ; -- '595 SCLK; serial data clock
tcclk <= ser ; -- '595 serial display data

-- define string with 16 digits respectively
dy_data(0) <= hex & dp0 & "000" & DIGIT_3;
dy_data(1) <= hex & dp1 & "000" & DIGIT_2;
dy_data(2) <= hex & dp2 & "000" & DIGIT_1;


-- only one display used -cm
--dp0 <=     clkdiv(25) and     clkdiv(24) ;
--dp1 <=     clkdiv(25) and not clkdiv(24) ;
--dp2 <= not clkdiv(25) and     clkdiv(24) ;

--dp3 <= not clkdiv(25) and not clkdiv(24) ;
--
--dy_data(3) <= hex & dp3 & "000" & X"6" ;
--dy_data(4) <= hex & dp3 & "000" & X"5" ;
--dy_data(5) <= hex & dp3 & "000" & X"4" ;
--
--dy_data(6) <= hex & dp3 & "000" & X"9" ;
--dy_data(7) <= hex & dp3 & "000" & X"8" ;
--dy_data(8) <= hex & dp3 & "000" & X"7" ;
--
--dy_data(9) <= hex & dp3 & "000" & X"c" ;
--dy_data(10) <= hex & dp3 & "000" & X"b" ;
--dy_data(11) <= hex & dp3 & "000" & X"a" ;
--
--dy_data(12) <= hex & dp3 & "000" & X"f" ;
--dy_data(13) <= hex & dp3 & "000" & X"e" ;
--dy_data(14) <= hex & dp3 & "000" & X"d" ;

-- blink init led
cts <= clkdiv(25) ;
-- blink uart rx led
sin <= clkdiv(24);

end Behavioral;

