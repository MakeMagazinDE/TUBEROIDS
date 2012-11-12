----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:11:45 04/30/2008 
-- Design Name: 
-- Module Name:    DAC_MPX - Behavioral 
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

entity DAC_MPX is
    Port ( DACX : in  STD_LOGIC_VECTOR (9 downto 0);
           DACY : in  STD_LOGIC_VECTOR (9 downto 0);
           DACZ : in  STD_LOGIC_VECTOR (3 downto 0);
           DACAUD : in  STD_LOGIC_VECTOR (7 downto 0);
           BEAM_ENA : in STD_LOGIC;
           MPXOUT : out  STD_LOGIC_VECTOR (7 downto 0);
           DACZ_DEL : out  STD_LOGIC_VECTOR (3 downto 0);
           MPX_A0 : out STD_LOGIC;
           MPX_A1 : out STD_LOGIC;
           DACWR_N : out STD_LOGIC;
           CLKDIV2 : out  STD_LOGIC;
           CLKDIV8 : out  STD_LOGIC;
           CLK : in  STD_LOGIC);
end DAC_MPX;

architecture behave of DAC_MPX is

signal state_dac: std_logic_vector (1 downto 0) := "00";
signal divider: std_logic_vector (3 downto 0) := "0000";
signal state_clk, dac_wr_temp: std_logic := '0';
signal dacx_int, dacy_int, dacaud_int: std_logic_vector (7 downto 0) := x"00";
signal dacz_int: std_logic_vector (3 downto 0) := "0000";


begin

DACWR_N <= divider(2);

state_clk <= divider(2);

CLKDIV2 <= divider(0);
CLKDIV8 <= divider(2);

MPX_A0 <= state_dac(0);
MPX_A1 <= state_dac(1);
			
MPXOUT <=	dacx_int when state_dac = "00" else
				dacy_int when state_dac = "01" else
				(dacz_int & "0000") when state_dac = "10" else
				dacaud_int;
				
dacz_int <= DACZ; -- early Z

DACZ_DEL <= not dacz_int;

	process (state_clk) is
	begin
		if (BEAM_ENA = '1') then
			state_dac <= "00";
			dacx_int <= DACX(9 downto 2);
			dacy_int <= DACY(9 downto 2);
			dacaud_int <= DACAUD;
--			dacz_int <= DACZ; -- late Z
		elsif rising_edge(state_clk) then
			state_dac <= state_dac +1;
			
		end if;
	end process;


	process (Clk) is
	begin
		if rising_edge(Clk) then
			divider <= divider +1;
		end if;
	end process;

--	process (BEAM_ENA) is
--	begin
--		if rising_edge(BEAM_ENA) then
--			state_dac <= "00000";
--			dacx_int <= DACX(9 downto 2);
--			dacy_int <= DACY(9 downto 2);
--			dacaud_int <= DACAUD;
--			dacz_int <= DACZ;
--		end if; 
--	end process;

end behave;

