-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity ASTEROIDS_PROG_ROM_3 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of ASTEROIDS_PROG_ROM_3 is

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
    attribute INIT_00 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_01 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_02 of inst : label is "01FFADD8488A48984840011001FF2C602C088DFB10CA9B9507A200A9FFFFFFFF";
    attribute INIT_03 of inst : label is "42A51DD022A638008DFED0059003C975A575E60DD0032978A578E6FED001D00D";
    attribute INIT_04 of inst : label is "02A27742208D85FF492C08AD2C0B8E2C0F8E07A2FDD0CA04A22C0F8E17104325";
    attribute INIT_05 of inst : label is "06AD969501E902909807C9072978A5A80AB01BC910F037901F2996B50A2400BD";
    attribute INIT_06 of inst : label is "B0381FD093D623F093B5189395969500A98EC608F08EA58E85F0A904F0802920";
    attribute INIT_07 of inst : label is "A92A90939578A93801F093B59695CAB01FA91801F0D190206996B509B01BC91C";
    attribute INIT_08 of inst : label is "859965483801A902F010298DA508D002690CF04A4A0C298DA50CF0169001E000";
    attribute INIT_09 of inst : label is "850A3077A5F93899A5A84A4A4A4A4A8DA578A04C0330CA90F68F858F65386899";
    attribute INIT_0A of inst : label is "9A850E309A6508B08F6538FF4900694A1AF0A803298DA59AE602D003C09AE699";
    attribute INIT_0B of inst : label is "C8EF69059010C909F090B502A200A027B04A78A58F858CE68CE602B002C000A9";
    attribute INIT_0C of inst : label is "8D91A53C058D90A5F210CA03309095EF691807F090B502A210D098F010CA9095";
    attribute INIT_0D of inst : label is "8C2C008DAFA008A90AF08EA53C018D6A3C008D6A6A034985A53C078D92A53C06";
    attribute INIT_0E of inst : label is "039100A0B0A902D0D0A94068A868AA68FE850A0809FEA5059020040E00A92C01";
    attribute INIT_0F of inst : label is "F9BE00A002904AC0602879F820A80A080169180F2905F00F29049070D00391C8";
    attribute INIT_10 of inst : label is "A0EDD0C0090F294A3DD0C803916A8A88039101A0E0090F294A7CD54C56F8B956";
    attribute INIT_11 of inst : label is "03B5039100A002B505A2078508260A08260A8A058506260A06260A0884068400";
    attribute INIT_12 of inst : label is "6004E602900385036538980391C801050F2901B50391C800B50391C8A0090F29";
    attribute INIT_13 of inst : label is "8A078507E58A0A9080C908A50926068506E58A058505E58A0A9080C906A500A2";
    attribute INIT_14 of inst : label is "0AC8043016F0070505A509A202A010D001A024B002C908F006050926088508E5";
    attribute INIT_15 of inst : label is "0A2A09662A09660AFF490AE9388A0685F6D088082607062A050606A5AA98FC10";
    attribute INIT_16 of inst : label is "C8060502050A022909A50391C805A50391C80805F42909A5039107A500A00985";
    attribute INIT_17 of inst : label is "A57A554C03918AC80391C8C803919888039101A000A270A97A1F207A554C0391";
    attribute INIT_18 of inst : label is "8640A206D0CCC6CBC60EA932009D3A008D06A9CBA61C101AF0CDA521D00C2978";
    attribute INIT_19 of inst : label is "90CFA5CEE6CEE6CEE6CC850C107BC0B935100ACF8402D0CCA4603A008DCBE6CD";
    attribute INIT_1A of inst : label is "A2C29015E0E80CA93A008D04A932009DCBA6CCE623B5CF85CF6523B5AACE650B";
    attribute INIT_1B of inst : label is "2A107BC0B900A23A008D08A93A008D09A93A008D32009D08A9CBA6BEF0CD8600";
    attribute INIT_1C of inst : label is "CBA6D0E6F81088CA4495239500A9AACE659802A016F0CF453A008E2C40ADCC86";
    attribute INIT_1D of inst : label is "DEF000A9CCE6CF85CF650023993A008E2C40ADA8CE65F410CEE6CEE6CEE6B810";
    attribute INIT_1E of inst : label is "CE84CB86CACC8615A20BF0D0A5CD661190CEC508A917D0CDA4FF232221020100";
    attribute INIT_1F of inst : label is "D0E802009DF9D0CA6495619503A200A940038DB0A9711820FB3020022C60D084";
    attribute INIT_20 of inst : label is "A902E88D02E98D98A963002001A9FD85FB8502292801ADFC85FA85D385DD85FA";
    attribute INIT_21 of inst : label is "7C6BB9A803292800AD7FCF2002ED8D30A943854285FFA902EE8D06A902EC8D7F";
    attribute INIT_22 of inst : label is "298DA5E801D003C0E8E8AA28022D03A96D85F9856A8501A902306C856985F885";
    attribute INIT_23 of inst : label is "4C7AEA2070A97A1F200184E0A00984D5A2FF50200078444C6E86E801D003C903";
    attribute INIT_24 of inst : label is "1B851C65181C84881D86083803A0F7A960F31002F009C67CD520A4A9CAA27C89";
    attribute INIT_25 of inst : label is "101CC61BA61BC679E52000B51BA61801D01CA579E520284A4A4A4A00B508AA28";
    attribute INIT_26 of inst : label is "7A554C03918AC8039100A0CBA20AA979EB2003292800BD0CC60CA67CC52060E1";
    attribute INIT_27 of inst : label is "009D01009D00958AF3900A9854D001005DA801009D11A92C0F8E00A2D89AFEA2";
    attribute INIT_28 of inst : label is "8DCAD0CA47009D46009D45009D44009D43009D42009D41009D40009D03009D02";
    attribute INIT_29 of inst : label is "D000558A00A2E890FBE006F0EFD08A051020072CE801009D20D001005D8A3400";
    attribute INIT_2A of inst : label is "D0005198018502A934008DE7D0CA009400A0F5900A9841D00055A8009511A907";
    attribute INIT_2B of inst : label is "40A9DE9004E001A601E634008DE9D0C8F3900A8A009125D00051AA009111A92E";
    attribute INIT_2C of inst : label is "2A10C9C8019044E0C8069004E001A600A00EF000A06472B0D49048E0D69040E0";
    attribute INIT_2D of inst : label is "8EA8A22C008E80A2029020A22C0F8C07A04AF9900A0A04308803292A02C91F29";
    attribute INIT_2E of inst : label is "1020012C08A02C018EED1088F0D034008DCAFB3020012CFB1020012C00A22C01";
    attribute INIT_2F of inst : label is "AAA800A9FE10F8302007AD34008DBCD0AAEDD088F0D034008DCAFB3020012CFB";
    attribute INIT_30 of inst : label is "58C90AA534008DE81095F5100CC60AE6FBD0C809711855A90C8507A90A8548A9";
    attribute INIT_31 of inst : label is "10A91AE602F00300AD1AE602F00200CD3C048D03008DD89080C960A902D0E090";
    attribute INIT_32 of inst : label is "038500A934008DFB3020022CF310CAFB302001ADFB102001AD24A23C048D0185";
    attribute INIT_33 of inst : label is "0D8696A27A182057A9CCA207F01AA560004C01FF8D06D080292007AD048540A9";
    attribute INIT_34 of inst : label is "BC0CA679F8207FEEBC0CA67AE52020A90D8508E9388A0DA60C8621F010B505A2";
    attribute INIT_35 of inst : label is "C67CC2200C8603A27AE520A0A293A97A182044A257A9D810CA0CA679F8207FF4";
    attribute INIT_36 of inst : label is "2C0F8D07A97AE520B0A293A97CC5207CCE204A0229687CCE200129482801AD0C";
    attribute INIT_37 of inst : label is "0CA57CCE2001290DA57CCE2007290D262A2A2A0A8D850C85FF492C08AD2C0B8D";
    attribute INIT_38 of inst : label is "A5018510A97C7120C894A296A96EA47C34207CCE2003290CA57CCE2003294A4A";
    attribute INIT_39 of inst : label is "24052D2004AD76E67CD520F4A9CBA207F0D4A57C90207AE52083A28EA90A30F9";
    attribute INIT_3A of inst : label is "A918F0CDA51CF021A5CB86CACC8615A22185CD850B3021240F1024062D24072D";
    attribute INIT_3B of inst : label is "79DA207A1F20AA7FA9788504691878A57AFF207A182057A9F2A27AE52072A294";
    attribute INIT_3C of inst : label is "008D2C008D4A2C018DA4A902F08605870588057FA420FAD0882BFF9900A908A0";
    attribute INIT_3D of inst : label is "A23C048EF910CA6A20033E04A27FC420F910CA6A24003E07A27FA7207E3E4C30";
    attribute INIT_3E of inst : label is "D0D4D504A200A0D5952C0AADAA032976A560C81696008699001659AAFD10CA64";
    attribute INIT_3F of inst : label is "7CE07CE0785104040404060628241E1C303860D4856A2C08AD04C0F8D0CAC801";
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
