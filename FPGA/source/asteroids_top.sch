VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        BEGIN SIGNAL ClkIn
            BEGIN ATTR LOC "A10"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
        END SIGNAL
        PORT Input ClkIn
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH ClkIn
            WIRE 816 1712 848 1712
            WIRE 848 1712 912 1712
            BEGIN DISPLAY 848 1712 ATTR LOC
                ALIGNMENT SOFT-BCENTER
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END BRANCH
        IOMARKER 816 1712 ClkIn R180 28
    END SHEET
END SCHEMATIC
