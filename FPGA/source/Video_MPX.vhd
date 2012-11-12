----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:11:45 04/30/2008 
-- Design Name: 
-- Module Name:    Video_MPX - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Video_MPX is
    Port ( DAC_a : in  STD_LOGIC_VECTOR (7 downto 0);
           DAC_b : in  STD_LOGIC_VECTOR (7 downto 0);
           DAC_out : out  STD_LOGIC_VECTOR (7 downto 0);
           Z_a : in  STD_LOGIC_VECTOR (3 downto 0);
           Z_b : in  STD_LOGIC_VECTOR (3 downto 0);
           DAC_A0_a : in  STD_LOGIC;
           DAC_A0_b : in  STD_LOGIC;
           DAC_A1_a : in  STD_LOGIC;
           DAC_A1_b : in  STD_LOGIC;
           DAC_WR_a : in  STD_LOGIC;
           DAC_WR_b : in  STD_LOGIC;
           DAC_A0_out : out  STD_LOGIC;
           DAC_A1_out : out  STD_LOGIC;
           DAC_WR_out : out  STD_LOGIC;
           Z_out : out  STD_LOGIC_VECTOR (3 downto 0);
           Sel_b : in  STD_LOGIC);
end Video_MPX;

architecture Behavioral of Video_MPX is

begin
DAC_out <= DAC_b WHEN Sel_b ='1' ELSE 
            DAC_a; 
Z_out <= Z_b WHEN Sel_b ='1' ELSE 
            Z_a; 
DAC_A0_out <= DAC_A0_b WHEN Sel_b ='1' ELSE 
            DAC_A0_a; 
DAC_A1_out <= DAC_A1_b WHEN Sel_b ='1' ELSE 
            DAC_A1_a; 
DAC_WR_out <= DAC_WR_b WHEN Sel_b ='1' ELSE 
            DAC_WR_a; 
end Behavioral;

