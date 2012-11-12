--------------------------------------------------------------------------------
-- DDS-Adressgenerator, Phasenwinkel in 
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity dds_generator is
	generic (
		w_phase : integer := 32;
		w_d_phase : integer := 32;
		w_dac_wert : integer := 16;
		w_dac_addr : integer := 16 );
	port (
		takt : in std_logic;
		d_phase : in std_logic_vector ( w_d_phase-1 downto 0 );
		neustart : in std_logic;	-- Trigger bei	steigender Flanke
				-- Übernahme synchron mit takt, wenn neustart = '1'
		start_phase : in std_logic_vector ( w_phase-1 downto 0 ); 
		dac_addr : out std_logic_vector ( w_dac_addr-1 downto 0 )
);
end entity dds_generator;

architecture arch1 of dds_generator is

begin
	set_phase : process ( takt )
		variable phase : unsigned ( w_phase-1 downto 0 );
	begin
		if rising_edge( takt ) then
			if neustart = '0' then
				phase := phase + unsigned( d_phase );
			else
				phase := unsigned( start_phase );
			end if;
		end if;
		dac_addr <= std_logic_vector(phase (w_phase-1 downto w_phase-16));
	end process;
end arch1;