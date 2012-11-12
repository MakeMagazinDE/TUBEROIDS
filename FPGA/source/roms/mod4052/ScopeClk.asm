;               *****************************************************************************
;               *** 8031-Software für ScopeClock-Hardware
;               ***
;               *** (c) 2004 by Sascha Ittner (GPL)
;               ***
;               *** 24.10.2004: V1.0
;               ***             Erste veröffentliche Version
;               *****************************************************************************
;               *** Modifizierte Version für AT89LP4052 16MHz
;               *** 8051 MetaLink Cross Assembler Version
;               *** 13.06.2006: V1.0.4052.0
;               *** Copyright (C) 2006 by Erhard Schemainda
;               *****************************************************************************

;                ---------------------------------------------------------------------------
;               |  This program is free software; you can redistribute it and/or modify     |
;               |  it under the terms of the GNU General Public License as published by     |
;               |  the Free Software Foundation; either version 2 of the License, or        |
;               |  at your option) any later version.                                       |
;               |                                                                           |                       
;               |  This program is distributed in the hope that it will be useful,          |
;               |  but WITHOUT ANY WARRANTY; without even the implied warranty of           |
;               |  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the             |
;               |  GNU General Public License for more details.                             |
;               |                                                                           |                   
;               |  You should have received a copy of the GNU General Public License        |
;               |  along with this program; if not, write to the Free Software              |
;               |  Foundation, inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA  |
;                ---------------------------------------------------------------------------

;               *****************************************************************************
;               ***   References:
;               *****************************************************************************
;               ***   (1) MetaLink Corporation, Chandler, Arizona
;               ***   (2) ATMEL AT89LP2052/4052 8 bit Microcontroler with 2K/4K bytes Flash
;               ***   (3) ATMEL Migrating from AT89C2051/C4051 to AT89LP2052/4052 Application
;               ***       Note 3573A-MCU-7/05
;               ***   (4) ATMEL AT89ISP Programmer Cable - Application Note 3310D-MICRO-6/05
;               ***   (5) ATMEL Microcontroller ISP Software, User's Manual
;               ***   (6) GMS AT89LP2052 / AT89LP4052 Parallel Port SPI Programmer V1
;               *****************************************************************************

;               *****************************************************************************
;               ***   Changes:
;               *****************************************************************************
;               ***
;               *** 22.05.2005 Strahl aus vor Delay-Loop                
;               ***            Delay nach Zeichnen Bresemham-Vector eingeführt           
;               ***                                                     
;               *** 26.05.2005 GPL-Banner eingefügt
;               ***
;               *** 02.06.2006 Quellcode auf MetaLink ASM51 Syntax umgestellt
;               *** 02.06.2006 Anpassung an AT89LP4052 Prozessor:        
;               ***            Port P1 und P3 auf 8051 Modus eingestellt                                                
;               ***            Beam Delay Zeiten angepaßt                                         
;               ***            Timer0 aufgrund höherer Zählfrequenz (1 count/cycle) geändert                            
;               ***                                                     
;               ***                                                     
;               ***                                                     
;               *****************************************************************************

;               *****************************************************************************
;               ***    Primary controls
;               *****************************************************************************

$MOD52LP
$INCLUDE(SYM52LP.inc)
$LIST
$TITLE(ScopeClock by Sascha Ittner, modified Version AT89LP4052 16MHz)
$PAGEWIDTH(132)
$NODEBUG
$OBJECT
$NOPAGING
;               *****************************************************************************
;               ***   Variables declaration
;               *****************************************************************************

TICKS_HZ        EQU   50

DCF_SYNCTIME    EQU   60
DCF_HITIME      EQU   8
DCF_MINTIME     EQU   3
DCF_MAXTIME     EQU   14
                
KEY_DELAY       EQU   50
KEY_REPEAT      EQU   12

BEAM_OFF_DLY_1  EQU   200          ; = 75µsec (15us = 40)                             geä. LP
BEAM_ON_DLY_1   EQU   200          ;                                                  geä. LP
DRAW_DLY        EQU   18           ; = 4.5µsec (1.5us = 4)                            geä. LP  

INIT_STACK      EQU   048h

DISP_TAB_LEN    EQU   11
DISP_TAB        EQU   030h
DISP_TAB_SECPL  EQU   030h
DISP_TAB_SECPH  EQU   031h
DISP_TAB_MINPL  EQU   032h
DISP_TAB_MINPH  EQU   033h
DISP_TAB_HRPL   EQU   034h
DISP_TAB_HRPH   EQU   035h
DISP_TAB_SECNOL EQU   036h
DISP_TAB_SECNOH EQU   037h
DISP_TAB_SECNTL EQU   038h
DISP_TAB_SECNTH EQU   039h
DISP_TAB_MINNOL EQU   03Ah
DISP_TAB_MINNOH EQU   03Bh
DISP_TAB_MINNTL EQU   03Ch
DISP_TAB_MINNTH EQU   03Dh
DISP_TAB_HRNOL  EQU   03Eh
DISP_TAB_HRNOH  EQU   03Fh
DISP_TAB_HRNTL  EQU   040h
DISP_TAB_HRNTH  EQU   041h
DISP_TAB_DCFSL  EQU   042h
DISP_TAB_DCFSH  EQU   043h
DISP_TAB_SCALEL EQU   044h
DISP_TAB_SCALEH EQU   045h
TimerDly        EQU   046h         ;                                                   ins LP

DLINE_R0        EQU   000h
DLINE_R1        EQU   001h
DLINE_R2        EQU   002h
DLINE_R3        EQU   003h
DLINE_R4        EQU   004h
DLINE_R5        EQU   005h
DLINE_R6        EQU   006h
DLINE_R7        EQU   007h

