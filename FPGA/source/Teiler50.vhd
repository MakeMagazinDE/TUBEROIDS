----------------------------------------------------------------------------------
-- Company: 
-- Engineer: C. Meyer - cm@ct.de
-- 
-- Create Date:    12:39:23 04/30/2008 
-- Design Name:    Frequenzteiler 49.152 MHz auf 50 Hz
-- Module Name:    Teiler50 - Behavioral 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Teiler50 is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end Teiler50;

architecture behave of Teiler50 is

signal count: std_logic_vector (19 downto 0);

begin

process (Reset, Clk) is
  begin

    if Reset = '1' then
      count <= x"00000";
		Q <= '0';
    elsif rising_edge(Clk) then
      count <= count +1;
		if count = 491520 then
			Q <= '1';
		end if;
		if count = 983039 then
			count <= x"00000";
			Q <= '0';		
		end if;
    end if;
  end Process;

end behave;

