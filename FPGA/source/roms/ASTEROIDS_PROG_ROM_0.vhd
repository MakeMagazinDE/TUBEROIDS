-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity ASTEROIDS_PROG_ROM_0 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of ASTEROIDS_PROG_ROM_0 is

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

  attribute INITP_00 : string;
  attribute INITP_01 : string;
  attribute INITP_02 : string;
  attribute INITP_03 : string;
  attribute INITP_04 : string;
  attribute INITP_05 : string;
  attribute INITP_06 : string;
  attribute INITP_07 : string;

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

  component RAMB16_S9
    --pragma translate_off
    generic (
      INITP_00 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_01 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_02 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_03 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_04 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_05 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_06 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_07 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";

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
      DO    : out std_logic_vector (7 downto 0);
      DOP   : out std_logic_vector (0 downto 0);
      ADDR  : in  std_logic_vector (10 downto 0);
      CLK   : in  std_logic;
      DI    : in  std_logic_vector (7 downto 0);
      DIP   : in  std_logic_vector (0 downto 0);
      EN    : in  std_logic;
      SSR   : in  std_logic;
      WE    : in  std_logic 
      );
  end component;

  signal rom_addr : std_logic_vector(10 downto 0);

begin

  p_addr : process(ADDR)
  begin
     rom_addr <= (others => '0');
     rom_addr(10 downto 0) <= ADDR;
  end process;

  rom0 : if true generate
    attribute INIT_00 of inst : label is "FC9075464BA220FB3020022C695920CD8520A9CE85CB85CC850AD0CDA57BE320";
    attribute INIT_01 of inst : label is "292A779AB903850A7799B940018D779ABD40008D7799BDA80249AA0A012976A5";
    attribute INIT_02 of inst : label is "4A4A11854A645510850F2964B520A677E630D076E634008D30008D048540091F";
    attribute INIT_03 of inst : label is "20D3850FA9029010C9FB7518FA95FBF602D0FAD508D080C077A41FA610651165";
    attribute INIT_04 of inst : label is "10206497206659200FD074A519B06C9D201E10656B206FD42042B04BE1207AFF";
    attribute INIT_05 of inst : label is "F002ECAD79DA207A1F20AA7FA96EF6206A7E2060F72066DC206322204A9E2068";
    attribute INIT_06 of inst : label is "1013058AA560187BC74C0330432542A5B260144C60114C03D002E70D02ECCE03";
    attribute INIT_07 of inst : label is "02F00219BD07A2714679EB4C98C81EA471592001A071594C6001F0202976A507";
    attribute INIT_08 of inst : label is "F630F8F00200B9E9308803D08A8807B004E01AA060728602307124F610CA0A10";
    attribute INIT_09 of inst : label is "FD3802A5B9DB90FAC903E9029DFD0284B9E790FAC903E9027CFD380263B90C85";
    attribute INIT_0A of inst : label is "C6B909850069FF4909A5C0D0FE49C4100EF00A09664A027CFD0263B9098502BE";
    attribute INIT_0B of inst : label is "850069FF490AA59DD0FE49A1100EF00A0A664A029DFD0284B90A8502DFFD3802";
    attribute INIT_0C of inst : label is "B00C461E6914B00C462A6910B019C061DE2003D061D52008B007F001E004A90A";
    attribute INIT_0D of inst : label is "0C856A0C65184A0C851B900AC51F9009C561D52003D061DE2005F00A903C690E";
    attribute INIT_0E of inst : label is "1C69601C6908690210732461164C00A0AA6862A120488A09B00CC56A09650AA5";
    attribute INIT_0F of inst : label is "9D02A5B902009D090518292C0AAD098507290200B960126902B0684A021AAD48";
    attribute INIT_10 of inst : label is "02429D0242B902219D0221B902849D0284B902C69D02C6B902639D0263B902A5";
    attribute INIT_11 of inst : label is "B1C8039110B1C8C8039110B117B0F0C98803910A4510B1C8C82D301224FFA060";
    attribute INIT_12 of inst : label is "2CB0F0C910B1C8148510B1C8F1D0C80391094510B17A554CDF10CA0391094510";
    attribute INIT_13 of inst : label is "88039110510A4513A588039114A54810B18803910945105113850F291051C8C8";
    attribute INIT_14 of inst : label is "B0039109451051688803910A45105148072914457A554CCB10CAC8C8C8039168";
    attribute INIT_15 of inst : label is "023A9D00A902199DA0A962F82016D08AC8CA08D019C006D001E062B074E720E4";
    attribute INIT_16 of inst : label is "6A4A024903290200B96F622034B021F019C002199D00A93FB00D9019C0025B9D";
    attribute INIT_17 of inst : label is "81A9AA6FD61EA68ADFD062F8206002429902219900A9020099A0A97F853F096A";
    attribute INIT_18 of inst : label is "4C6C442020A902B000A94A021AADC5F022A502E88D02E9AD60DE8505A902EB8D";
    attribute INIT_19 of inst : label is "AD07F022A567FA2063C54C770D4C17A005100AF0021AAD6001F0032976A562D7";
    attribute INIT_1A of inst : label is "02EAADCBF002E7AE02E88D01A9D5D002E8CE02EACE03F002EAADE230E4F00219";
    attribute INIT_1B of inst : label is "4A02E06E4A02E06E4A2C0AAD02E98D039020C906E93802E9ADC1B002EEEC05F0";
    attribute INIT_1C of inst : label is "3B8CF0A01FA9CA059010A0AA00A90A2C0AAD029E8D10E9029012C9046902E06E";
    attribute INIT_1D of inst : label is "A863C2B9021A8C88019004C902E7ED3802EEAD0CF0D3A502A002BF8E027D8D02";
    attribute INIT_1E of inst : label is "CE05D002EBAD05F022A5025C8D6457BDAA03292C0AAD0CD00A76A5371777164C";
    attribute INIT_1F of inst : label is "2003B02C0AEC40A202B04A021AADAAA20FF022A519A002E88D0AA96001F002E8";
    attribute INIT_20 of inst : label is "49E7204A22203BA2A821691818A512850CA5138549E7204A22201AA21884645B";
    attribute INIT_21 of inst : label is "7A6564531D0310644F3D2C0AAD03A2029003E0D3A617D019C918A57A854A3220";
    attribute INIT_22 of inst : label is "D00200B988100000F078707060878F8F9F64C84C188518A60F8501A903A07A85";
    attribute INIT_23 of inst : label is "100263F938027DAD6018EB1002E8BDAA4A4A0A9040C9F730603819A0F8108807";
    attribute INIT_24 of inst : label is "60FF8603D022A500A260CBB008C9FF4902100284F938029EADDAB008C9FF4902";
    attribute INIT_25 of inst : label is "0F8503A9188660E4B00FC9059002C9FFA5FFE6F0D002EBADF510FE24F9307324";
    attribute INIT_26 of inst : label is "A670FE207AA502199912A90E8660F6D00FC48806F00219B907A07A8579A519A2";
    attribute INIT_27 of inst : label is "207AA5023A9991A902B091C906D06FA90A9070C9083002217D180A856A80C90E";
    attribute INIT_28 of inst : label is "025B9991A902B091C906D06FA90A9070C9083002427D180D856A80C90EA67101";
    attribute INIT_29 of inst : label is "027C99027C7D09A502BE9902BE7D180A65186A80C918A60986CA01100AA500A2";
    attribute INIT_2A of inst : label is "029D99029D7D0CA502DF9902DF7D180D65186A80C918A60C86CA01100DA500A2";
    attribute INIT_2B of inst : label is "18F04A21A560FFA978442003D022A50A10432542A577174C1FA0029001E027A0";
    attribute INIT_2C of inst : label is "2002A06C95201E4679EB209804D0102976A51E8488011043A602A071592001A0";
    attribute INIT_2D of inst : label is "EA2070A97A1F2039A264A9018520A971592005A071592004A071592003A07159";
    attribute INIT_2E of inst : label is "20030E66C520C8C80CA466C520C80CA466C5200D85416518980C8442B41EA67A";
    attribute INIT_2F of inst : label is "F0A241861E8600A24295FFA91EA61A9003C941A541E62ED007C91F297BA57B26";
    attribute INIT_30 of inst : label is "4285FFA908D077A544950BA97785F4A90DA60DE66C954C7BC720031042A57786";
    attribute INIT_31 of inst : label is "0EB00BC0103088031024062CC8011024072C44B40DA62CD0072976A5D4304385";
    attribute INIT_32 of inst : label is "AD21F022A573466000A9449400A0029025C024A008D00BA00CF000A004F001C0";
    attribute INIT_33 of inst : label is "02EFCE03D0032976A577132057A00E10736620030E15F002EFAD1AF01C300219";
    attribute INIT_34 of inst : label is "860A86098600A21185108650A912A24860A902B060C9F02902EFADFB10732460";
    attribute INIT_35 of inst : label is "009D02009D8A00A202EE8D06A96E964C098500A96E962009856807A262212012";
    attribute INIT_36 of inst : label is "00A920A279F84C7A184C56A9B0A20730432542A50DD0A80A0044B960F7D0E803";
    attribute INIT_37 of inst : label is "3801F04A012976A507D019E04A4A4A4A70B620631060F810CA04D00200BD1985";
    attribute INIT_38 of inst : label is "4C6A1B20CBF002009D00A902EC8C7FA005D002E7CE17B013F019E0253002007D";
    attribute INIT_39 of inst : label is "63BD058502A5BDA8F0A902D019E0106918F02902009DEBD002E88D02E9AD6715";
    attribute INIT_3A of inst : label is "84A84A4A3C2911B019E015101B061B8567E54C08850284BD078502C6BD068502";
    attribute INIT_3B of inst : label is "02637D98058502A59D02A57D8801100221BD1800A048BE2003301D8502F8B91C";
    attribute INIT_3C of inst : label is "02FFCE02E7CE12B004C016301DA41A101B2466E74C67EB2006D01AE02A9020C9";
    attribute INIT_3D of inst : label is "C67D8801100242BD00A01806857F2902639D1F29DFF002F89902009D00A91CA4";
    attribute INIT_3E of inst : label is "03290200BD088502849D00A902D017A904F0089018C902847D98078502C69D02";
    attribute INIT_3F of inst : label is "8D021A8D00A9A868770D2017A0489802E88D02E9AD66E74C6BA820A8680CB9A8";
  begin
  inst : RAMB16_S9
      --pragma translate_off
      generic map (
        INITP_00 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_01 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_02 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_03 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_04 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_05 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_06 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_07 => x"0000000000000000000000000000000000000000000000000000000000000000",

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
        DO   => DATA(7 downto 0),
        DOP  => open,
        ADDR => rom_addr,
        CLK  => CLK,
        DI   => "00000000",
        DIP  => "0",
        EN   => '1',
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
