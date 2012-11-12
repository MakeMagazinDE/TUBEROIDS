-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity ASTEROIDS_VEC_ROM_1 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of ASTEROIDS_VEC_ROM_1 is

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
    attribute INIT_00 of inst : label is "EB20480200B902E7EE6D502048B22005A91A86311002F8BDAA4A4A3C290200B9";
    attribute INIT_01 of inst : label is "B04AEE10AA0F294A6802F89D7FA9481D1002F8BD1AA602009900A902009D6861";
    attribute INIT_02 of inst : label is "E7EE61EB206D502048B2201A8610A9600EA649AC2048B22020A902F89D00A910";
    attribute INIT_03 of inst : label is "48A72002F19D206979A502F89D7EA91AA6108602009D42090A0A1AA502FFEE02";
    attribute INIT_04 of inst : label is "E979A502F89D7EA91AA602009D42090A0A1AA502E7EE61EB206D522010A61A86";
    attribute INIT_05 of inst : label is "10866C444C18F79004E004F00EA660F810CA03F002F8BD06A2600EA602F19D20";
    attribute INIT_06 of inst : label is "9D02E9389807D00F2976A51C9004C002F8BCAA0F294A4A0200BD19E6118419A0";
    attribute INIT_07 of inst : label is "8549FD204A222010A61A8611A411E602F89D02090129980A1002F00219AD02F8";
    attribute INIT_08 of inst : label is "11C419A012851AA64A322049FD204A2220AA21698AA821691811A512850CA513";
    attribute INIT_09 of inst : label is "F1FD3812A5319040C9FF49021002F1FD12A50DB010C9FF49021079E5804919D0";
    attribute INIT_0A of inst : label is "1AA649A4BD00A2029007E019A60DD011C419A001A9219008C9FF490210128502";
    attribute INIT_0B of inst : label is "8569586D6957AD03906957CD0AD365184A02F0AD02F19D02F17DFF4902901206";
    attribute INIT_0C of inst : label is "10A649BB2071012002F1BD1AA611856802219D10A649BB2070FE2002F1BD4811";
    attribute INIT_0D of inst : label is "FF490510A860A8687716203FA0489809D002FFCE11040403030302016002429D";
    attribute INIT_0E of inst : label is "8512651813A5600069FF49041000C013A512D00DB01106138500A91285016918";
    attribute INIT_0F of inst : label is "9004C96015E500A90C850CE53800A915850DB0F0C9119010C9E8F0E4D0124613";
    attribute INIT_10 of inst : label is "A5D23015456A4A4A01B021E08A1585D69003C019A4DC9005C0D3A4F7B0FCC9FB";
    attribute INIT_11 of inst : label is "20031013A5158570B62003101485600263FD0263B90C8502A5FD3802A5B96015";
    attribute INIT_12 of inst : label is "4C0CA412A6F510CA0C6614461266134612B004E0FAD0CA03300A07A2150570B6";
    attribute INIT_13 of inst : label is "A94A02F8BDAA0F294A4A4AEAB014A413A6F39007E0E814260C0613261206709E";
    attribute INIT_14 of inst : label is "F0AD7CD54C502AB9502BBEA811053E291E29025011244A4A02F1BD11856A6A00";
    attribute INIT_15 of inst : label is "BD02E7ACFAD002FFAE6001B002E7CD118605A9E8039005C9026902A21813F002";
    attribute INIT_16 of inst : label is "E72010A6D1941AA0DE9011C404F0D1B51EA6F19019E0E8880110108602D00200";
    attribute INIT_17 of inst : label is "994B4AB902F8994B47B902FFEE02E7EE02009D42090A0A98DD8402A04B4D2069";
    attribute INIT_18 of inst : label is "B902C69D02C67D184B41B902639D02637D4B3EB902A59D02A57D184B3BB902F1";
    attribute INIT_19 of inst : label is "FF00705800AD1011A461EB2010A411846D522010868B308802849D02847D4B44";
    attribute INIT_1A of inst : label is "02429D98FAA002102C0AAD06A002219D4B53204098F08185830000FF00504000";
    attribute INIT_1B of inst : label is "5553514E4C494744413F3C393633312E2B2825221F1C191613100C0906030060";
    attribute INIT_1C of inst : label is "7F7F7E7E7E7D7D7C7B7A7A79787675747371706F6D6B6A68666462605E5C5A58";
    attribute INIT_1D of inst : label is "855003B910855002B96EC6200A867518F02986958675FE6918AA032976A57F7F";
    attribute INIT_1E of inst : label is "D64C6221200CA20485C0492A779EBD03850A779DBD0985094504290AAA0A8A11";
    attribute INIT_1F of inst : label is "D08C8502A906D003298DA51385601860EB2074C64CF64C03D074A50EF022A579";
    attribute INIT_20 of inst : label is "E8118600A27159200BA01085FEB040C98CA57159204C10432542A5A807691856";
    attribute INIT_21 of inst : label is "3811A901A000A2D8EB901285126512A508F0118512651811A507901046F81286";
    attribute INIT_22 of inst : label is "AD8A8602D08CA606A07CD520CBA220A907904A8FA50CD003C903298DA57C9520";
    attribute INIT_23 of inst : label is "60DB2009D00CC08A85FFA908D00CA0136606D0049001E00C308A2410904A2801";
    attribute INIT_24 of inst : label is "048D44102404AD499002C020302403AD01A28CA460DB20F7F08A60858500A918";
    attribute INIT_25 of inst : label is "D02085863C048E8CC622868CC602A270856EA56A1B206959207BE32060D0203C";
    attribute INIT_26 of inst : label is "008D848504A96F856EA599859A8520851F851E850A748580A96A1B207BE32060";
    attribute INIT_27 of inst : label is "C902EDAD0AD03F2976A560188585854503A902F08CC501A90CD00F2976A5603E";
    attribute INIT_28 of inst : label is "A571592007A00ED002200D021F0D021E0D021DAD1CD06FB51EA602EDCE03F008";
    attribute INIT_29 of inst : label is "F070056FA522A663002010A930D080C902EBAD37D00219AD60EB20039002C922";
    attribute INIT_2A of inst : label is "1F850A8A3C048D6A6A8A1E8610F06FB5AA01491EA5748580A91DF0CA67EB2025";
    attribute INIT_2B of inst : label is "FFFFFFFFFFFFFFFF020510EFD03C048D858503A92285FFA92186601820851E05";
    attribute INIT_2C of inst : label is "F878F908F878F50AF878F10BF878FD09F878FD0DF878F80DC6C4C6DBC6FAC715";
    attribute INIT_2D of inst : label is "07803780F87807803000D000FE0AF878F10FF87806005480F878F30DF878F309";
    attribute INIT_2E of inst : label is "F87800E042A0F87800003380F878038035C0F87802A040E0F87803803780F878";
    attribute INIT_2F of inst : label is "F878FF03F878FF07F878F807D000F87806A040E0F878078044E0F87804E042A0";
    attribute INIT_30 of inst : label is "070044C0F87804C04240F87800C04240F878FB00F87803003580F878024040C0";
    attribute INIT_31 of inst : label is "03C03140F87802803680F87806803680F87806803000D000F878064040C0F878";
    attribute INIT_32 of inst : label is "F878068044A0F878054033C0F878014033C0F87800003280F87802803540F878";
    attribute INIT_33 of inst : label is "F6CDF8CDF2CDF2DFF2DBF8CAF6DBD6806000F60BF8CAF10ED000F87807C03140";
    attribute INIT_34 of inst : label is "3080F27FF979F579F17BF77BF778F87EF679F07FF27FF178F17BF009D000F6DF";
    attribute INIT_35 of inst : label is "46607080470077E044C072C03780770044A0774041607480320072C041800200";
    attribute INIT_36 of inst : label is "40C07600238072804220038021807760416071A042607240358072C041A073A0";
    attribute INIT_37 of inst : label is "4280728035007280422073E045A0712046C077A045A0734036C076C045407780";
    attribute INIT_38 of inst : label is "464073C03640768045A077A040007600238071E042800380220077A040C07120";
    attribute INIT_39 of inst : label is "716042C0F30377804000708042C072C03480720042607210546071A046807740";
    attribute INIT_3A of inst : label is "3000718042E0722050007220462076E046E0722044A076204620778044C0F377";
    attribute INIT_3B of inst : label is "444075A04680774045607780220070E0430002002380778044A0700042C072C0";
    attribute INIT_3C of inst : label is "238077604560748042C072C030C070C0430072205070728045C0764047407220";
    attribute INIT_3D of inst : label is "73E041A072C04520758047C072404040752046E0F67F760030C0704043400180";
    attribute INIT_3E of inst : label is "46E076A046A0778021007480432000803200F67F7520428072C0314070404320";
    attribute INIT_3F of inst : label is "468075A0426072803180746043207380426072E044A074C047E07240408074A0";
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
