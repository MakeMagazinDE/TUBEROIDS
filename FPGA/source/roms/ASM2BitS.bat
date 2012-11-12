echo ASM to Bitstream Batch by CM 4/2008
echo Assembliert alle ScopeClock-Sourcen platziert ROM-File direkt im Bitstream
echo ScopeClock.bmm muss in den ISE-Sourcen aufgenommen sein!

copy /b ScopeClock.a51+ScopeClockData.a51 ScopeClockBuild.a51
tools\as31 -l ScopeClockBuild.a51
if not errorlevel 0 goto :eof
tools\hex2bin ScopeClockBuild.a51.hex
tools\srec_cat ScopeClockBuild.a51.BIN -bin -o ScopeClock_rom.mem -vmem 8
rem ROMs in Bitstream, _bd.bmm vom floorplanner:
data2mem -bm ScopeClock_bd.bmm -bt ../main/asteroidsclock.bit  -bd ScopeClock_rom.mem -o b finalbitstream.bit
pause