TIME_R0         EQU   008h
TIME_R1         EQU   009h
TIME_R2         EQU   00Ah
TIME_R3         EQU   00Bh
TIME_R4         EQU   00Ch
TIME_R5         EQU   00Dh

DCF_R0          EQU   010h
DCF_R1          EQU   011h
DCF_R2          EQU   012h
DCF_R3          EQU   013h
DCF_R4          EQU   014h
DCF_R5          EQU   015h

DCF_MIN         EQU   018h
DCF_HR          EQU   019h
DCF_DAY         EQU   01Ah
DCF_DOW         EQU   01Bh
DCF_MON         EQU   01Ch
DCF_YR          EQU   01Dh

DLINE_FLAGS     EQU   020h         ; Bits 00-07
DLINE_F_XDIR    EQU   000h
DLINE_F_YDIR    EQU   001h
DLINE_F_SWXY    EQU   002h
DLINE_F_ENEG    EQU   003h

TIME_FLAGS      EQU   021h         ; Bits 08-0f
TIME_F_UPDD     EQU   008h
TIME_F_ADCH     EQU   009h
TIME_F_KEYREP   EQU   00Ah
TIME_F_SYNC     EQU   00Bh

DCF_FLAGS       EQU   022h         ; Bits 10-17
DCF_F_FE        EQU   010h
DCF_F_BIT       EQU   011h
DCF_F_PARITY    EQU   012h
DCF_F_TIMEOK    EQU   013h
DCF_F_STATDATA  EQU   014h
DCF_F_STATOK    EQU   015h

DCF_TFLAGS      EQU   023h         ; Bits 18-1f
DCF_TF_NULL     EQU   018h
DCF_TF_RES      EQU   019h
DCF_TF_ADD      EQU   01Ah
DCF_TF_CLRP     EQU   01Bh
DCF_TF_CHKP     EQU   01Ch
DCF_TF_SET      EQU   01Dh

;               *****************************************************************************
;               ***   Interrupt Vektor
;               *****************************************************************************

                ORG   0000h                    ; Hauptprogramm
                AJMP Main

                ORG   0003h                    ; Externer Interrupt 0
                ACALL E0IrqHandler
                RETI

                ORG   000Bh                    ; Timer 0 Interrupt
                ACALL T0IrqHandler
                RETI

                ORG   0013h                    ; Externer Interrupt 0
                RETI

                ORG   001Bh                    ; Timer 1 Interrupt
                RETI

                ORG   0023h                    ; Serieller Port Interrupt
                RETI

                ORG   0033h                    ; Comparator Interrupt
                RETI
                
;               *****************************************************************************
;               ***   Hauptprogramm
;               *****************************************************************************

;               -----------------------------------------------------------------------------
;               ---   Controler initialisieren
;               -----------------------------------------------------------------------------
Main:
                MOV   SP,#INIT_STACK           ; Stackpointer setzen
                MOV   PSW,#00000000b           ; Gegister-Bank 0
;               -----------------------------------------------------------------------------
;               ---   Port pin configuration like 8051 architecture                    ins LP
;               -----------------------------------------------------------------------------
                MOV   P1M0,#00h                ; set P1M0 for quasi bidirect. mode
                MOV   P1M1,#00h                ; set P1M1 for quasi bidirect. mode
                MOV   P3M0,#00h                ; set P3M0 for quasi bidirect. mode
                MOV   P3M1,#00h                ; set P3M1 for quasi bidirect. mode
;               -----------------------------------------------------------------------------
                MOV   P1,#128                  ; DAC initialisieren
                CLR   P3.5                     ; DAC A
                CLR   P3.4
                SETB  P3.4
                SETB  P3.5                     ; DAC B
                CLR   P3.4
                SETB  P3.4
                MOV   DPTR,#ScaleData          ; Zuerst Zifferblatt anzeigen
                MOV   R0,#DISP_TAB             ; Display-Tabelle initialisieren
                MOV   R1,#DISP_TAB_LEN
Main_InitLoop1:
                MOV   @R0,DPL
                INC   R0
                MOV   @R0,DPH
                INC   R0
                DJNZ  R1,Main_InitLoop1

                MOV   DLINE_FLAGS,#0           ; Status initialisieren
                MOV   R0,#0                    ; Zähler für Display-Tabelle initialisieren
                MOV   R1,#128                  ; X1 initialisieren
                MOV   R2,#128                  ; Y1 initialisieren
                MOV   R3,#128                  ; X2 initialisieren
                MOV   R4,#128                  ; Y2 initialisieren

                MOV   TIME_FLAGS,#0            ; Status initialisieren
                MOV   TIME_R0,#TICKS_HZ        ; TICK-Zähler für Sekunden initialisieren
                MOV   TIME_R1,#0               ; Sekunden initialisieren
                MOV   TIME_R2,#0               ; Minuten initialisieren
                MOV   TIME_R3,#0               ; Stunden initialisieren
                MOV   TIME_R4,#0               ; Tmp-Register initialisieren
                MOV   TIME_R5,#1               ; Tastenverzögerung initialisieren

                MOV   DCF_FLAGS,#0             ; DCF-Flags initialisieren
                MOV   DCF_TFLAGS,#0            ; DCF-Tabellen-Flags initialisieren
                MOV   DCF_R0,#0                ; Reset Tabellenadresse
                MOV   DCF_R1,#59               ; Bitzähler initialisieren
                MOV   DCF_R2,#0                ; Pulstimer initialisieren
                MOV   DCF_R3,#DCF_SYNCTIME     ; Zähler für Sync-Zeit initialisieren
                MOV   DCF_R4,#0                ; DCF-Statusanzeige initialisieren

                MOV   TMOD,#TMode1             ; Timer 0 Mode 1 (16 bit auto reload timer)
                SETB  IT0                      ; Falling edge/low level triggered ext. irq
                SETB  EA                       ; Enable global interrupt
                SETB  ET0                      ; Enable timer 0 interrupt
                SETB  EX0                      ; Enable external interrupt 0

