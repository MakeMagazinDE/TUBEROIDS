@echo off
set rom_path_src=rev2\
set rom_path=

 romgen %rom_path_src%036430.02 ASTEROIDS_PROG_ROM_0 11 l r > %rom_path%ASTEROIDS_PROG_ROM_0.vhd
 romgen %rom_path_src%036431.02 ASTEROIDS_PROG_ROM_1 11 l r > %rom_path%ASTEROIDS_PROG_ROM_1.vhd
 romgen %rom_path_src%036432.02 ASTEROIDS_PROG_ROM_2 11 l r > %rom_path%ASTEROIDS_PROG_ROM_2.vhd
 romgen %rom_path_src%036433.03 ASTEROIDS_PROG_ROM_3 11 l r > %rom_path%ASTEROIDS_PROG_ROM_3.vhd

 romgen %rom_path_src%036800.02 ASTEROIDS_VEC_ROM_1  11 l r > %rom_path%ASTEROIDS_VEC_ROM_1.vhd
 romgen %rom_path_src%036799.01 ASTEROIDS_VEC_ROM_2  11 l r > %rom_path%ASTEROIDS_VEC_ROM_2.vhd

 hex2bin ScopeClockBuild.a51.hex
 romgen ScopeClockBuild.a51.bin ROM4051 12 l r >ROM4051.vhd

echo done

pause