echo 4051-ROM in VHDL für Erstsynthese erstellen
echo ggf. vorher ccpath.bat ausfuehren!
echo Nach Synthese makeROMs aufrufen, spielt neue Firmware ein
rem Achtung: romgen mit BlockRAM 16, sonst stimmen Placings nicht!
tools\gcc -O -lm -o scDataGen scDataGen.c
if not errorlevel 0 goto :eof
scDataGen >ScopeClockData.a51
copy /b ScopeClock.a51+ScopeClockData.a51 ScopeClockBuild.a51
tools\as31 -l ScopeClockBuild.a51