;               -----------------------------------------------------------------------------
;               ---   Schleife für Bildschirmausgabe
;               -----------------------------------------------------------------------------
;               ---   Daten holen
;               -----------------------------------------------------------------------------
Main_Loop: 
                CLR   A                        ; nächstes X/Y-Paar holen
                MOVC  A,@A+DPTR
                INC   DPTR
                JZ    Main_DImed               ; 000h = Immediate Jump
                CJNE  A,#0FFh,Main_DNorm       ; 0FFh = Tabellenende

;               -----------------------------------------------------------------------------
;               ---   Neue Displayadresse holen
;               -----------------------------------------------------------------------------
Main_NewAddr:   
                MOV   A,#DISP_TAB              ; Tabellenadresse berechnen
                ADD   A,R0
                ADD   A,R0
                MOV   R1,A
                CLR   TIME_F_ADCH              ; Prüfen, ob Tabelle während Lesens geändert
                MOV   A,@R1                    ; Daten aus Tabelle holen
                MOV   DPL,A
                INC   R1
                MOV   A,@R1
                MOV   DPH,A
                JB    TIME_F_ADCH,Main_NewAddr

                INC   R0                       ; nächster Eintrag
                CJNE  R0,#DISP_TAB_LEN,Main_DImed
                MOV   R0,#0
                SETB  P3.7                     ; Strahl aus
                CLR   TIME_F_SYNC              ; Auf Sync warten
Main_Wait:      
                JNB   TIME_F_SYNC,Main_Wait
                AJMP  Main_DImed_Get
Main_DImed:    
                SETB  P3.7                     ; Strahl aus, dann delay
                MOV   R7,#BEAM_OFF_DLY_1       ; Verzögerung, um Schlieren zu bermeiden
Wait420:
                DJNZ  R7,Wait420               
Main_DImed_Get: 
                CLR   A                        ; erstes X/Y-Paar holen
                MOVC  A,@A+DPTR
                INC   DPTR
                MOV   R1,A
                CLR   A
                MOVC  A,@A+DPTR
                INC   DPTR
                MOV   R2,A
                AJMP  Main_Loop
Main_DNorm:     
                MOV   R3,A                     ; alles andere sind normale Daten
                CLR   A
                MOVC  A,@A+DPTR
                INC   DPTR
                MOV   R4,A
;               -----------------------------------------------------------------------------
;               ---   Linie Zeichnen
;               -----------------------------------------------------------------------------
                ACALL DrawLine
                AJMP  Main_Loop

;               *****************************************************************************
;               ***   Handler für Interrupt T0                                         ins LP
;               *****************************************************************************
;               ***   Bei einer Taktfrequenz von 16MHz beträgt ein Taktzyklus 62.5nsec. Um
;               ***   eine Torzeit für den Netz-Irq von 5 msec zu erreichen, muß der Timer 0
;               ***   für 15 msec den Netz-Irq sperren. 15msec / 62.5nsec = 240000 Takte. Das
;               ***   sind hexadezimal 3A980H. Da der Timer aber nur bis FFFFH zählt, muß er
;               ***   drei volle Durchläufe + den Rest von A980H durchlaufen. (10000H - A980H
;               ***   = 5680H Zählervorbesetzung)
;               *****************************************************************************
T0IrqHandler:                                                                         ;chg LP
                CLR   TCON.4                   ; Timer 0 stoppen
                CLR   TCON.1                   ; IE-Flag für Netz-IRQ löschen
                DJNZ  TimerDly,Irq1
                MOV   A,#0FFh
                XRL   A,TH0
                JNZ   Irq2
                MOV   TH0,#056h                ; Gate-Timer initialisieren
                MOV   TL0,#080h                ; für die Restzeit
                MOV   TimerDly,#001h
                SETB  TCON.4                   ; Timer 0 starten, noch einmal
                RET
Irq2:
                SETB  IE.0                     ; Netz-IRQ wieder zulassen
                RET
Irq1:
                SETB  TCON.4                   ; und weier
                RET

;               *****************************************************************************
;               *** Handler für Interrupt E0 (50 Hz Netzfrequenz)
;               ***
;               *** Benutzte Register
;               ***   R0 - Tick-Counter für Sekunden
;               ***   R1 - Sekunden
;               ***   R2 - Minuten
;               ***   R3 - Stunden
;               ***   R4 - Tmp-Register
;               ***   R5 - Wiederholungszähler für Tasten
;               *****************************************************************************
E0IrqHandler:  
                PUSH  PSW
                PUSH  ACC
                PUSH  B
                PUSH  DPL
                PUSH  DPH
                MOV   PSW,#00001000b           ; Register-Bank 1

                CLR   IE.0                     ; Netz-IRQ sperren
                MOV   TH0,#0FFh                ; Gate-Timer initialisieren             chg LP
                MOV   TL0,#0FFh                ; für 15 ms                             chg LP
;               -----------------------------------------------------------------------------
                MOV   TimerDly,#003h           ; 3 x 0FFH + 05680H                     ins LP
;               -----------------------------------------------------------------------------
                SETB  TCON.4                   ; und starten

                ACALL CheckKey                 ; Tasten abfragen

                DJNZ  R0,E0IrqH_DispAdr        ; Tick-Zähler aktualisieren
                MOV   R0,#TICKS_HZ

