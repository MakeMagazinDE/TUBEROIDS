;Most recent symbols for non addressable bits for the AT89LPx052 processor
$NOLIST
;Not complete
;PCON = 087H Power control register
SMOD1           EQU   080H         ; Double baud rate bit
SMOD0           EQU   040H         ; Frame error select
PWDEX           EQU   020H         ; Power down exit mode
POF             EQU   010H         ; Power off flag
GF1             EQU   008H         ; General purpose flag
GF0             EQU   004H         ; dto.
PD              EQU   002H         ; Power down bit
IDL             EQU   001H         ; Idle mode bit
;
;TMOD = 089H Timer/Counter mode control register
T1Gate          EQU   080H         ; Timer 1 Gating control
T1CT            EQU   040H         ; Timer 1 Timer or counter selector
T1M1            EQU   020H         ; Timer 1 Mode bit 1
T1M2            EQU   010H         ; Timer 1 Mode bit 0
T0Gate          EQU   008H         ; Timer 0 Gating control
T0CT            EQU   004H         ; Timer 0 Timer or counter selector
T0M1            EQU   002H         ; Timer 0 Mode bit 1 
T0M2            EQU   001H         ; Timer 0 Mode bit 0
TMode0          EQU   000H         ; Timer 0/1 Mode 0 Variable 9-16 bit timer/counter
TMode1          EQU   001H         ; Timer 0/1 Mode 1 16 bit auto reload timer/counter
TMode2          EQU   002H         ; Timer 0/1 Mode 2 8 bit auto reload timer/counter
T0Mode3         EQU   003H         ; Timer 0 Mode 3 Split timer/counter
T1Mode3         EQU   003H         ; Timer 1 Mode 3 Timer/Counter stopped
