VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        BEGIN SIGNAL GndLow
        END SIGNAL
        BEGIN SIGNAL ZVID(2)
        END SIGNAL
        BEGIN SIGNAL ZVID(1)
        END SIGNAL
        SIGNAL DAC(7:0)
        SIGNAL P3_O(5)
        SIGNAL DAC_A0
        SIGNAL P3_O(7:0)
        SIGNAL XLXN_58(7:0)
        SIGNAL XLXN_62
        SIGNAL P3_O(7)
        SIGNAL ClkIn
        SIGNAL XLXN_69
        SIGNAL Sync50
        SIGNAL P3_O(6)
        SIGNAL P3_O(4)
        SIGNAL DAC_WR
        SIGNAL DAC_A1
        SIGNAL ZVID(3:0)
        PORT Output DAC(7:0)
        PORT Output DAC_A0
        PORT Input ClkIn
        PORT Output DAC_WR
        PORT Output DAC_A1
        PORT Output ZVID(3:0)
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF cb2re
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 384 -192 320 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -128 64 -128 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 0 -192 64 -192 
            LINE N 384 -128 320 -128 
            LINE N 384 -320 320 -320 
            LINE N 384 -256 320 -256 
            RECTANGLE N 64 -384 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF T4051
            TIMESTAMP 2008 4 30 5 55 56
            LINE N 64 -800 0 -800 
            LINE N 64 -736 0 -736 
            LINE N 64 -672 0 -672 
            LINE N 64 -608 0 -608 
            LINE N 64 -544 0 -544 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            RECTANGLE N 0 -220 64 -196 
            LINE N 64 -208 0 -208 
            RECTANGLE N 480 -220 544 -196 
            LINE N 480 -208 544 -208 
            RECTANGLE N 480 -140 544 -116 
            LINE N 480 -128 544 -128 
            RECTANGLE N 0 -140 64 -116 
            LINE N 64 -128 0 -128 
            RECTANGLE N 64 -832 480 -64 
            LINE N 480 -800 544 -800 
            LINE N 480 -736 544 -736 
            LINE N 480 -672 544 -672 
            LINE N 64 -288 0 -288 
        END BLOCKDEF
        BEGIN BLOCKDEF Teiler50
            TIMESTAMP 2008 4 30 10 46 48
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_17 buf
            PIN I P3_O(7)
            PIN O ZVID(2)
        END BLOCK
        BEGIN BLOCK XLXI_18 buf
            PIN I P3_O(7)
            PIN O ZVID(1)
        END BLOCK
        BEGIN BLOCK XLXI_1 gnd
            PIN G GndLow
        END BLOCK
        BEGIN BLOCK XLXI_27(7:0) vcc
            PIN P XLXN_58(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_28 vcc
            PIN P XLXN_62
        END BLOCK
        BEGIN BLOCK XLXI_3 buf
            PIN I P3_O(5)
            PIN O DAC_A0
        END BLOCK
        BEGIN BLOCK XLXI_34 cb2re
            PIN C ClkIn
            PIN CE XLXN_62
            PIN R GndLow
            PIN CEO
            PIN Q0 XLXN_69
            PIN Q1
            PIN TC
        END BLOCK
        BEGIN BLOCK MPU4051 T4051
            PIN Clk XLXN_69
            PIN Rst_n XLXN_62
            PIN INT0 Sync50
            PIN INT1
            PIN T0 XLXN_69
            PIN T1
            PIN T2
            PIN T2EX
            PIN P1_in(7:0) XLXN_58(7:0)
            PIN P3_in(7:0) XLXN_58(7:0)
            PIN P1_out(7:0) DAC(7:0)
            PIN P3_out(7:0) P3_O(7:0)
            PIN RXD_IsO
            PIN RXD_O
            PIN TXD
            PIN RXD
        END BLOCK
        BEGIN BLOCK XLXI_36 Teiler50
            PIN Clk ClkIn
            PIN Reset GndLow
            PIN Q Sync50
        END BLOCK
        BEGIN BLOCK XLXI_37 buf
            PIN I P3_O(6)
            PIN O DAC_A1
        END BLOCK
        BEGIN BLOCK XLXI_2 buf
            PIN I P3_O(4)
            PIN O DAC_WR
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3801 5382
        ATTR LengthUnitName "CM"
        ATTR GridsPerUnit "4"
        BEGIN BRANCH ZVID(2)
            WIRE 2672 1200 2752 1200
            BEGIN DISPLAY 2752 1200 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_17 2448 1232 R0
        INSTANCE XLXI_18 2448 1168 R0
        BEGIN BRANCH ZVID(1)
            WIRE 2672 1136 2752 1136
            BEGIN DISPLAY 2752 1136 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_27(7:0) 1152 576 R0
        INSTANCE XLXI_28 1424 576 R0
        IOMARKER 2752 1776 DAC_A1 R0 28
        BEGIN BRANCH P3_O(5)
            WIRE 2352 1712 2448 1712
            BEGIN DISPLAY 2352 1712 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_3 2448 1744 R0
        BEGIN BRANCH DAC_A0
            WIRE 2672 1712 2752 1712
        END BRANCH
        IOMARKER 2752 1712 DAC_A0 R0 28
        BEGIN BRANCH P3_O(7:0)
            WIRE 2128 1408 2304 1408
            BEGIN DISPLAY 2304 1408 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_58(7:0)
            WIRE 1216 576 1216 1328
            WIRE 1216 1328 1216 1408
            WIRE 1216 1408 1584 1408
            WIRE 1216 1328 1584 1328
        END BRANCH
        BEGIN BRANCH XLXN_62
            WIRE 448 608 448 1200
            WIRE 448 1200 528 1200
            WIRE 448 608 1488 608
            WIRE 1488 608 1488 800
            WIRE 1488 800 1584 800
            WIRE 1488 576 1488 608
        END BRANCH
        BEGIN BRANCH P3_O(7)
            WIRE 2304 1136 2432 1136
            WIRE 2432 1136 2448 1136
            WIRE 2432 1136 2432 1200
            WIRE 2432 1200 2448 1200
            BEGIN DISPLAY 2304 1136 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 2752 1328 DAC(7:0) R0 28
        BEGIN BRANCH DAC(7:0)
            WIRE 2128 1328 2752 1328
        END BRANCH
        IOMARKER 256 1264 ClkIn R180 28
        BEGIN BRANCH ClkIn
            WIRE 256 1264 432 1264
            WIRE 432 1264 528 1264
            WIRE 432 1264 432 1520
            WIRE 432 1520 544 1520
        END BRANCH
        INSTANCE XLXI_34 528 1392 R0
        BEGIN BRANCH XLXN_69
            WIRE 912 1072 1104 1072
            WIRE 1104 736 1584 736
            WIRE 1104 736 1104 992
            WIRE 1104 992 1104 1072
            WIRE 1104 992 1584 992
        END BRANCH
        BEGIN INSTANCE MPU4051 1584 1536 R0
            BEGIN DISPLAY 192 -936 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Sync50
            WIRE 928 1520 1360 1520
            WIRE 1360 864 1360 1520
            WIRE 1360 864 1584 864
            BEGIN DISPLAY 1360 864 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_36 544 1616 R0
        END INSTANCE
        BEGIN BRANCH GndLow
            WIRE 320 1360 528 1360
            WIRE 320 1360 320 1920
            WIRE 320 1920 432 1920
            WIRE 432 1920 432 1968
            WIRE 432 1584 544 1584
            WIRE 432 1584 432 1920
        END BRANCH
        INSTANCE XLXI_37 2448 1808 R0
        BEGIN BRANCH P3_O(6)
            WIRE 2352 1776 2448 1776
            BEGIN DISPLAY 2352 1776 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH P3_O(4)
            WIRE 2352 1648 2448 1648
            BEGIN DISPLAY 2352 1648 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_2 2448 1680 R0
        BEGIN BRANCH DAC_WR
            WIRE 2672 1648 2752 1648
        END BRANCH
        IOMARKER 2752 1648 DAC_WR R0 28
        BEGIN BRANCH DAC_A1
            WIRE 2672 1776 2752 1776
        END BRANCH
        INSTANCE XLXI_1 368 2096 R0
        BEGIN BRANCH ZVID(3:0)
            WIRE 2576 976 2736 976
        END BRANCH
        IOMARKER 2736 976 ZVID(3:0) R0 28
    END SHEET
END SCHEMATIC