;               -----------------------------------------------------------------------------
;               ---   Zeiten aktualisieren
;               -----------------------------------------------------------------------------
                SETB  TIME_F_UPDD              ; Merker für Display-Update setzen
                INC   R1                       ; Sekunden aktualisieren
                CJNE  R1,#60,E0IrqH_DispAdr
                MOV   R1,#0

                ACALL DCF77_UpdStat            ; Einmal pro Minute DCF-Status zurücksetzen
                CLR   DCF_F_STATOK
                CLR   DCF_F_STATDATA

                INC   R2                       ; Minuten aktualisieren
                CJNE  R2,#60,E0IrqH_DispAdr
                MOV   R2,#0
                INC   R3                       ; Stunden aktualisieren
                CJNE  R3,#24,E0IrqH_DispAdr
                MOV   R3,#0
;               -----------------------------------------------------------------------------
;               ---   Display-Adressen aktualisieren
;               -----------------------------------------------------------------------------
E0IrqH_DispAdr: 
                ACALL DCF77                    ; DCF77-Zeit auswerten
                JNB   TIME_F_UPDD,E0IrqH_Out   ; Prüfen, ob Update erforderlich
                ACALL DispAdrPtr
                ACALL DispAdrNum
                CLR   TIME_F_UPDD
                SETB  TIME_F_ADCH

E0IrqH_Out:     
                SETB  TIME_F_SYNC              ; Sync-Bit setzen
                POP   DPH
                POP   DPL
                POP   B
                POP   ACC
                POP   PSW
                RET

;               -----------------------------------------------------------------------------
;               ---   Display-Adressen für Zeiger aktualisieren
;               -----------------------------------------------------------------------------
DispAdrPtr:     
                MOV   DPTR,#SecPtrData         ; Daten für Sekundenzeiger
                MOV   A,R1                     ; Aktuellen Wert holen
                MOV   B,#5                     ; Sekundenzeiger sind 5 Byte lang
                MUL   AB
                ADD   A,DPL
                MOV   DISP_TAB_SECPL,A
                MOV   A,B
                ADDC A,DPH
                MOV   DISP_TAB_SECPH,A

                MOV   DPTR,#MinPtrData         ; Daten für Minutenzeiger
                MOV   A,R2                     ; Aktuellen Wert holen
                MOV   B,#9                     ; Minutenzeiger sind 9 Byte lang
                MUL   AB
                ADD   A,DPL
                MOV   DISP_TAB_MINPL,A
                MOV   A,B
                ADDC A,DPH
                MOV   DISP_TAB_MINPH,A

                MOV   DPTR,#HrPtrData          ; Daten für Stundenzeiger
                MOV   A,R2                     ; Aktuellen Wert holen
                MOV   B,#12                    ; Etwas aufwendiger, da Zwischenschritte
                DIV   AB                       ; erforderlich (5 Schritte pro Stunde)
                MOV   R4,A                     ; dazu Minuten durch 12 Teilen um
                MOV   A,R3                     ; auf die Zuwischenschritte zu kommen
                MOV   B,#12                    ; und Stundenwert mit 5 multiplizieren
                DIV   AB
                MOV   A,#5
                MUL   AB
                ADD   A,R4
                MOV   B,#9                     ; Stundenzeiger sind 9 Byte lang
                MUL   AB
                ADD   A,DPL
                MOV   DISP_TAB_HRPL,A
                MOV   A,B
                ADDC A,DPH
                MOV   DISP_TAB_HRPH,A

                RET

;               -----------------------------------------------------------------------------
;               *** Display-Adressen für Nummern aktualisieren
;               -----------------------------------------------------------------------------
DispAdrNum:     
                MOV   A,R1                     ; Daten für Sekundenziffern
                MOV   B,#10
                DIV   AB                       ; Zehner
                RL    A
                MOV   R4,A
                MOV   DPTR,#NumSecTens
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_SECNTH,A
                MOV   A,R4
                INC   A
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_SECNTL,A
                MOV   A,B                      ; Einer
                RL    A
                MOV   R4,A
                MOV   DPTR,#NumSecOnes
                MOVC   A,@A+DPTR
                MOV   DISP_TAB_SECNOH,A
                MOV   A,R4
                INC   A
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_SECNOL,A

                MOV   A,R2                     ; Daten für Minutenziffern
                MOV   B,#10
                DIV   AB                       ; Zehner
                RL    A
                MOV   R4,A
                MOV   DPTR,#NumMinTens
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_MINNTH,A
                MOV   A,R4
                INC   A
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_MINNTL,A
                MOV   A,B                      ; Einer
                RL    A
                MOV   R4,A
                MOV   DPTR,#NumMinOnes
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_MINNOH,A
                MOV   A,R4
                INC   A
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_MINNOL,A

                MOV   A,R3                     ; Daten für Stundenziffern
                MOV   B,#10
                DIV   AB                       ; Zehner
                RL    A
                MOV   R4,A
                MOV   DPTR,#NumHrTens
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_HRNTH,A
                MOV   A,R4
                INC   A
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_HRNTL,A
                MOV   A,B                      ; Einer
                RL    A
                MOV   R4,A
                MOV   DPTR,#NumHrOnes
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_HRNOH,A
                MOV   A,R4
                INC   A
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_HRNOL,A

                MOV   A,DCF_R4                 ; Daten für DCF-Status
                RL    A
                MOV   R4,A
                MOV   DPTR,#DCFStats
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_DCFSH,A
                MOV   A,R4
                INC   A
                MOVC  A,@A+DPTR
                MOV   DISP_TAB_DCFSL,A

                RET

