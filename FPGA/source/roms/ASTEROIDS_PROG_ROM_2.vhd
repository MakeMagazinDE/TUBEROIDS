-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity ASTEROIDS_PROG_ROM_2 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of ASTEROIDS_PROG_ROM_2 is

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
    attribute INIT_00 of inst : label is "A97716204FA00530CEA64385FFA902901EC902690A9042C50E3043A5E110CACA";
    attribute INIT_01 of inst : label is "E6049003E93898118500A9CE8426B0CEC410844294AA4A8A0C86604185228500";
    attribute INIT_02 of inst : label is "B51DF010E41BA2CB8514A9CC85116511061165110611850469FF4911A5F7D011";
    attribute INIT_03 of inst : label is "44950BA9DFD0CACACA259522B5249521B5239520B5469543B5459542B5449541";
    attribute INIT_04 of inst : label is "10986FFF4C00239962B500249963B500259964B50CA67785F0A94695459500A9";
    attribute INIT_05 of inst : label is "C5980D8560016918FF49804970BC2070B6200E108AA870B64C70AA2070B62009";
    attribute INIT_06 of inst : label is "0F0C0A070502006070D9BDAA70EB2070B64C40E93870D120980D850DA40E900D";
    attribute INIT_07 of inst : label is "6918601F290CA5F410880A0C260DE502900DC504A0D5201F1D1C1A1917151311";
    attribute INIT_08 of inst : label is "C64BA220768504A9604B61BDAA00697F49049041C970B64C710B207F29081040";
    attribute INIT_09 of inst : label is "70A9018500A90A8575A90985BEA97CD520C1A9038502A9048547A9C9A2F9D076";
    attribute INIT_0A of inst : label is "10A203292803AD2ED009860A8575A9BEA27CD520C9A2C5A979D64C717F2020A2";
    attribute INIT_0B of inst : label is "2071D5BE71D4B9A80A980AE6029009850971098571F0BD0A8571F1BDAA0A0186";
    attribute INIT_0C of inst : label is "B6200A2A0CA52A0C262A09A171B0204A4A0C8509A100A200A07AEA2070A97A1F";
    attribute INIT_0D of inst : label is "0AC9EED0686804D03E290AE602D009E67A554C88DF900C4671B0200C8509A171";
    attribute INIT_0E of inst : label is "920C9A0CA20CAA0CB672B6686000A2C8039156F7BDC8039156F6BDAA0D690290";
    attribute INIT_0F of inst : label is "78705844321C160E7438737D72AE71F8D26EC66432684258425A4256A76EC668";
    attribute INIT_10 of inst : label is "429266B85A48EC3C6EB0F2EC00086CEA0AA4C04DEC3C6E605663B0A6A0948A7E";
    attribute INIT_11 of inst : label is "C2BD92A5C0854AC39A6C82CD660F6CC2640AD22D12A4F14D4C90120E12C3829A";
    attribute INIT_12 of inst : label is "6CC27082824CD80E104C1ABBC2BD92A5804D304E60C04E82D20D260E122EF0B4";
    attribute INIT_13 of inst : label is "7043923D0209649B4E186DD26648625900B60ABEC2BD92A5003E92B5E6096E0B";
    attribute INIT_14 of inst : label is "562040B87043923D00C01A4AEC0946B8649B4E207143923DC208649B4E1800B8";
    attribute INIT_15 of inst : label is "C22E3BD264BBB5A99D918B7D674F371D170D032EC2CDE43440CC62935A0C522C";
    attribute INIT_16 of inst : label is "9058F2824D50B8926C52C06E0B6E934C5A6C0A2C6B40B0124C1ABD6F934C5A6C";
    attribute INIT_17 of inst : label is "096CF600905A0A64824AC39A6C42B2580B52BB824C4C5A42C27033804CF04D4C";
    attribute INIT_18 of inst : label is "9B42320ABED8C94C9064DA0090D23B52B6504870C1A60D202BB64C4CC12E3BB2";
    attribute INIT_19 of inst : label is "181392124C1ABD657A4ECA2C0A92A2D2941EB60ABE657A4ECA2C0A104C1ABBC2";
    attribute INIT_1A of inst : label is "BDC20864F264CA6220008052A36E1842F264CA6218408252A36E2042F264CA62";
    attribute INIT_1B of inst : label is "1B170D0048606AE80D5ADA7CB0525682B2F2965A42605A40487043927D004C1A";
    attribute INIT_1C of inst : label is "42B2E6B942B2F0D4834DF27440B2E6B982CD12845A8AB1AB9F93877D71594333";
    attribute INIT_1D of inst : label is "6F824AC39A6CC29D74F092C5640AA8BEC0B57282604B621046B8120A640EF04D";
    attribute INIT_1E of inst : label is "028252636EF0D2BDF2A46F824AC39A6CC29D74B0F2A442C20A9E6CF0D2BDF2A4";
    attribute INIT_1F of inst : label is "0A0D120A645300B60ABE82CD6EB052CF282D133E92B5E60992C5708202924AAE";
    attribute INIT_20 of inst : label is "4E6A682000B072CAA60B46484E6A6818C0B572CAA60B48484E6A681800481AB6";
    attribute INIT_21 of inst : label is "736B61473319130D40CC62935A0C784E5C2040B87043923D80CD529E5C18C24D";
    attribute INIT_22 of inst : label is "0C92C5640A0ABE52485CC164A642BE40B0262A567600B8909D4EB2A59F93897D";
    attribute INIT_23 of inst : label is "9DC04D60694E935AB8F20D92C5640AECD48A0AECA4C04DEC74520C7C6A50B826";
    attribute INIT_24 of inst : label is "6AD80D4A6C2C9D8BC5120C0A0C6C91663B4E82D20D8A2D684870C1A60D4A6C2C";
    attribute INIT_25 of inst : label is "B8E64AB20B4828D8695418272A648B6CC2C25C5276B12DF00D6CB960A6004060";
    attribute INIT_26 of inst : label is "CA5C20C39D7043923D009856CA5C18C22DD8695420E74AB20B4628D869541800";
    attribute INIT_27 of inst : label is "00A92A901AF01AC00200B9A8186922D019C007F08A29107324676C648BC22D56";
    attribute INIT_28 of inst : label is "A000A2069002EFEC80A2601802EF8D738500A904B002EF6D8A6868E1A2020099";
    attribute INIT_29 of inst : label is "C90221B918F01A30108586290A7284D4F072C4716638F8A2603875072060181A";
    attribute INIT_2A of inst : label is "A82169189821A275672000A20242996A62206A80C90242B90221996A62206A80";
    attribute INIT_2B of inst : label is "9A4C0221F93800A9139075B1201830023ABD13300221B911869ED0B0A2756720";
    attribute INIT_2C of inst : label is "C9061068EA202A4A0221796A80C9071010240221B9ED9075B1200510023ABD75";
    attribute INIT_2D of inst : label is "C41F60027CFD0263B902BEDD02A5B960023A9D11A606A902B006C9FAA90890FB";
    attribute INIT_2E of inst : label is "0000211600000000080F00000000000008010000000000000038640B9A2D7009";
    attribute INIT_2F of inst : label is "0000212800000000524B000000000000000000000000443D00000000362F0000";
    attribute INIT_30 of inst : label is "000000000000DED3B69000000000A5907A857A6F0000000000000000645D0000";
    attribute INIT_31 of inst : label is "017F00000503D00401000005FFA8040100000503E0040100CCC1000000000000";
    attribute INIT_32 of inst : label is "1001000018010C02010000200110017F00000100A2207F000010FF1401100104";
    attribute INIT_33 of inst : label is "100100A8100F0000020006F001000004FFA4100100004001040101000003FFA4";
    attribute INIT_34 of inst : label is "02FF0C0403010A020C00000100A0100100A810070000700150020100000100A0";
    attribute INIT_35 of inst : label is "00180C0100210C10000002000B0202010A0218000005FFA5180501A018010000";
    attribute INIT_36 of inst : label is "1804000004FF85300401848001000801213001000030023004FF102002010001";
    attribute INIT_37 of inst : label is "0F01F0010100000100A4C00200000100300C0100490C1000000401A11804FFA5";
    attribute INIT_38 of inst : label is "07A2488AB8F2F022A51801B03809901877412C00000100A21F0100000FFFFF01";
    attribute INIT_39 of inst : label is "68E110CA889B9568BB9580A99B9500A94800A9025010F075C8B915D09BB50490";
    attribute INIT_3A of inst : label is "C8C8C8776B4C762A7918A3B509F0B3D634D0ABD64130BBB53AF09BB407A260AA";
    attribute INIT_3B of inst : label is "A80ED0C89BB4E7D0BBD6C3B410D0AB957628B9A3957629B9B395762BB99B94C8";
    attribute INIT_3C of inst : label is "CAC3E5E1C0E001C8D0C394C8BB95EDF07628B960B810CA2C009DA3B5A3949B94";
    attribute INIT_3D of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F03050404027FC394C3AFC3";
    attribute INIT_3E of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_3F of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
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
