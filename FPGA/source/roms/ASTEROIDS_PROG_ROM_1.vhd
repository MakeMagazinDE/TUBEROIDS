-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity ASTEROIDS_PROG_ROM_1 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of ASTEROIDS_PROG_ROM_1 is

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
    attribute INIT_00 of inst : label is "EBD002EBCE16D0F2300219ADF7F022A5E0F0E0006002BF8D027D8D025C8D023B";
    attribute INIT_01 of inst : label is "A907102406AD07D003A904102407AD77164C47A08B8602198E01A2E6D068FE20";
    attribute INIT_02 of inst : label is "6D11A5AA7C6568B620023AAD128540A935102405ADC0B04A76A57985796518FD";
    attribute INIT_03 of inst : label is "8D68EA20025B6D11A5AA7D6568B620025BAD128500A97C86023A8D68EA20023A";
    attribute INIT_04 of inst : label is "AA00A9023A8D023A6D8A7C857C6518CA02900A0A023AED38AA00A9607D86025B";
    attribute INIT_05 of inst : label is "BDAA4A4A4A70B620031060025B8D025B6D8A7D857D6518CA02900A0A025BED38";
    attribute INIT_06 of inst : label is "18112611840A8801900A00A049BB2071012012651879A511854A0110732468E1";
    attribute INIT_07 of inst : label is "76A560C1A901A204B0C1C9603FA9FFA20D9040C9093011102030405060708060";
    attribute INIT_08 of inst : label is "02009D00A902E7CE0AF010250E300A0200BD18A2108502A921D0DEE625D00329";
    attribute INIT_09 of inst : label is "BD0F90FBC9049005C9027CED380263BD1EF00200BD18A2E3101006E910CA07F0";
    attribute INIT_0A of inst : label is "03F002ECAD18A2101C6002EBEE60E8DA10CA05B0FBC9099005C9029DED380284";
    attribute INIT_0B of inst : label is "CA02F89D06A2D1951EA602FF8DE3D0021AADE830EAF00219AD07F022A569DE4C";
    attribute INIT_0C of inst : label is "DC85EB6918DB8570B620D9850AA902900AC9A802F06D18040902292801ADFA10";
    attribute INIT_0D of inst : label is "18A2098402E78C09A0029009C002F0EE66B32006D022A507903FC0DA8570B620";
    attribute INIT_0E of inst : label is "00A902ED8D30A902E88D7FA9F8D009C6CA69E7201AA002EEEE03B00AC902EEAD";
    attribute INIT_0F of inst : label is "029018C913901F294A2C0AAD6A3B2002009D040938292C0AAD60FA10CA02009D";
    attribute INIT_10 of inst : label is "02BE8D60A96002C69D02849D00A902639D0BF002A59D02639D00A902849D1729";
    attribute INIT_11 of inst : label is "8F292C0AAD6002EF8DFFA9029D8D0CA9027C8D10A9025B8D023A8D00A902DF8D";
    attribute INIT_12 of inst : label is "429D6A622002427918F00902108F292C0AAD02219D6A622002217918F0090210";
    attribute INIT_13 of inst : label is "22A560DAA50290DAC5D9A502B0D9C560DBA50F90DBC5DCA502B0DCC50D106002";
    attribute INIT_14 of inst : label is "A57AEA2070A97A1F20DBA219A9018410A002D01EA500A07CD520C3A281A90DF0";
    attribute INIT_15 of inst : label is "95203803A062A908F0102976A5063002EBAD0BD00219AD10D01EA5149002C922";
    attribute INIT_16 of inst : label is "05018500A96B892003F005300219AD0AD01EA57C6F2028A96B742000A96FA47C";
    attribute INIT_17 of inst : label is "79F820138400A07C95203803A023A97AEA2050A97A1F20DBA274A91EF0250524";
    attribute INIT_18 of inst : label is "A510A27C95203803A020651868A971622000A90DA01230F9A516F022A56D4220";
    attribute INIT_19 of inst : label is "1EA514F022A57AEA2050A97A1F20DBA2C0A90186AA01D01EA5059063F001C922";
    attribute INIT_1A of inst : label is "742001A970A47C95203803A065A908F0102976A5063002EBAD0BD00219AD10F0";
    attribute INIT_1B of inst : label is "C801D002300319AE09F01E456B894C173019F00219AD1EF01EA57C6F20CFA96B";
    attribute INIT_1C of inst : label is "2020798540A94879A58B85C169FF4948600190C0C98BA560F730F9F00219AE60";
    attribute INIT_1D of inst : label is "07660846076608460566064605660646056606460E860184608B85687985686E";
    attribute INIT_1E of inst : label is "80B9A84A0C290CF019E013100200BD600EA66BD1200EA66C27200766084608E6";
    attribute INIT_1F of inst : label is "B9A806294A4A4A4A754C03100A21B01DF01AE01BF019E06D5B4C1FD04D81BE4D";
    attribute INIT_20 of inst : label is "2976A50EA67AEC20F0A270A9F1D0C7A234A96E204C6681207CD54C779EBE779D";
    attribute INIT_21 of inst : label is "D010E938687AEA2090A9480C90A0C901E53870A97A382005A2600200DE03D003";
    attribute INIT_22 of inst : label is "6295627518F02910A520A61286F8118510664A10664A10664A10666A7AEA4CF0";
    attribute INIT_23 of inst : label is "A569956975F8A518199069D563B506D021906AD56495647500A96395637511A5";
    attribute INIT_24 of inst : label is "D022A6603C048D6A4A1EA56012A6D87EE66FF604B00AC96FB51EA66A956A75F9";
    attribute INIT_25 of inst : label is "A5601871592007A07148207AEA2070A97A1F2068A270A9018618F0042977A51C";
    attribute INIT_26 of inst : label is "00B51186018510A923A21285A7A91386108600A271592000A0E0F02505240523";
    attribute INIT_27 of inst : label is "01A03810A91085D8016918F810A57AEA2040A97A1F2012A65FA95AF002150115";
    attribute INIT_28 of inst : label is "10A56D422079F82000A07C95203803A011A579F82000A07AEC20AA40A97C9520";
    attribute INIT_29 of inst : label is "989041E0E8E8E811A6128508E93812A57C712002A0B2A9AA026912A50CB004C9";
    attribute INIT_2A of inst : label is "A2C90219AD60F810CA03F00200BD18A26013E666C52013A46D48206D48206038";
    attribute INIT_2B of inst : label is "01089D0A074507292C0AAD01109D2A06A501009D0A054507292C0AAD07A23BB0";
    attribute INIT_2C of inst : label is "8507A9C710CAE7956E1520DF956E152001209DF8690F292C0AAD01189D2A08A5";
    attribute INIT_2D of inst : label is "04294A4A4A484A4AEF9501207DEFB509856069F02970B6200219AD15A6158512";
    attribute INIT_2E of inst : label is "6ABDAA1E29686C27206DF620AA0869188A058507A506856DF620098509050A85";
    attribute INIT_2F of inst : label is "007D18880110DFB500A060AE1015C662212000A21185C0492A506BBD10850A50";
    attribute INIT_30 of inst : label is "600069FC691807292C0AAD60076608854A01109D072901107D98078501009D01";
    attribute INIT_31 of inst : label is "A9128580292C0AAD0A8504292C0AAD098504292C0AAD8B8506694AB0C0C98BA5";
    attribute INIT_32 of inst : label is "0985090570A9029000A94A2C0AAD6E962000A200A01086118587A24DA9158509";
    attribute INIT_33 of inst : label is "60A902B060C9F0298BA56221206EA5206E9620E21015C60985042909A56E9620";
    attribute INIT_34 of inst : label is "116500A910851065389801A231F0042976A5371024052C6E962007A209850905";
    attribute INIT_35 of inst : label is "698A1085C66918E802900A53BCB953A2A84A986EC62040E93879A562214C1185";
    attribute INIT_36 of inst : label is "A5A801690E4904900E2910A512850A6EEEB9A84A4A4A4A10854A6000A2118500";
    attribute INIT_37 of inst : label is "18D0A2A659F022A610468221A0038122A300600A85042912A512060985042912";
    attribute INIT_38 of inst : label is "0E12F014300219ADDD867716205FA007F0DDA50BF07E867716202FA009F07EA5";
    attribute INIT_39 of inst : label is "838504A911D084C61510848502EDAD1CD083C60BF083A508F002E7AD10662405";
    attribute INIT_3A of inst : label is "603C038D10A536008E7F86CA01F03F29AA7FA57713206F60BCAA012982A582E6";
    attribute INIT_3B of inst : label is "02F0AA4A07290200B90F854A48004C03100A78290200B902EA8D50A90E860F07";
    attribute INIT_3C of inst : label is "6D502034F00200BE6C4420184D75BD079004C904F00EA50FF022A50200990F05";
    attribute INIT_3D of inst : label is "2002E7EE15306D522002A59D02A55D0A1F290221BD6A3B2061EB2002E7EE2F30";
    attribute INIT_3E of inst : label is "CE854385428577854D1022A5600EA602C69D02C65D0A1F290242BD6A3B2061EB";
    attribute INIT_3F of inst : label is "CAE8901EC0C8C8C82E9064F50025B963F50024B962D50023B900A003A2784420";
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