;               -----------------------------------------------------------------------------
;               ---   Taster abfragen
;               -----------------------------------------------------------------------------
CheckKey:       
                MOV   C,P3.0                   ; Checken, ob Taste gedrückt
                ANL   C,P3.1
                JNC   CheckKey_Down
                MOV   R5,#1                    ; Reset Wiederholungszähler, wenn keine Taste
                CLR   TIME_F_KEYREP
                AJMP  CheckKey_Out

CheckKey_Down:  
                DJNZ  R5,CheckKey_Out          ; Prüfen, ob Zeit abgelaufen
                MOV   R5,#KEY_REPEAT           ; Default: Wiederholung
                JB    TIME_F_KEYREP,CheckKey_Proc
                MOV   R5,#KEY_DELAY            ; Erster Tastendruck
                SETB  TIME_F_KEYREP

CheckKey_Proc:  
                SETB  TIME_F_UPDD              ; Merker für Display-Update setzen
                CLR   DCF_F_STATOK             ; DCF-Status zurücksetzen
                ACALL DCF77_UpdStat

CheckKey_Proc0: 
                JB    P3.0,CheckKey_Proc1
                MOV   R0,#TICKS_HZ             ; reset Tick-Zähler
                MOV   R1,#0                    ; Sekunden auf 0
                INC   R2                       ; Minuten ändern
                CJNE  R2,#60,CheckKey_Proc1
                MOV   R2,#0

CheckKey_Proc1:
                JB    P3.1,CheckKey_Out
                INC   R3                       ; Stunden ändern
                CJNE  R3,#24,CheckKey_Out
                MOV   R3,#0
CheckKey_Out:   
                RET

;               *****************************************************************************
;               ***   DCF77-Zeit auswerten
;               ***
;               ***   Verwendete Register:
;               ***     R0   - Tepmorärer Zeiger
;               ***     R1   - Impulszähler (Sekunden)
;               ***     R2   - Zähler für Impulslänge
;               ***     R3   - Zähler für Sync-Pause
;               ***     R4   - Status für Anzeige
;               ***     R5   - Tepmoräres Register
;               ***     B    - Tepmoräres Register
;               ***     DPTR - Tepmorärer Zeiger
;               *****************************************************************************

DCF77:         
                PUSH  PSW
                PUSH  ACC
                MOV   PSW,#00010000b           ; Register-Bank 2

                JB    P3.3,DCF77_Lo            ; Eingang auswerten

;               -----------------------------------------------------------------------------
;               ---   Hi-Zustand des Eingange behandeln
;               -----------------------------------------------------------------------------
DCF77_Hi:       
                JNB   DCF_F_TIMEOK,DCF77_HiC1  ; ggf. Zeit aktualisieren
                CLR   DCF_F_TIMEOK
                MOV   TIME_R0,#TICKS_HZ        ; reset Tick-Zähler
                MOV   TIME_R1,#0               ; Sekunden auf 0
                MOV   A,DCF_MIN
                MOV   TIME_R2,A
                MOV   A,DCF_HR
                MOV   TIME_R3,A
                SETB  TIME_F_UPDD              ; Merker für Display-Update setzen
                SETB  DCF_F_STATOK             ; Flag für Statusanzeige setzen
                ACALL DCF77_UpdStat

DCF77_HiC1:     
                MOV   R3,#DCF_SYNCTIME         ; Zähler für Sync-Zeit zurücksetzen
                SETB  DCF_F_FE                 ; Flag für Flankenerkennung setzen

                CJNE  R2,#DCF_MAXTIME,DCF77_HiC2
                MOV   R1,#59                   ; Nichts weiter machen, wenn max. Pulslänge 
                AJMP  DCF77_Out                ; erreicht
DCF77_HiC2:     
                INC   R2                       ; Zähler für Impulslänge aktualisieren
                AJMP  DCF77_Out

;               -----------------------------------------------------------------------------
;               ---   Lo-Zustand des Eingange behandeln
;               -----------------------------------------------------------------------------
DCF77_Lo:       
                MOV   A,R3                     ; Sync-Timer prüfen
                JZ    DCF77_LoFlag             ; Nix machen, wenn schon auf null
                DEC   A
                MOV   R3,A
                JNZ   DCF77_LoFlag             ; Wenn auf null gewechselt:
                MOV   R1,#0                    ; Bitzähler zurücksetzen

;               -----------------------------------------------------------------------------
;               ---   Fallende Flanke des Eingange behandeln
;               -----------------------------------------------------------------------------
DCF77_LoFlag:   
                JNB   DCF_F_FE,DCF77_LoOut     ; Nur Flanken sind interessant
                CLR   DCF_F_FE                 ; Flag für Flankenerkennung zurücksetzen

                SETB  DCF_F_STATDATA           ; Flag für Datenempfang setzen
                ACALL DCF77_UpdStat

                MOV   A,R2                     ; Impulslänge merken
                MOV   R2,#0                    ; Zähler für Impulslänge zurücksetzen

                CJNE  R1,#59,DCF77_LoCkTime    ; maximal 58 Bits einlesen
DCF77_LoOut:    
                AJMP  DCF77_Out
DCF77_LoCkTime: 
                MOV   B,A                      ; Minimale Pulslänge prüfen
                CLR   C
                SUBB  A,#DCF_MINTIME
                JNC   DCF77_LoBit
                MOV   R1,#59                   ; Nichts weiter machen, wenn unter Minimum
                AJMP  DCF77_Out

DCF77_LoBit:    
                MOV   A,B
                CLR   C                        ; Bitstatus ermitteln
                SUBB  A,#DCF_HITIME
                CPL   C
                MOV   DCF_F_BIT,C

