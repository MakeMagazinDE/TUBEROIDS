----------------------------------------------------------------------------------
-- Company:        
-- Engineer:       
-- 
-- Create Date:    21.08.09 
-- Design Name: 
-- Module Name:    Template - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 1.00 - File Created

--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;
use ieee.std_logic_unsigned.all;


entity godil48 is
Port (
  m49,sw1,sw2,sout,rts,c13,d13:                   in  std_logic ;
  cts,cso,vs2,sin:                                inout  std_logic ;
  tvs1,tvs0,tmosi,tdin,tcclk,tm1,thsw:            inout  std_logic ;
  pin:                                            inout  std_logic_vector(48 downto 1)
) ;
end godil48 ;


architecture Behavioral of godil48 is

begin



end Behavioral;

