-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity ROM4051 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of ROM4051 is

  function romgen_str2bv (str : string) return bit_vector is
    variable result : bit_vector (str'length*4-1 downto 0);
  begin
    for i in 0 to str'length-1 loop
      case str(str'high-i) is
        when '0'       => result(i*4+3 downto i*4) := x"0";
        when '1'       => result(i*4+3 downto i*4) := x"1";
        when '2'       => result(i*4+3 downto i*4) := x"2";
        when '3'       => result(i*4+3 downto i*4) := x"3";
        when '4'       => result(i*4+3 downto i*4) := x"4";
        when '5'       => result(i*4+3 downto i*4) := x"5";
        when '6'       => result(i*4+3 downto i*4) := x"6";
        when '7'       => result(i*4+3 downto i*4) := x"7";
        when '8'       => result(i*4+3 downto i*4) := x"8";
        when '9'       => result(i*4+3 downto i*4) := x"9";
        when 'A'       => result(i*4+3 downto i*4) := x"A";
        when 'B'       => result(i*4+3 downto i*4) := x"B";
        when 'C'       => result(i*4+3 downto i*4) := x"C";
        when 'D'       => result(i*4+3 downto i*4) := x"D";
        when 'E'       => result(i*4+3 downto i*4) := x"E";
        when 'F'       => result(i*4+3 downto i*4) := x"F";
        when others    => null;
      end case;
    end loop;
    return result;
  end romgen_str2bv;

  attribute INIT_00 : string;
  attribute INIT_01 : string;
  attribute INIT_02 : string;
  attribute INIT_03 : string;
  attribute INIT_04 : string;
  attribute INIT_05 : string;
  attribute INIT_06 : string;
  attribute INIT_07 : string;
  attribute INIT_08 : string;
  attribute INIT_09 : string;
  attribute INIT_0A : string;
  attribute INIT_0B : string;
  attribute INIT_0C : string;
  attribute INIT_0D : string;
  attribute INIT_0E : string;
  attribute INIT_0F : string;
  attribute INIT_10 : string;
  attribute INIT_11 : string;
  attribute INIT_12 : string;
  attribute INIT_13 : string;
  attribute INIT_14 : string;
  attribute INIT_15 : string;
  attribute INIT_16 : string;
  attribute INIT_17 : string;
  attribute INIT_18 : string;
  attribute INIT_19 : string;
  attribute INIT_1A : string;
  attribute INIT_1B : string;
  attribute INIT_1C : string;
  attribute INIT_1D : string;
  attribute INIT_1E : string;
  attribute INIT_1F : string;
  attribute INIT_20 : string;
  attribute INIT_21 : string;
  attribute INIT_22 : string;
  attribute INIT_23 : string;
  attribute INIT_24 : string;
  attribute INIT_25 : string;
  attribute INIT_26 : string;
  attribute INIT_27 : string;
  attribute INIT_28 : string;
  attribute INIT_29 : string;
  attribute INIT_2A : string;
  attribute INIT_2B : string;
  attribute INIT_2C : string;
  attribute INIT_2D : string;
  attribute INIT_2E : string;
  attribute INIT_2F : string;
  attribute INIT_30 : string;
  attribute INIT_31 : string;
  attribute INIT_32 : string;
  attribute INIT_33 : string;
  attribute INIT_34 : string;
  attribute INIT_35 : string;
  attribute INIT_36 : string;
  attribute INIT_37 : string;
  attribute INIT_38 : string;
  attribute INIT_39 : string;
  attribute INIT_3A : string;
  attribute INIT_3B : string;
  attribute INIT_3C : string;
  attribute INIT_3D : string;
  attribute INIT_3E : string;
  attribute INIT_3F : string;

  component RAMB16_S4
    --pragma translate_off
    generic (
      INIT_00 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_01 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_02 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_03 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_04 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_05 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_06 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_07 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_08 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_09 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_10 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_11 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_12 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_13 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_14 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_15 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_16 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_17 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_18 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_19 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_20 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_21 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_22 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_23 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_24 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_25 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_26 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_27 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_28 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_29 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_30 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_31 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_32 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_33 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_34 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_35 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_36 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_37 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_38 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_39 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000"
      );
    --pragma translate_on
    port (
      DO    : out std_logic_vector (3 downto 0);
      ADDR  : in  std_logic_vector (11 downto 0);
      CLK   : in  std_logic;
      DI    : in  std_logic_vector (3 downto 0);
      EN    : in  std_logic;
      SSR   : in  std_logic;
      WE    : in  std_logic 
      );
  end component;

  signal rom_addr : std_logic_vector(11 downto 0);

begin

  p_addr : process(ADDR)
  begin
     rom_addr <= (others => '0');
     rom_addr(11 downto 0) <= ADDR;
  end process;

  rom0 : if true generate
    attribute INIT_00 of inst : label is "08040424252424262520050058152FFFFFFF2FFFFFFF2FFFFF271FFFFF2E1F41";
    attribute INIT_01 of inst : label is "45C35025B150050350251D50C50B50A50952850150C0B0A090800589836826B9";
    attribute INIT_02 of inst : label is "8424262520053D0405D2C29C07B88F9035792579298804CF4F03343851851950";
    attribute INIT_03 of inst : label is "0028292C2A131C334BA1A334933472EF0F41DB0B2720862524242005E8A82D04";
    attribute INIT_04 of inst : label is "6111880D10B28BB0A8CAA425211094C99C28228E891C20A5AC58280530200000";
    attribute INIT_05 of inst : label is "5BC4C05A49035350525254905A870153505052545059C6020000002030B29282";
    attribute INIT_06 of inst : label is "D0C34A05A6534C7530B0C3058534C9535C0C34A059255350545254905C4544C0";
    attribute INIT_07 of inst : label is "CF0C345E534CF538E0C3050534C153DF0C34A05BA534CB534C0C305C534CD539";
    attribute INIT_08 of inst : label is "00020B28BB6100A2CAA0928A00115282A22D4A0CD5DC1A21D60120222534C353";
    attribute INIT_09 of inst : label is "114202C000920B460BC1AC1B94EA02CB115282B595A585095285326307300050";
    attribute INIT_0A of inst : label is "103D01103800530505830505353A30054305912384305C1B94034305C12B90AA";
    attribute INIT_0B of inst : label is "63334B005360533483346DE40FA960564107A064290222B0C1B940311022CC0B";
    attribute INIT_0C of inst : label is "EF0F42425205F4A4242520977000520452145440224545020000222109328D40";
    attribute INIT_0D of inst : label is "342425205F420922720F12AC3029B3DEDBCB9A922B0ED3EF4430CA3DF4430B93";
    attribute INIT_0E of inst : label is "A01A31032FD3F0120F50F3D7303220FEF919A9F208359D0580542425205F420A";
    attribute INIT_0F of inst : label is "0000000000000000000000000000000000000000000000000000012019019300";
    attribute INIT_10 of inst : label is "44A42A41AE000494A9489449429419E000884484A8488448428418E000000000";
    attribute INIT_11 of inst : label is "080000000D48D44D4AD48D44D42D41D6AC48C44C42C41C64B42B41B64A4AA48A";
    attribute INIT_12 of inst : label is "600ADDD30636636D3A7A4D43760CFC30FDFACA6D30CAAA0430DC1C71BF1A709B";
    attribute INIT_13 of inst : label is "C02C20000C2C0D90600DDAD7076A96996906D00F09066999F62320FD2A27F79A";
    attribute INIT_14 of inst : label is "AA0BA2F011C30C5860994A07C2D06020060648480600202404002006C60808C6";
    attribute INIT_15 of inst : label is "305367096AB0C8DD0090D0382D0665B0A3970EEC30641D081550F9BD060240E7";
    attribute INIT_16 of inst : label is "083D209FDF08CDD069BA035760E13304ADF0175A090D40094D071A50A4FD01E3";
    attribute INIT_17 of inst : label is "C7D2099A405C680113C09BE207EAA0064209FDB01855046D10EE3C03A79066B5";
    attribute INIT_18 of inst : label is "A8901ECC0B5200E8A506F2B0F6B208E5A06B120E1CC0AC9806954037220F6F20";
    attribute INIT_19 of inst : label is "D8F0042F00BBF0044F00DBF0073F0029F00EFF00C5F00AAF00A0F7322096450C";
    attribute INIT_1A of inst : label is "4F004BF00B2F0038F009DF00F1F0053F00A5F0005F0055F00A3F0001F006DF00";
    attribute INIT_1B of inst : label is "F008DF00D6F0010F003AF0055F005FF005AF0035F001FF00D9F0083F002BF00B";
    attribute INIT_1C of inst : label is "000EF00ACF005AF00FAF00AAF005CF00FEF0092F0027F00BDF0044F00BBF0024";
    attribute INIT_1D of inst : label is "FAF6A0FAF00A5F00CAF00E0F0026F007CF00D4F004BF00B4F004DF00D7F0062F";
    attribute INIT_1E of inst : label is "F67984467F58A7DB58F58A77358F49B62949F39C6EF39F29D6C529F19E6AA19F";
    attribute INIT_1F of inst : label is "FF916E5591F926DA392F936C0193F946B6D94F847BD884F857A4285F7689BB76";
    attribute INIT_20 of inst : label is "79F8A75B28AF8A75388AF9B649D9BF9C63F19CF9D62539DF9E61A59EF9F60059";
    attribute INIT_21 of inst : label is "A16F26D93526F36C91F36F46B9D946F57A88357F57A82B57F6897B468F79864B";
    attribute INIT_22 of inst : label is "24A7FB7488DB7FB649D6B6FC63910C6FD6293AD6FE61955E6FF6095FF6F16E95";
    attribute INIT_23 of inst : label is "25C6DF6C93FE6CF6B94926BF7B84277BF7A85BD7AF89764489F9867BB98FA758";
    attribute INIT_24 of inst : label is "8BD774F649B6264F639C0E63F629DAC62F619E5A61F609FFA60F6E91AA6EF6D9";
    attribute INIT_25 of inst : label is "936E0C9FB94626B9FA8577CA8FA857D4A8F97684B97F8679B486F758A4D75F74";
    attribute INIT_26 of inst : label is "49B69849F39C66239F29D65C29F19E64619FFAF640FAFE916A5E9FD926CAD9FC";
    attribute INIT_27 of inst : label is "F946B7694F847B2384F857AC085F76897C76F67983867F58A7F358F58A7CE58F";
    attribute INIT_28 of inst : label is "BF9C63299CF9D62CA9DF9E616B9EF9F600B9FF916E9B91F926D3A92F936CD993";
    attribute INIT_29 of inst : label is "46F57A83E57F57A80357F6897C868F79868C79F8A75308AF8A75E38AF9B64869";
    attribute INIT_2A of inst : label is "DC6FD629A3D6FE619B9E6FF609BFF6F16E9B616F26D9AC26F36C99236F46B968";
    attribute INIT_2B of inst : label is "DC7BF7A853F7AF89768389F9867C798FA7580CA7FB74832B7FB64967B6FC6399";
    attribute INIT_2C of inst : label is "D3562F619E9461F609FF460F6E91646EF6D92C56DF6C93266CF6B94896BF7B84";
    attribute INIT_2D of inst : label is "57FCA8F97683797F86797386F758ACF75F748B2C74F649B7964F639CD663F629";
    attribute INIT_2E of inst : label is "0C7C2C9CDBEB7B4BFE91649E9FD92653D9FC9366DC9FB94697B9FA857C1A8FA8";
    attribute INIT_2F of inst : label is "8AC8E6E4C2E0EECE806FAEA62E0EECE806FACEC28F0686A8AC8E0EECE806CCBC";
    attribute INIT_30 of inst : label is "F66484C6E8EACA88606E8EC0EF86A8AC8E6E4C4866E6EEFACEC464EF4C48086A";
    attribute INIT_31 of inst : label is "482606E8EC0E8EACA886F4C6E8EACA88666484C2E0EECE8062648FAA4A0EEEE6";
    attribute INIT_32 of inst : label is "E0EC0AFA2AA2202E0EC0AFA0E02CF0A8AACA08202E0EC0AFC6CACBC4C1CF2E4C";
    attribute INIT_33 of inst : label is "6DDD1D2DBD8DF8AACA08262404C6AEAE2FA0E04A42F404C08AACA08262402202";
    attribute INIT_34 of inst : label is "A6A482A0AE8E402FAAA22A0AE8E402FA8E824F0282A4A88A0AE8E4020DFD4DBD";
    attribute INIT_35 of inst : label is "4486A8AA8A48202E4E80AF82A4A88A6A484462E2EAFA8E8424AF4844082A4A88";
    attribute INIT_36 of inst : label is "02E4E80A8AA8A482F486A8AA8A4826244482A0AE8E4022244FA6460AEAE2F624";
    attribute INIT_37 of inst : label is "06FAEA62E0EECE806FACEC28F0686A8AC8E0EECE8063EAEEDFD8D5DF2A484422";
    attribute INIT_38 of inst : label is "5E6EFECEF86A8AC8E6E4C4866E6EEFACEC464EF4C48086A8AC8E6E4C2E0EECE8";
    attribute INIT_39 of inst : label is "42606E4E00EFA6AE2606E4E00EFA4E420F0E8EA0A48606E4E00E4E3E8EFEAE1E";
    attribute INIT_3A of inst : label is "686A4A08E0EE0E406F8EA0A4866644406EEEE6FA4E44E46F444008EA0A486664";
    attribute INIT_3B of inst : label is "E40686A4A08EF446686A4A08E6E40442606E4E00E2E40FA24206E6EEF6E40446";
    attribute INIT_3C of inst : label is "BF2FFAAA22A0AE8E402FA8E824F0282A4A88A0AE8E402DF6F3FF2644402E0EE0";
    attribute INIT_3D of inst : label is "000000000000000000FC39666333D6A9ACD02D23602DF2D23602DFC6F39DCA4F";
    attribute INIT_3E of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3F of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
  begin
  inst : RAMB16_S4
      --pragma translate_off
      generic map (
        INIT_00 => romgen_str2bv(inst'INIT_00),
        INIT_01 => romgen_str2bv(inst'INIT_01),
        INIT_02 => romgen_str2bv(inst'INIT_02),
        INIT_03 => romgen_str2bv(inst'INIT_03),
        INIT_04 => romgen_str2bv(inst'INIT_04),
        INIT_05 => romgen_str2bv(inst'INIT_05),
        INIT_06 => romgen_str2bv(inst'INIT_06),
        INIT_07 => romgen_str2bv(inst'INIT_07),
        INIT_08 => romgen_str2bv(inst'INIT_08),
        INIT_09 => romgen_str2bv(inst'INIT_09),
        INIT_0A => romgen_str2bv(inst'INIT_0A),
        INIT_0B => romgen_str2bv(inst'INIT_0B),
        INIT_0C => romgen_str2bv(inst'INIT_0C),
        INIT_0D => romgen_str2bv(inst'INIT_0D),
        INIT_0E => romgen_str2bv(inst'INIT_0E),
        INIT_0F => romgen_str2bv(inst'INIT_0F),
        INIT_10 => romgen_str2bv(inst'INIT_10),
        INIT_11 => romgen_str2bv(inst'INIT_11),
        INIT_12 => romgen_str2bv(inst'INIT_12),
        INIT_13 => romgen_str2bv(inst'INIT_13),
        INIT_14 => romgen_str2bv(inst'INIT_14),
        INIT_15 => romgen_str2bv(inst'INIT_15),
        INIT_16 => romgen_str2bv(inst'INIT_16),
        INIT_17 => romgen_str2bv(inst'INIT_17),
        INIT_18 => romgen_str2bv(inst'INIT_18),
        INIT_19 => romgen_str2bv(inst'INIT_19),
        INIT_1A => romgen_str2bv(inst'INIT_1A),
        INIT_1B => romgen_str2bv(inst'INIT_1B),
        INIT_1C => romgen_str2bv(inst'INIT_1C),
        INIT_1D => romgen_str2bv(inst'INIT_1D),
        INIT_1E => romgen_str2bv(inst'INIT_1E),
        INIT_1F => romgen_str2bv(inst'INIT_1F),
        INIT_20 => romgen_str2bv(inst'INIT_20),
        INIT_21 => romgen_str2bv(inst'INIT_21),
        INIT_22 => romgen_str2bv(inst'INIT_22),
        INIT_23 => romgen_str2bv(inst'INIT_23),
        INIT_24 => romgen_str2bv(inst'INIT_24),
        INIT_25 => romgen_str2bv(inst'INIT_25),
        INIT_26 => romgen_str2bv(inst'INIT_26),
        INIT_27 => romgen_str2bv(inst'INIT_27),
        INIT_28 => romgen_str2bv(inst'INIT_28),
        INIT_29 => romgen_str2bv(inst'INIT_29),
        INIT_2A => romgen_str2bv(inst'INIT_2A),
        INIT_2B => romgen_str2bv(inst'INIT_2B),
        INIT_2C => romgen_str2bv(inst'INIT_2C),
        INIT_2D => romgen_str2bv(inst'INIT_2D),
        INIT_2E => romgen_str2bv(inst'INIT_2E),
        INIT_2F => romgen_str2bv(inst'INIT_2F),
        INIT_30 => romgen_str2bv(inst'INIT_30),
        INIT_31 => romgen_str2bv(inst'INIT_31),
        INIT_32 => romgen_str2bv(inst'INIT_32),
        INIT_33 => romgen_str2bv(inst'INIT_33),
        INIT_34 => romgen_str2bv(inst'INIT_34),
        INIT_35 => romgen_str2bv(inst'INIT_35),
        INIT_36 => romgen_str2bv(inst'INIT_36),
        INIT_37 => romgen_str2bv(inst'INIT_37),
        INIT_38 => romgen_str2bv(inst'INIT_38),
        INIT_39 => romgen_str2bv(inst'INIT_39),
        INIT_3A => romgen_str2bv(inst'INIT_3A),
        INIT_3B => romgen_str2bv(inst'INIT_3B),
        INIT_3C => romgen_str2bv(inst'INIT_3C),
        INIT_3D => romgen_str2bv(inst'INIT_3D),
        INIT_3E => romgen_str2bv(inst'INIT_3E),
        INIT_3F => romgen_str2bv(inst'INIT_3F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(3 downto 0),
        ADDR => rom_addr,
        CLK  => CLK,
        DI   => "0000",
        EN   => '1',
        SSR  => '0',
        WE   => '0'
        );
  end generate;
  rom1 : if true generate
    attribute INIT_00 of inst : label is "37909BDBCBDBDBCBCBC8970D74873FFFFFFF3FFFFFFF3FFFFF3F1FFFFF3F1F20";
    attribute INIT_01 of inst : label is "173170173170170270270070070070070073070278787878707027FD08A08A07";
    attribute INIT_02 of inst : label is "7BDBCBDBD0970029970B0C20330B0E028FE08FE0CF22375FB46A9E8A70870870";
    attribute INIT_03 of inst : label is "DC2AD8C8C8027FA9EF80FA9EFA9EBDFD17E0F030CBD07BCBCBDBC897FD07002B";
    attribute INIT_04 of inst : label is "9353003350701B00703B01C1C170713B00D0D371D058DD87887AC0D78C8CFCEC";
    attribute INIT_05 of inst : label is "7EF80F7E9093F83FE3F82A0F7E7093F83FE3F82A0F7E4092DDEDFD8D8D0D0D0C";
    attribute INIT_06 of inst : label is "09F280F7E3F90E3F9B09F2FE3F90E3F9809F280F7E23F83FE3F82A0F72A0780F";
    attribute INIT_07 of inst : label is "309F21E3F90E3F9309F2FE4F90E4F9009F280F7E3F90E3F9F09F2FE3F90E3F9C";
    attribute INIT_08 of inst : label is "CDC20701B00B20703B007370B2171C0D0D37002072D340C0705B8BA24F90E4F9";
    attribute INIT_09 of inst : label is "171D1C0130707F106E060063700B1D37171D0D0F1E0F1E0073071C1132B21D7E";
    attribute INIT_0A of inst : label is "13013112013FF9FEF0F9FEF02F9C09FFA0F7E19B09CFE06370509CFF0603B07E";
    attribute INIT_0B of inst : label is "9CA9E04F9CEFFA9EFA9E0770913BFF2E013013FE0131C013063705B0131A0130";
    attribute INIT_0C of inst : label is "FD37BDBCBD9FF6EBDBCBC981B30272017201701320170132DDED1B01301DED04";
    attribute INIT_0D of inst : label is "BBDBCB99FF605E0ABC07099EC099ECFCEFCEFCE0D059ECFF61059ECFF61059EC";
    attribute INIT_0E of inst : label is "1C6000209F9CEC6049049DE1020C05F2EC6FCE20300BEFFD2F7BDBCB99FF605E";
    attribute INIT_0F of inst : label is "0000000000000000000000000000000000000000000000000000002761760002";
    attribute INIT_10 of inst : label is "0010010010001110010010010010010001210110010010010010010002000000";
    attribute INIT_11 of inst : label is "0100000151021011001001001001001001001001001001001001001011001001";
    attribute INIT_12 of inst : label is "D0E7D7D8E8E8E8E7E7D7D7D8D802828281818181802717276010010011011013";
    attribute INIT_13 of inst : label is "60B6B7B7B6B6072828271717272728282828108D8D08D8D8D8E8E8D7E7E7D7D7";
    attribute INIT_14 of inst : label is "1C01B1B01B0B00A0A0090900808018080B9B9B9B9B90B9B9B9B9B90B6B7B7B6B";
    attribute INIT_15 of inst : label is "F0AFAF09F9F08F8F08E8F07F7F06F6F05F5F04E4F04E4E03E3E02D2D02D2D01C";
    attribute INIT_16 of inst : label is "0F7F70E7F70F8F80F9F90FAFA0EBFB0EBEB0ECEC0DDDD0DDDD0CECE0BEBE0BEB";
    attribute INIT_17 of inst : label is "8080090900A0A00B1B00B1B10C1C10D2D20D2D20E3E30E4E40E4F40F5F50F6F6";
    attribute INIT_18 of inst : label is "5050140401414013130222202222031310414104140050500606007070071700";
    attribute INIT_19 of inst : label is "4DF884DF883CF883CF882BF882BF882AF8819F8819F8818F8818F07070060600";
    attribute INIT_1A of inst : label is "CF88CCF88BDF88BDF88ADF889EF889EF888EF888EF887EF886EF886EF885DF88";
    attribute INIT_1B of inst : label is "F88D4F88D5F88E6F88E6F88E7F88E7F88E8F88E9F88E9F88DAF88DBF88DBF88C";
    attribute INIT_1C of inst : label is "8861F8861F8871F8871F8881F8891F8891F88A2F88B2F88B2F88C3F88C3F88D4";
    attribute INIT_1D of inst : label is "78771878F8817F8816F8816F8825F8824F8824F8833F8833F8842F8842F8852F";
    attribute INIT_1E of inst : label is "F88773C88F88772B88F88772B88F88772A88F88771988F88771988F88771888F";
    attribute INIT_1F of inst : label is "7F88777E88F88776E88F88776E88F88775D88F88774D88F88774D88F88773C88";
    attribute INIT_20 of inst : label is "87F8778BD87F8778BD87F8778AD87F87789E87F87789E87F87788E87F87788E8";
    attribute INIT_21 of inst : label is "887F8778E987F8778E987F8778DA87F8778DB87F8778DB87F8778CC87F8778CC";
    attribute INIT_22 of inst : label is "D477F7788D477F7788D577F7788E677F7788E677F7788E777F7788E777F8778E";
    attribute INIT_23 of inst : label is "89177F77889177F7788A277F7788B277F7788B277F7788C377F7788C377F7788";
    attribute INIT_24 of inst : label is "874278F78875278F78876178F78876178F78877178F78877178F77888177F778";
    attribute INIT_25 of inst : label is "8871678F78872578F78872478F78872478F78873378F78873378F78874278F78";
    attribute INIT_26 of inst : label is "88774988F88774988F88774888F88774888F78774878F78871778F78871678F7";
    attribute INIT_27 of inst : label is "F88776B88F88776B88F88775B88F88775A88F88775A88F88774A88F88774988F";
    attribute INIT_28 of inst : label is "7F87789B87F87788B87F87788B87F87788B87F88777B88F88777B88F88776B88";
    attribute INIT_29 of inst : label is "87F8778B987F8778BA87F8778AA87F8778AA87F8778AB87F87789B87F87789B8";
    attribute INIT_2A of inst : label is "677F7788B777F7788B777F7788B777F8778B887F8778B887F8778B987F8778B9";
    attribute INIT_2B of inst : label is "9477F7788A477F7788A577F7788A577F7788B577F7788B677F7788B677F7788B";
    attribute INIT_2C of inst : label is "77478F78877478F78877478F77888477F77888477F77889477F77889477F7788";
    attribute INIT_2D of inst : label is "874578F78875578F78875578F78875478F78876478F78876478F78876478F788";
    attribute INIT_2E of inst : label is "40201000E0D0D0C0F78874778F78874778F78874678F78874678F78874678F78";
    attribute INIT_2F of inst : label is "ABABABABABABAAAAABAFBABABABAAAAABAFBAAABAFBABABABABABAAAAABA6040";
    attribute INIT_30 of inst : label is "FBABABABABABABABABAAAAABAFBABABABABABABABAAAAAFBAAABABAFBABA0BAB";
    attribute INIT_31 of inst : label is "BABABAAAAABABABABABAFBABABABABABABABABABABAAAAABABABAFBABABAAAAA";
    attribute INIT_32 of inst : label is "AAA9B9FBAB9BABAAAA9B9FBAAAB9FB9B9B9BABABAAAA9B9D0D0B0A0A090FBABA";
    attribute INIT_33 of inst : label is "504030201000FB9B9BABABABAB9B9A9AAFBAAAB9BAFBAB90B9B9BABABABABABA";
    attribute INIT_34 of inst : label is "8B8B8B8B8A8A8B8FB8B8B8B8A8A8B8FB8A8B8FB8B8B8B8B8B8A8A8B8B0808060";
    attribute INIT_35 of inst : label is "8B8B8B8B8B8B8B8A8A8B8FB8B8B8B8B8B8B8B8A8A8FB8A8B8B8FB8B80B8B8B8B";
    attribute INIT_36 of inst : label is "B8A8A8B8B8B8B8B8FB8B8B8B8B8B8B8B8B8B8B8A8A8B8B8B8FB8B8B8A8A8FB8B";
    attribute INIT_37 of inst : label is "B7FB7B7B7B7A7A7B7FB7A7B7FB7B7B7B7B7B7A7A7B72010F0E0E0D0FB8B8B8B8";
    attribute INIT_38 of inst : label is "70605040FB7B7B7B7B7B7B7B7A7A7FB7A7B7B7FB7B70B7B7B7B7B7B7B7B7A7A7";
    attribute INIT_39 of inst : label is "6B6B6A6A6B5FB6B5B6B6A6A6B5FB6A6B6FB5B5B6B6B6B6A6A6B5F0D0C0A09090";
    attribute INIT_3A of inst : label is "6B6B6B6B5B5A6A6B6FB5B6B6B6B6B6B6B5A5A6FB6A6B5B6FB6B60B5B6B6B6B6B";
    attribute INIT_3B of inst : label is "A6B6B6B6B6B5FB6B6B6B6B6B5B5B6B6B6B6A6A6B5B5B6FB6B6B6A6A5FB5B6B6B";
    attribute INIT_3C of inst : label is "4040FB5B5B5B5A5A5B5FB5A5B5FB5B5B5B5B5B5A5A5B5202010FB6B6B6B5B5A6";
    attribute INIT_3D of inst : label is "000000000000000000F4848484847474747057584857F57584857F4848474750";
    attribute INIT_3E of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3F of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
  begin
  inst : RAMB16_S4
      --pragma translate_off
      generic map (
        INIT_00 => romgen_str2bv(inst'INIT_00),
        INIT_01 => romgen_str2bv(inst'INIT_01),
        INIT_02 => romgen_str2bv(inst'INIT_02),
        INIT_03 => romgen_str2bv(inst'INIT_03),
        INIT_04 => romgen_str2bv(inst'INIT_04),
        INIT_05 => romgen_str2bv(inst'INIT_05),
        INIT_06 => romgen_str2bv(inst'INIT_06),
        INIT_07 => romgen_str2bv(inst'INIT_07),
        INIT_08 => romgen_str2bv(inst'INIT_08),
        INIT_09 => romgen_str2bv(inst'INIT_09),
        INIT_0A => romgen_str2bv(inst'INIT_0A),
        INIT_0B => romgen_str2bv(inst'INIT_0B),
        INIT_0C => romgen_str2bv(inst'INIT_0C),
        INIT_0D => romgen_str2bv(inst'INIT_0D),
        INIT_0E => romgen_str2bv(inst'INIT_0E),
        INIT_0F => romgen_str2bv(inst'INIT_0F),
        INIT_10 => romgen_str2bv(inst'INIT_10),
        INIT_11 => romgen_str2bv(inst'INIT_11),
        INIT_12 => romgen_str2bv(inst'INIT_12),
        INIT_13 => romgen_str2bv(inst'INIT_13),
        INIT_14 => romgen_str2bv(inst'INIT_14),
        INIT_15 => romgen_str2bv(inst'INIT_15),
        INIT_16 => romgen_str2bv(inst'INIT_16),
        INIT_17 => romgen_str2bv(inst'INIT_17),
        INIT_18 => romgen_str2bv(inst'INIT_18),
        INIT_19 => romgen_str2bv(inst'INIT_19),
        INIT_1A => romgen_str2bv(inst'INIT_1A),
        INIT_1B => romgen_str2bv(inst'INIT_1B),
        INIT_1C => romgen_str2bv(inst'INIT_1C),
        INIT_1D => romgen_str2bv(inst'INIT_1D),
        INIT_1E => romgen_str2bv(inst'INIT_1E),
        INIT_1F => romgen_str2bv(inst'INIT_1F),
        INIT_20 => romgen_str2bv(inst'INIT_20),
        INIT_21 => romgen_str2bv(inst'INIT_21),
        INIT_22 => romgen_str2bv(inst'INIT_22),
        INIT_23 => romgen_str2bv(inst'INIT_23),
        INIT_24 => romgen_str2bv(inst'INIT_24),
        INIT_25 => romgen_str2bv(inst'INIT_25),
        INIT_26 => romgen_str2bv(inst'INIT_26),
        INIT_27 => romgen_str2bv(inst'INIT_27),
        INIT_28 => romgen_str2bv(inst'INIT_28),
        INIT_29 => romgen_str2bv(inst'INIT_29),
        INIT_2A => romgen_str2bv(inst'INIT_2A),
        INIT_2B => romgen_str2bv(inst'INIT_2B),
        INIT_2C => romgen_str2bv(inst'INIT_2C),
        INIT_2D => romgen_str2bv(inst'INIT_2D),
        INIT_2E => romgen_str2bv(inst'INIT_2E),
        INIT_2F => romgen_str2bv(inst'INIT_2F),
        INIT_30 => romgen_str2bv(inst'INIT_30),
        INIT_31 => romgen_str2bv(inst'INIT_31),
        INIT_32 => romgen_str2bv(inst'INIT_32),
        INIT_33 => romgen_str2bv(inst'INIT_33),
        INIT_34 => romgen_str2bv(inst'INIT_34),
        INIT_35 => romgen_str2bv(inst'INIT_35),
        INIT_36 => romgen_str2bv(inst'INIT_36),
        INIT_37 => romgen_str2bv(inst'INIT_37),
        INIT_38 => romgen_str2bv(inst'INIT_38),
        INIT_39 => romgen_str2bv(inst'INIT_39),
        INIT_3A => romgen_str2bv(inst'INIT_3A),
        INIT_3B => romgen_str2bv(inst'INIT_3B),
        INIT_3C => romgen_str2bv(inst'INIT_3C),
        INIT_3D => romgen_str2bv(inst'INIT_3D),
        INIT_3E => romgen_str2bv(inst'INIT_3E),
        INIT_3F => romgen_str2bv(inst'INIT_3F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(7 downto 4),
        ADDR => rom_addr,
        CLK  => CLK,
        DI   => "0000",
        EN   => '1',
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