;               -----------------------------------------------------------------------------
;               ---   Daten aus Decode-Tabelle holen
;               -----------------------------------------------------------------------------
                MOV   A,R1                     ; Adresse des Tabelleneintrags berechnen
                MOV   B,#3                     ; ein Eintrag ist 3 Byte lang
                MUL   AB
                MOV   B,A
                MOV   DPTR,#DCF_Tab
                MOVC  A,@A+DPTR                ; Flagmaske lesen
                MOV   DCF_TFLAGS,A
                INC   B
                MOV   A,B
                MOVC  A,@A+DPTR                ; Wertadresse lesen
                MOV   R0,A
                INC   B
                MOV   A,B
                MOVC  A,@A+DPTR                ; Wert lesen
                MOV   B,A

;               -----------------------------------------------------------------------------
;               ---   Einzelne Aktionen ausführen
;               -----------------------------------------------------------------------------
;               ---   Check ob gelesenes Bit 0 ist
;               -----------------------------------------------------------------------------
DCF77_TabNULL:  
                JNB   DCF_TF_NULL,DCF77_TabSET
                JB    DCF_F_BIT,DCF77_TabCHKPE

;               -----------------------------------------------------------------------------
;               ---   Check ob gelesenes Bit 1 ist
;               -----------------------------------------------------------------------------
DCF77_TabSET:   
                JNB   DCF_TF_SET,DCF77_TabCHKP
                JNB   DCF_F_BIT,DCF77_TabCHKPE

;               -----------------------------------------------------------------------------
;               ---   Parity-Bit prüfen
;               -----------------------------------------------------------------------------
DCF77_TabCHKP:  
                JNB   DCF_TF_CHKP,DCF77_TabCLRP
                MOV   C,DCF_F_PARITY
                JNB   DCF_F_BIT,DCF77_TabCHKPC
                CPL   C
DCF77_TabCHKPC: 
                JNC   DCF77_TabCLRP
DCF77_TabCHKPE: 
                MOV   R1,#59                   ; Nichts weiter machen
                AJMP  DCF77_Out

;               -----------------------------------------------------------------------------
;               ---   Parity-Bit zurücksetzen
;               -----------------------------------------------------------------------------
DCF77_TabCLRP:  
                JNB   DCF_TF_CLRP,DCF77_TabRES
                CLR   DCF_F_PARITY

;               -----------------------------------------------------------------------------
;               ---   Aktuellen Wert zurücksetzen
;               -----------------------------------------------------------------------------
DCF77_TabRES:   
                JNB   DCF_TF_RES,DCF77_TabADD
                CLR   A
                MOV   @R0,A

;               -----------------------------------------------------------------------------
;               ---   Aktuellen Wert addieren
;               -----------------------------------------------------------------------------
DCF77_TabADD:   
                JNB   DCF_TF_ADD,DCF77_TabNone
                JNB   DCF_F_BIT,DCF77_TabNone
                MOV   A,@R0
                ADD   A,B
                MOV   @R0,A

DCF77_TabNone:  
                CJNE  R1,#58,DCF77_TabOut      ; Flag für korrekte Zeit setzen, wenn alles 
                                               ; empfangen
                MOV   DPTR,#DCF_ValCheck       ; Wertbereiche prüfen
                MOV   R5,#6
DCF77_ValCkeck: 
                CLR   A                        ; Wertadresse holen
                MOVC  A,@A+DPTR
                INC   DPTR
                MOV   R0,A
                CLR   A                        ; Mindestwert prüfen
                MOVC  A,@A+DPTR
                INC   DPTR
                MOV   B,A
                MOV   A,@R0
                CLR   C
                SUBB  A,B
                JC    DCF77_TabOut
                CLR   A                        ; Maximalwert prüfen
                MOVC  A,@A+DPTR
                INC   DPTR
                CLR   C
                SUBB  A,@R0
                JC    DCF77_TabOut
                DJNZ  R5,DCF77_ValCkeck
                SETB  DCF_F_TIMEOK             ; Flag für Korrekte Zeit setzen

DCF77_TabOut:
                INC   R1                       ; Bitzähler aktualisieren
                JNB   DCF_F_BIT,DCF77_Out      ; Parity aktualisieren
                CPL   DCF_F_PARITY

DCF77_Out:     
                POP   ACC
                POP   PSW
                RET

DCF77_UpdStat:  
                JNB   DCF_F_STATOK,DCF77_UpSt1
                MOV   DCF_R4,#2
                RET
DCF77_UpSt1:    
                JNB   DCF_F_STATDATA,DCF77_UpSt0
                MOV   DCF_R4,#1
                RET
DCF77_UpSt0:   
                MOV   DCF_R4,#0
                RET

;               *****************************************************************************
;               ***   Linien-Routine
;               ***
;               ***   Parameter:
;               ***     R1 - X-Start
;               ***     R2 - Y-Start
;               ***     R3 - X-Ziel
;               ***     R4 - Y-Ziel
;               ***
;               ***   Rückgabe:
;               ***     DLINE_FLAGS - Status-Register
;               ***     R5          - DeltaX
;               ***     R6          - DeltaY
;               ***     R7          - Fehler-Register
;               ***
;               ***   Bugs:
;               ***     Fehlerregister hat ein Bit zu wenig, um
;               ***     DeltaY-Werte > 127 zu verarbeiten
;               ***     Reicht aber für unsere Zwecke
;               *****************************************************************************

DrawLine:       
                MOV   DLINE_FLAGS,#0           ; Status initialisieren
;               -----------------------------------------------------------------------------
;               ---   DAC initialisieren, wenn Strahl aus ist
;               -----------------------------------------------------------------------------
                JNB   P3.7,DrawLine_DLT
                MOV   P1,R1                    ; DAC 1 aktualisieren
                CLR   P3.5
                CLR   P3.4
                SETB  P3.4
                MOV   P1,R2                    ; DAC 2 aktualisiseren
                SETB  P3.5
                CLR   P3.4
                SETB  P3.4
                MOV   R7,#BEAM_ON_DLY_1        ; Verzögerung, um Schlieren zu
DrawLine_IDL:   
                DJNZ  R7,DrawLine_IDL          ; vermeiden
;               -----------------------------------------------------------------------------
;               ---   Deltas berechnen
;               -----------------------------------------------------------------------------
DrawLine_DLT:   
                CLR   C                        ; deltaX berechnen
                MOV   A,R1
                SUBB  A,R3
                JNC   DrawLine_DXC
                DEC   A
                XRL   A,#0FFh
DrawLine_DXC:   
                MOV   R5,A
                CLR   C                        ; deltaY berechnen
                MOV   A,R2
                SUBB  A,R4
                JNC   DrawLine_DYC
                DEC   A
                XRL   A,#0FFh
DrawLine_DYC:   
                MOV   R6,A
;               -----------------------------------------------------------------------------
;               ---   X- und Y-Werte tauschen, wenn erforderlich
;               -----------------------------------------------------------------------------
                CLR   C                        ; deltaX muß > deltaY sein
                MOV   A,R5                     ; wenn doch, X- und Y-Werte tauschen
                SUBB  A,R6
                JNC   DrawLine_DIR
                SETB  DLINE_F_SWXY
                MOV   A,R1
                XCH   A,R2
                MOV   R1,A
                MOV   A,R3
                XCH   A,R4
                MOV   R3,A
                MOV   A,R5
                XCH   A,R6
                MOV   R5,A
;               -----------------------------------------------------------------------------
;               ---   Richtungen ermitteln
;               -----------------------------------------------------------------------------
DrawLine_DIR:   
                CLR   C                        ; X-Richtung ermitteln
                MOV   A,R3
                SUBB  A,R1
                MOV   DLINE_F_XDIR,C
                CLR   C                        ; Y-Richtung ermitteln
                MOV   A,R4
                SUBB  A,R2
                MOV   DLINE_F_YDIR,C
;               -----------------------------------------------------------------------------
;               ---   Flags setzen
;               -----------------------------------------------------------------------------
                MOV   R7,#0                    ; Fehler-Register initialisieren
                CLR   P3.7                     ; Strahl an, wenn aus war
;               -----------------------------------------------------------------------------
;               ---   DAC aktualisieren
;               -----------------------------------------------------------------------------
DrawLineLoop:   
                MOV   C,DLINE_F_SWXY           ; Swaping von X/Y berücksichtigen
                MOV   P1,R1                    ; DAC 1 aktualisieren
                MOV   P3.5,C
                CLR   P3.4
                SETB   P3.4
                CPL   C                        ; anderen DAC wählen
                MOV   P1,R2                    ; DAC 2 aktualisiseren
                MOV   P3.5,C
                CLR   P3.4
                SETB  P3.4
;               -----------------------------------------------------------------------------
                MOV   B,#DRAW_DLY              ; ins Draw delay
DrawLine_IDL2:  
                DJNZ  B,DrawLine_IDL2         
;               -----------------------------------------------------------------------------
;               ---   prüfen, ob Ziel erreicht
;               -----------------------------------------------------------------------------
                MOV   A,R1
                CJNE  A,DLINE_R3,DrawLine_Err
                JNB   DLINE_F_SWXY,DrawLine_Out
                MOV   A,R1                     ;ggf. X- und Y-Wert zurücktauschen
                XCH   A,R2
                MOV   R1,A
                AJMP  DrawLine_Out
;               -----------------------------------------------------------------------------
;               ---   Fehler aktualisieren
;               -----------------------------------------------------------------------------
DrawLine_Err:   
                MOV   A,R7
                ADD   A,R6
                MOV   R7,A
                JNC   DrawLine_ChkY
                CLR   DLINE_F_ENEG
;               -----------------------------------------------------------------------------
;               ---   Wenn Fehler zu groß, einen Schritt in Y-Richtung
;               -----------------------------------------------------------------------------
DrawLine_ChkY:  
                JB    DLINE_F_ENEG,DrawLine_IncX
                MOV   A,R5
                SETB  C
                SUBB  A,R7
                JC    DrawLine_IncY
                SUBB  A,R7
                JC    DrawLine_IncY
                AJMP  DrawLine_IncX
DrawLine_IncY:  
                MOV   A,R7                     ; Fehler und Y-Wert aktualisieren
                CLR   C
                SUBB  A,R5
                MOV   R7,A
                MOV   DLINE_F_ENEG,C
                JB    DLINE_F_YDIR,DrawLine_IncYN
                INC   R2
                AJMP  DrawLine_IncX
DrawLine_IncYN: 
                DEC   R2
;               -----------------------------------------------------------------------------
;               ---   X-Wert aktualisieren
;               -----------------------------------------------------------------------------
DrawLine_IncX:  
                JB    DLINE_F_XDIR,DrawLine_IncXN
                INC   R1
                AJMP  DrawLineLoop
DrawLine_IncXN:
                DEC   R1
                AJMP  DrawLineLoop
DrawLine_Out:  
                RET

;               *****************************************************************************
;               ***   Tabelle für DCF77-Decodierer
;               ***
;               ***   Satzaufbau:
;               ***    1. Bitmaske für Flags
;               ***    2. Adresse für Wertmerker
;               ***    3. Wert bei gesetztem Bit
;               ***
;               ***   Flag-Bits:
;               ***    0 - Empfangendes Bit muß 0 sein
;               ***    1 - Wertmerker vor Addition zurücksetzen
;               ***    2 - Aktuellen Wert auf Wertmerker addieren
;               ***    3 - Paritybit zurücksetzen
;               ***    4 - Paritybit mit empfangenen Bit vergleichen
;               ***    5 - Empfangendes Bit muß 1 sein
;               *****************************************************************************

DCF_Tab:        
                DB 00000001b,0,0               ; DCF-Sekunde 0  (Start, Immer 0)
                DB 00000000b,0,0               ; DCF-Sekunde 1
                DB 00000000b,0,0               ; DCF-Sekunde 2
                DB 00000000b,0,0               ; DCF-Sekunde 3
                DB 00000000b,0,0               ; DCF-Sekunde 4
                DB 00000000b,0,0               ; DCF-Sekunde 5
                DB 00000000b,0,0               ; DCF-Sekunde 6
                DB 00000000b,0,0               ; DCF-Sekunde 7
                DB 00000000b,0,0               ; DCF-Sekunde 8
                DB 00000000b,0,0               ; DCF-Sekunde 9
                DB 00000000b,0,0               ; DCF-Sekunde 10
                DB 00000000b,0,0               ; DCF-Sekunde 11
                DB 00000000b,0,0               ; DCF-Sekunde 12
                DB 00000000b,0,0               ; DCF-Sekunde 13
                DB 00000000b,0,0               ; DCF-Sekunde 14
                DB 00000000b,0,0               ; DCF-Sekunde 15 (Reserveantenne aktiv)
                DB 00000000b,0,0               ; DCF-Sekunde 16 (Umstellung SZ/WZ)
                DB 00000000b,0,0               ; DCF-Sekunde 17 (Sommerzeit aktiv)
                DB 00000000b,0,0               ; DCF-Sekunde 18 (Winterzeit aktiv)
                DB 00000000b,0,0               ; DCF-Sekunde 19 (Ankündigung Schaltsekunde)
                DB 00100000b,0,0               ; DCF-Sekunde 20 (Zeitbeginn, immer 1)

                DB 00001110b,DCF_MIN,1         ; DCF-Sekunde 21 (Start Minuten)
                DB 00000100b,DCF_MIN,2         ; DCF-Sekunde 22
                DB 00000100b,DCF_MIN,4         ; DCF-Sekunde 23
                DB 00000100b,DCF_MIN,8         ; DCF-Sekunde 24
                DB 00000100b,DCF_MIN,10        ; DCF-Sekunde 25
                DB 00000100b,DCF_MIN,20        ; DCF-Sekunde 26
                DB 00000100b,DCF_MIN,40        ; DCF-Sekunde 27
                DB 00010000b,0,0               ; DCF-Sekunde 28 (Parity Minuten)

                DB 00001110b,DCF_HR,1          ; DCF-Sekunde 29 (Start Stunden)
                DB 00000100b,DCF_HR,2          ; DCF-Sekunde 30
                DB 00000100b,DCF_HR,4          ; DCF-Sekunde 31
                DB 00000100b,DCF_HR,8          ; DCF-Sekunde 32
                DB 00000100b,DCF_HR,10         ; DCF-Sekunde 33
                DB 00000100b,DCF_HR,20         ; DCF-Sekunde 34
                DB 00010000b,0,0               ; DCF-Sekunde 35 (Parity Stunden)

                DB 00001110b,DCF_DAY,1         ; DCF-Sekunde 36 (Start Tag)
                DB 00000100b,DCF_DAY,2         ; DCF-Sekunde 37
                DB 00000100b,DCF_DAY,4         ; DCF-Sekunde 38
                DB 00000100b,DCF_DAY,8         ; DCF-Sekunde 39
                DB 00000100b,DCF_DAY,10        ; DCF-Sekunde 40
                DB 00000100b,DCF_DAY,20        ; DCF-Sekunde 41
                DB 00000110b,DCF_DOW,1         ; DCF-Sekunde 42 (Start Wochentag)
                DB 00000100b,DCF_DOW,2         ; DCF-Sekunde 43
                DB 00000100b,DCF_DOW,4         ; DCF-Sekunde 44
                DB 00000110b,DCF_MON,1         ; DCF-Sekunde 45 (Start Monat)
                DB 00000100b,DCF_MON,2         ; DCF-Sekunde 46
                DB 00000100b,DCF_MON,4         ; DCF-Sekunde 47
                DB 00000100b,DCF_MON,8         ; DCF-Sekunde 48
                DB 00000100b,DCF_MON,10        ; DCF-Sekunde 49
                DB 00000110b,DCF_YR,1          ; DCF-Sekunde 50 (Start Jahr)
                DB 00000100b,DCF_YR,2          ; DCF-Sekunde 51
                DB 00000100b,DCF_YR,4          ; DCF-Sekunde 52
                DB 00000100b,DCF_YR,8          ; DCF-Sekunde 53
                DB 00000100b,DCF_YR,10         ; DCF-Sekunde 54
                DB 00000100b,DCF_YR,20         ; DCF-Sekunde 55
                DB 00000100b,DCF_YR,40         ; DCF-Sekunde 56
                DB 00000100b,DCF_YR,80         ; DCF-Sekunde 57
                DB 00010000b,0,0               ; DCF-Sekunde 58 (Parity Datum)
                DB 00000000b,0,0               ; DCF-Sekunde 59 (Sync-Pause)

;               *****************************************************************************
;               ***   Tabelle für DCF77-Bereichsprüfung
;               ***
;               ***   Satzaufbau:
;               ***     1. Adresse für Wertmerker
;               ***     2. Minimalwert
;               ***     3. Maximalwert
;               *****************************************************************************

DCF_ValCheck:   
                DB DCF_MIN,0,59
                DB DCF_HR,0,23
                DB DCF_DAY,1,31
                DB DCF_DOW,1,7
                DB DCF_MON,1,12
                DB DCF_YR,0,99

$Include(DisplDat.INC)
;
                END
