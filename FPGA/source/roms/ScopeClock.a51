;               **********************************************
;               *** 8031-Software für ScopeClock-Hardware
;               ***
;               *** (c) 2004 by Sascha Ittner (GPL)
;               ***
;               *** 24.10.2004: V1.0
;               *** Erste veröffentliche Version
;               **********************************************
;               *** um Delay in Draw-Routine ergänzt von cm
;               *** für schnellere FPGA-Implementation
;               **********************************************
;               *** Konstanten
;               **********************************************

                .equ TICKS_HZ,        50

                .equ DCF_SYNCTIME,    60
                .equ DCF_HITIME,      8
                .equ DCF_MINTIME,     3
                .equ DCF_MAXTIME,     14

                .equ KEY_DELAY,       50
                .equ KEY_REPEAT,      12

                .equ BEAM_OFF_DLY,    010h   ; orig. 10
                .equ BEAM_ON_DLY,     030h   ; orig. 30
                .equ DRAW_DLY,        40 

                .equ INIT_STACK,      048h

                .equ DISP_TAB_LEN,    11
                .equ DISP_TAB,        030h
                .equ DISP_TAB_SECPL,  030h
                .equ DISP_TAB_SECPH,  031h
                .equ DISP_TAB_MINPL,  032h
                .equ DISP_TAB_MINPH,  033h
                .equ DISP_TAB_HRPL,   034h
                .equ DISP_TAB_HRPH,   035h
                .equ DISP_TAB_SECNOL, 036h
                .equ DISP_TAB_SECNOH, 037h
                .equ DISP_TAB_SECNTL, 038h
                .equ DISP_TAB_SECNTH, 039h
                .equ DISP_TAB_MINNOL, 03Ah
                .equ DISP_TAB_MINNOH, 03Bh
                .equ DISP_TAB_MINNTL, 03Ch
                .equ DISP_TAB_MINNTH, 03Dh
                .equ DISP_TAB_HRNOL,  03Eh
                .equ DISP_TAB_HRNOH,  03Fh
                .equ DISP_TAB_HRNTL,  040h
                .equ DISP_TAB_HRNTH,  041h
                .equ DISP_TAB_DCFSL,  042h
                .equ DISP_TAB_DCFSH,  043h
                .equ DISP_TAB_SCALEL, 044h
                .equ DISP_TAB_SCALEH, 045h

                .equ DLINE_R0,        000h
                .equ DLINE_R1,        001h
                .equ DLINE_R2,        002h
                .equ DLINE_R3,        003h
                .equ DLINE_R4,        004h
                .equ DLINE_R5,        005h
                .equ DLINE_R6,        006h
                .equ DLINE_R7,        007h

                .equ TIME_R0,         008h
                .equ TIME_R1,         009h
                .equ TIME_R2,         00Ah
                .equ TIME_R3,         00Bh
                .equ TIME_R4,         00Ch
                .equ TIME_R5,         00Dh

                .equ DCF_R0,          010h
                .equ DCF_R1,          011h
                .equ DCF_R2,          012h
                .equ DCF_R3,          013h
                .equ DCF_R4,          014h
                .equ DCF_R5,          015h

                .equ DCF_MIN,         018h
                .equ DCF_HR,          019h
                .equ DCF_DAY,         01Ah
                .equ DCF_DOW,         01Bh
                .equ DCF_MON,         01Ch
                .equ DCF_YR,          01Dh

                .equ DLINE_FLAGS,     020h  ; Bits 00-07
                .equ DLINE_F_XDIR,    000h
                .equ DLINE_F_YDIR,    001h
                .equ DLINE_F_SWXY,    002h
                .equ DLINE_F_ENEG,    003h

                .equ TIME_FLAGS,      021h  ; Bits 08-0f
                .equ TIME_F_UPDD,     008h
                .equ TIME_F_ADCH,     009h
                .equ TIME_F_KEYREP,   00Ah
                .equ TIME_F_SYNC,     00Bh
                .equ TIME_F_TICKSND,  00Ch
                .equ TIME_F_TOGGLE,  00Dh

                .equ DCF_FLAGS,       022h  ; Bits 10-17
                .equ DCF_F_FE,        010h
                .equ DCF_F_BIT,       011h
                .equ DCF_F_PARITY,    012h
                .equ DCF_F_TIMEOK,    013h
                .equ DCF_F_STATDATA,  014h
                .equ DCF_F_STATOK,    015h

                .equ DCF_TFLAGS,      023h  ; Bits 18-1f
                .equ DCF_TF_NULL,     018h
                .equ DCF_TF_RES,      019h
                .equ DCF_TF_ADD,      01Ah
                .equ DCF_TF_CLRP,     01Bh
                .equ DCF_TF_CHKP,     01Ch
                .equ DCF_TF_SET,      01Dh


;               **********************************************
;               *** Einsprungspunkte
;               **********************************************

                .org 0000h                 ; Hauptprogramm
                ajmp Main

                .org 0003h                 ; Externer Interrupt 0
                acall E0IrqHandler
                reti

                .org 000Bh                 ; Timer 0 Interrupt
                acall T0IrqHandler
                reti

                .org 0013h                 ; Externer Interrupt 0
                reti

                .org 001Bh                 ; Timer 1 Interrupt
                reti

                .org 0023h                 ; Serieller Port Interrupt
                reti

;               **********************************************
;               *** Hauptprogramm
;               **********************************************

;               *** Controler initialisieren
Main:           mov SP,#INIT_STACK          ; Stackpointer setzen
                mov PSW,#00000000b          ; Gegister-Bank 0

                mov P1,#128                 ; DAC initialisieren
                clr P3.5                    ; DAC A
                clr P3.6                    ; DAC A1
                clr P3.4
                setb P3.4
                setb P3.5                   ; DAC B
                clr P3.4
                setb P3.4

                mov DPTR,#ScaleData         ; Zuerst Zifferblatt anzeigen
                mov R0,#DISP_TAB            ; Display-Tabelle initialisieren
                mov R1,#DISP_TAB_LEN
Main_InitLoop1: mov @R0,DPL
                inc R0
                mov @R0,DPH
                inc R0
                djnz R1,Main_InitLoop1

                mov DLINE_FLAGS,#0          ; Status initialisieren
                mov R0,#0                   ; Zähler für Display-Tabelle initialisieren
                mov R1,#128                 ; X1 initialisieren
                mov R2,#128                 ; Y1 initialisieren
                mov R3,#128                 ; X2 initialisieren
                mov R4,#128                 ; Y2 initialisieren

                mov TIME_FLAGS,#0           ; Status initialisieren
                mov TIME_R0,#TICKS_HZ       ; TICK-Zähler für Sekunden initialisieren
                mov TIME_R1,#0              ; Sekunden initialisieren
                mov TIME_R2,#0              ; Minuten initialisieren
                mov TIME_R3,#0              ; Stunden initialisieren
                mov TIME_R4,#0              ; Tmp-Register initialisieren
                mov TIME_R5,#1              ; Tastenverzögerung initialisieren

                mov DCF_FLAGS,#0            ; DCF-Flags initialisieren
                mov DCF_TFLAGS,#0           ; DCF-Tabellen-Flags initialisieren
                mov DCF_R0,#0               ; Reset Tabellenadresse
                mov DCF_R1,#59              ; Bitzähler initialisieren
                mov DCF_R2,#0               ; Pulstimer initialisieren
                mov DCF_R3,#DCF_SYNCTIME    ; Zähler für Sync-Zeit initialisieren
                mov DCF_R4,#0               ; DCF-Statusanzeige initialisieren

                mov TMOD,#00000001b         ; T0 = Clock driven 16 Bit Timer
                mov TCON,#00000001b         ; EXT0 flankengesteuert
                mov IE,#10000011b           ; IRQ enable (T0+EXT0)

;               *** Schleife für Bildschirmausgabe
;               *** Daten holen
Main_Loop:      
								clr A                       ; nächstes X/Y-Paar holen
                movc A,@A+DPTR
                inc DPTR
                jz Main_DImed               ; 000h = Immediate Jump
                cjne A,#0FFh,Main_DNorm     ; 0FFh = Tabellenende

;               *** Neue Displayadresse holen
Main_NewAddr:   mov A,#DISP_TAB             ; Tabellenadresse berechnen
                add A,R0
                add A,R0
                mov R1,A
                clr TIME_F_ADCH             ; Prüfen, ob Tabelle während lesens geändert
                mov A,@R1                   ; Daten aus Tabelle holen
                mov DPL,A
                inc R1
                mov A,@R1
                mov DPH,A
                jb TIME_F_ADCH,Main_NewAddr

                inc R0                      ; nächster Eintrag
                cjne R0,#DISP_TAB_LEN,Main_DImed

;Wartezeit für TickSound nutzen, R0 nicht mehr gebraucht
                jnb TIME_F_TICKSND,Main_NoSound ; Prüfen, ob TickSound auszugeben, jede Sekunde
                clr TIME_F_TICKSND
                cpl TIME_F_TOGGLE
                mov P1,#094h
                jb TIME_F_TOGGLE,Main_altsound ; alternativer Sound
                mov P1,#000h
Main_altsound:  setb P3.5
                setb P3.6
                clr P3.4
                setb P3.4
                mov r0,#180        ; Verzögerung für TickSound
                jb TIME_F_TOGGLE,Main_dsound ; alternativer Sound
                mov r0,#10        ; Verzögerung für TickSound
Main_dsound:    djnz r0,Main_dsound
                mov P1,#080h
                clr  P3.4
                setb P3.4
                clr  P3.5
                clr  P3.6
Main_NoSound:                  
                mov R0,#0
                setb P3.7                   ; Strahl aus

                clr TIME_F_SYNC             ; Auf Sync warten
Main_Wait:      jnb TIME_F_SYNC,Main_Wait


                ajmp Main_DImed_Get

Main_DImed:     mov R7,#BEAM_OFF_DLY        ; Verzögerung, um Schlieren zu
Main_DImed_DLY: djnz R7,Main_DImed_DLY      ; vermeiden
                setb P3.7                   ; Strahl aus
Main_DImed_Get: clr A                       ; erstes X/Y-Paar holen
                movc A,@A+DPTR
                inc DPTR
                mov R1,A
                clr A
                movc A,@A+DPTR
                inc DPTR
                mov R2,A
                ajmp Main_Loop

Main_DNorm:     mov R3,A                    ; alles andere sind normale Daten
                clr A
                movc A,@A+DPTR
                inc DPTR
                mov R4,A

;               *** Linie Zeichnen
                acall DrawLine

                ajmp Main_Loop

;               **********************************************
;               *** Handler für Interrupt T0
;               **********************************************
T0IrqHandler:   clr TCON.4                  ; Timer 0 stoppen
                clr TCON.1                  ; IE-Flag für Nezt-IRQ löschen
                setb IE.0                   ; Nezt-IRQ zulassen
                ret

;               **********************************************
;               *** Handler für Interrupt E0
;               ***
;               *** Benutze Register
;               ***   R0 - Tick-Counter für Sekunden
;               ***   R1 - Sekunden
;               ***   R2 - Minuten
;               ***   R3 - Stunden
;               ***   R4 - Tmp-Register
;               ***   R5 - Wiederholungszähler für Tasten
;               **********************************************

E0IrqHandler:   push PSW
                push ACC
                push B
                push DPL
                push DPH
                mov PSW,#00001000b          ; Gegister-Bank 1

                clr IE.0                    ; Netz-IRQ sperren
                mov TH0,#08Ah               ; Gate-Timer initialisieren
                mov TL0,#0D0h
                setb TCON.4                 ; und starten

                acall CheckKey              ; Tasten abfragen

                djnz R0,E0IrqH_DispAdr      ; Tick-Zähler aktualisieren
                mov R0,#TICKS_HZ

;               *** Zeiten aktualisieren
                setb TIME_F_UPDD            ; Merker für Display-Update setzen
                setb TIME_F_TICKSND
                inc R1                      ; Sekunden aktualisieren
                cjne R1,#60,E0IrqH_DispAdr
                mov R1,#0

                acall DCF77_UpdStat         ; Einmal pro Minute DCF-Status zurücksetzen
                clr DCF_F_STATOK
                clr DCF_F_STATDATA

                inc R2                      ; Minuten aktualisieren
                cjne R2,#60,E0IrqH_DispAdr
                mov R2,#0
                inc R3                      ; Stunden aktualisieren
                cjne R3,#24,E0IrqH_DispAdr
                mov R3,#0

;               *** Display-Adressen aktualisieren
E0IrqH_DispAdr: acall DCF77                ; DCF77-Zeit auswerten
                jnb TIME_F_UPDD,E0IrqH_Out ; Prüfen, ob Update erforderlich
                acall DispAdrPtr
                acall DispAdrNum
                clr TIME_F_UPDD
                setb TIME_F_ADCH

E0IrqH_Out:     setb TIME_F_SYNC           ; Sync-Bit setzen
                pop DPH
                pop DPL
                pop B
                pop ACC
                pop PSW
                ret

;               **********************************************
;               *** Display-Adressen für Zeiger aktualisieren
;               **********************************************

DispAdrPtr:     mov DPTR,#SecPtrData        ; Daten für Sekundenzeiger
                mov A,R1                    ; Aktuellen Wert holen
                mov B,#5                    ; Sekundenzeiger sind 5 Byte lang
                mul AB
                add A,DPL
                mov DISP_TAB_SECPL,A
                mov A,B
                addc A,DPH
                mov DISP_TAB_SECPH,A

                mov DPTR,#MinPtrData        ; Daten für Minutenzeiger
                mov A,R2                    ; Aktuellen Wert holen
                mov B,#9                    ; Minutenzeiger sind 9 Byte lang
                mul AB
                add A,DPL
                mov DISP_TAB_MINPL,A
                mov A,B
                addc A,DPH
                mov DISP_TAB_MINPH,A

                mov DPTR,#HrPtrData         ; Daten für Stundenzeiger
                mov A,R2                    ; Aktuellen Wert holen
                mov B,#12                   ; Etwas aufwendiger, da Zwischenschritte
                div AB                      ; erforderlich (5 Schritte pro Stunde)
                mov R4,A                    ; dazu Minuten durch 12 Teilen um
                mov A,R3                    ; auf die Zuwischenschritte zu kommen
                mov B,#12                   ; und Stundenwert mit 5 multiplizieren
                div AB
                mov A,#5
                mul AB
                add A,R4
                mov B,#9                    ; Stundenzeiger sind 9 Byte lang
                mul AB
                add A,DPL
                mov DISP_TAB_HRPL,A
                mov A,B
                addc A,DPH
                mov DISP_TAB_HRPH,A

                ret

;               **********************************************
;               *** Display-Adressen für Nummern aktualisieren
;               **********************************************

DispAdrNum:     mov A,R1                    ; Daten für Sekundenziffern
                mov B,#10
                div AB                      ; Zehner
                rl A
                mov R4,A
                mov DPTR,#NumSecTens
                movc A,@A+DPTR
                mov DISP_TAB_SECNTH,A
                mov A,R4
                inc A
                movc A,@A+DPTR
                mov DISP_TAB_SECNTL,A
                mov A,B                     ; Einer
                rl A
                mov R4,A
                mov DPTR,#NumSecOnes
                movc A,@A+DPTR
                mov DISP_TAB_SECNOH,A
                mov A,R4
                inc A
                movc A,@A+DPTR
                mov DISP_TAB_SECNOL,A

                mov A,R2                    ; Daten für Minutenziffern
                mov B,#10
                div AB                      ; Zehner
                rl A
                mov R4,A
                mov DPTR,#NumMinTens
                movc A,@A+DPTR
                mov DISP_TAB_MINNTH,A
                mov A,R4
                inc A
                movc A,@A+DPTR
                mov DISP_TAB_MINNTL,A
                mov A,B                     ; Einer
                rl A
                mov R4,A
                mov DPTR,#NumMinOnes
                movc A,@A+DPTR
                mov DISP_TAB_MINNOH,A
                mov A,R4
                inc A
                movc A,@A+DPTR
                mov DISP_TAB_MINNOL,A

                mov A,R3                    ; Daten für Stundenziffern
                mov B,#10
                div AB                      ; Zehner
                rl A
                mov R4,A
                mov DPTR,#NumHrTens
                movc A,@A+DPTR
                mov DISP_TAB_HRNTH,A
                mov A,R4
                inc A
                movc A,@A+DPTR
                mov DISP_TAB_HRNTL,A
                mov A,B                     ; Einer
                rl A
                mov R4,A
                mov DPTR,#NumHrOnes
                movc A,@A+DPTR
                mov DISP_TAB_HRNOH,A
                mov A,R4
                inc A
                movc A,@A+DPTR
                mov DISP_TAB_HRNOL,A

                mov A,DCF_R4                ; Daten für DCF-Status
                rl A
                mov R4,A
                mov DPTR,#DCFStats
                movc A,@A+DPTR
                mov DISP_TAB_DCFSH,A
                mov A,R4
                inc A
                movc A,@A+DPTR
                mov DISP_TAB_DCFSL,A

                ret

;               **********************************************
;               *** Taster abfragen
;               **********************************************

CheckKey:       mov C,P3.0                  ; Checken, ob Taste gedrückt
                anl C,P3.1
                jnc CheckKey_Down
                mov R5,#1                   ; Reset Wiederholungszähler, wenn keine Taste
                clr TIME_F_KEYREP
                ajmp CheckKey_Out

CheckKey_Down:  djnz R5,CheckKey_Out        ; Prüfen, ob Zeit abgelaufen
                mov R5,#KEY_REPEAT          ; Default: Wiederholung
                jb TIME_F_KEYREP,CheckKey_Proc
                mov R5,#KEY_DELAY           ; Erster Tastendruck
                setb TIME_F_KEYREP

CheckKey_Proc:  setb TIME_F_UPDD            ; Merker für Display-Update setzen
                clr DCF_F_STATOK            ; DCF-Status zurücksetzen
                acall DCF77_UpdStat

CheckKey_Proc0: jb P3.0,CheckKey_Proc1
                mov R0,#TICKS_HZ            ; reset Tick-Zähler
                mov R1,#0                   ; Sekunden auf 0
                inc R2                      ; Minuten ändern
                cjne R2,#60,CheckKey_Proc1
                mov R2,#0

CheckKey_Proc1: jb P3.1,CheckKey_Out
                inc R3                      ; Stunden ändern
                cjne R3,#24,CheckKey_Out
                mov R3,#0

CheckKey_Out:   ret


;               **********************************************
;               *** DCF77-Zeit auswerten
;               ***
;               *** Verwendete Register:
;               ***   R0   - Tepmorärer Zeiger
;               ***   R1   - Impulszähler (Sekunden)
;               ***   R2   - Zähler für Impulslänge
;               ***   R3   - Zähler für Sync-Pause
;               ***   R4   - Status für Anzeige
;               ***   R5   - Tepmoräres Register
;               ***   B    - Tepmoräres Register
;               ***   DPTR - Tepmorärer Zeiger
;               **********************************************

DCF77:          push PSW
                push ACC
                mov PSW,#00010000b          ; Gegister-Bank 2

                jb P3.3,DCF77_Lo            ; Eingang auswerten

;               *** Hi-Zustand des Eingange behandeln
DCF77_Hi:       jnb DCF_F_TIMEOK,DCF77_HiC1 ; ggf. Zeit aktualisieren
                clr DCF_F_TIMEOK
                mov TIME_R0,#TICKS_HZ       ; reset Tick-Zähler
                mov TIME_R1,#0              ; Sekunden auf 0
                mov A,DCF_MIN
                mov TIME_R2,A
                mov A,DCF_HR
                mov TIME_R3,A
                setb TIME_F_UPDD            ; Merker für Display-Update setzen
                setb DCF_F_STATOK           ; Flag für Statusanzeige setzen
                acall DCF77_UpdStat

DCF77_HiC1:     mov R3,#DCF_SYNCTIME        ; Zähler für Sync-Zeit zurücksetzen
                setb DCF_F_FE               ; Flag für Flankenerkennung setzen

                cjne R2,#DCF_MAXTIME,DCF77_HiC2
                mov R1,#59                  ; Nichts weiter machen, wenn Maximale Pulslänge erreicht
                ajmp DCF77_Out
DCF77_HiC2:     inc R2                      ; Zähler für Impulslänge aktualisieren
                ajmp DCF77_Out

;               *** Lo-Zustand des Eingange behandeln
DCF77_Lo:       mov A,R3                    ; Sync-Timer prüfen
                jz DCF77_LoFlag             ; Nix machen, wenn schon auf null
                dec A
                mov R3,A
                jnz DCF77_LoFlag            ; Wenn auf null gewechselt:
                mov R1,#0                   ; Bitzähler zurücksetzen

;               *** Fallende Flanke des Eingange behandeln
DCF77_LoFlag:   jnb DCF_F_FE,DCF77_LoOut    ; Nur Flanken sind interessant
                clr DCF_F_FE                ; Flag für Flankenerkennung zurücksetzen

                setb DCF_F_STATDATA         ; Flag für Datenempfang setzen
                acall DCF77_UpdStat

                mov A,R2                    ; Impulslänge merken
                mov R2,#0                   ; Zähler für Impulslänge zurücksetzen

                cjne R1,#59,DCF77_LoCkTime  ; maximal 58 Bits einlesen
DCF77_LoOut:    ajmp DCF77_Out

DCF77_LoCkTime: mov B,A                     ; Minimale Pulslänge prüfen
                clr C
                subb A,#DCF_MINTIME
                jnc DCF77_LoBit
                mov R1,#59                  ; Nichts weiter machen, wenn unter Minimum
                ajmp DCF77_Out

DCF77_LoBit:    mov A,B
                clr C                       ; Bitstatus ermitteln
                subb A,#DCF_HITIME
                cpl C
                mov DCF_F_BIT,C

;               *** Daten aus Decode-Tabelle holen
                mov A,R1                    ; Adresse des Tabelleneintrags berechnen
                mov B,#3                    ; ein Eintrag ist 3 Byte lang
                mul AB
                mov B,A
                mov DPTR,#DCF_Tab
                movc A,@DPTR+A              ; Flagmaske lesen
                mov DCF_TFLAGS,A
                inc B
                mov A,B
                movc A,@DPTR+A              ; Wertadresse lesen
                mov R0,A
                inc B
                mov A,B
                movc A,@DPTR+A              ; Wert lesen
                mov B,A

;               *** Einzelne Aktionen ausführen
;               *** Check ob gelesenes Bit 0 ist
DCF77_TabNULL:  jnb DCF_TF_NULL,DCF77_TabSET
                jb DCF_F_BIT,DCF77_TabCHKPE

;               *** Check ob gelesenes Bit 1 ist
DCF77_TabSET:   jnb DCF_TF_SET,DCF77_TabCHKP
                jnb DCF_F_BIT,DCF77_TabCHKPE

;               *** Parity-Bit prüfen
DCF77_TabCHKP:  jnb DCF_TF_CHKP,DCF77_TabCLRP
                mov C,DCF_F_PARITY
                jnb DCF_F_BIT,DCF77_TabCHKPC
                cpl C
DCF77_TabCHKPC: jnc DCF77_TabCLRP
DCF77_TabCHKPE: mov R1,#59                  ; Nichts weiter machen
                ajmp DCF77_Out

;               *** Parity-Bit zurücksetzen
DCF77_TabCLRP:  jnb DCF_TF_CLRP,DCF77_TabRES
                clr DCF_F_PARITY

;               *** Aktuellen Wert zurücksetzen
DCF77_TabRES:   jnb DCF_TF_RES,DCF77_TabADD
                clr A
                mov @R0,A

;               *** Aktuellen Wert addieren
DCF77_TabADD:   jnb DCF_TF_ADD,DCF77_TabNone
                jnb DCF_F_BIT,DCF77_TabNone
                mov A,@R0
                add A,B
                mov @R0,A

DCF77_TabNone:  cjne R1,#58,DCF77_TabOut    ; Flag für Korrekte Zeit setzen, wenn alles Empfangen
                mov DPTR,#DCF_ValCheck      ; Wertbereiche prüfen
                mov R5,#6
DCF77_ValCkeck: clr A                       ; Wertadresse holen
                movc A,@DPTR+A
                inc DPTR
                mov R0,A
                clr A                       ; Mindestwert prüfen
                movc A,@DPTR+A
                inc DPTR
                mov B,A
                mov A,@R0
                clr C
                subb A,B
                jc DCF77_TabOut
                clr A                       ; Maximalwert prüfen
                movc A,@DPTR+A
                inc DPTR
                clr C
                subb A,@R0
                jc DCF77_TabOut
                djnz R5,DCF77_ValCkeck
                setb DCF_F_TIMEOK           ; Flag für Korrekte Zeit setzen

DCF77_TabOut:   inc R1                      ; Bitzähler aktualisieren
                jnb DCF_F_BIT,DCF77_Out     ; Parity aktualisieren
                cpl DCF_F_PARITY

DCF77_Out:      pop ACC
                pop PSW
                ret

DCF77_UpdStat:  jnb DCF_F_STATOK,DCF77_UpSt1
                mov DCF_R4,#2
                ret
DCF77_UpSt1:    jnb DCF_F_STATDATA,DCF77_UpSt0
                mov DCF_R4,#1
                ret
DCF77_UpSt0:    mov DCF_R4,#0
                ret

;               **********************************************
;               *** Linien-Routine
;               ***
;               *** Parameter:
;               ***   R1 - X-Start
;               ***   R2 - Y-Start
;               ***   R3 - X-Ziel
;               ***   R4 - Y-Ziel
;               ***
;               *** Rückgabe:
;               ***   DLINE_FLAGS - Status-Register
;               ***   R5          - DeltaX
;               ***   R6          - DeltaY
;               ***   R7          - Fehler-Register
;               ***
;               *** Bugs:
;               ***   Fehlerregister hat ein Bit zu wenig, um
;               ***   DeltaY-Werte > 127 zu verarbeiten
;               ***   Reicht aber für unsere Zwecke
;               **********************************************
		
DrawLine:       mov DLINE_FLAGS,#0          ; Status initialisieren

;               *** DAC initialisieren, wenn Strahl aus ist
                jnb P3.7,DrawLine_DLT
                mov P1,r1                    ; DAC 1 aktualisieren
                clr P3.5
                clr P3.4
                setb P3.4
                mov a,r2                    ; DAC 2 aktualisieren
                xrl a,#0ffh
                mov P1,a
                setb P3.5
                clr P3.4
                setb P3.4
                mov R7,#BEAM_ON_DLY         ; Verzögerung, um Schlieren zu
DrawLine_IDL:   djnz R7,DrawLine_IDL        ; vermeiden

;               *** Deltas berechnen
DrawLine_DLT:   clr C                       ; deltaX berechnen
                mov A,R1
                subb A,R3
                jnc DrawLine_DXC
                dec A
                xrl A,#0FFh
DrawLine_DXC:   mov R5,A
                clr C                       ; deltaY berechnen
                mov A,R2
                subb A,R4
                jnc DrawLine_DYC
                dec A
                xrl A,#0FFh
DrawLine_DYC:   mov R6,A

;               *** X- und Y-Werte tauschen, wenn erforderlich
                clr C                       ; deltaX muß > deltaY sein
                mov A,R5                    ; wenn doch, X- und Y-Werte tauschen
                subb A,R6
                jnc DrawLine_DIR
                setb DLINE_F_SWXY
                mov A,R1
                xch A,R2
                mov R1,A
                mov A,R3
                xch A,R4
                mov R3,A
                mov A,R5
                xch A,R6
                mov R5,A

;               *** Richtungen ermitteln
DrawLine_DIR:   clr C                       ; X-Richtung ermitteln
                mov A,R3
                subb A,R1
                mov DLINE_F_XDIR,C
                clr C                       ; Y-Richtung ermitteln
                mov A,R4
                subb A,R2
                mov DLINE_F_YDIR,C

;               *** Flags setzen
                mov R7,#0                   ; Fehler-Register initialisieren
                clr P3.7                    ; Strahl an, wenn aus war

;               *** DAC aktualisieren
DrawLineLoop:   mov C,DLINE_F_SWXY          ; Swaping von X/Y berücksichtigen
                mov a,r1                    ; DAC 1 aktualisieren
		jnc noInvert1
		xrl a,#0ffh
noInvert1:	mov P1,a
                mov P3.5,C
                clr P3.4
                setb P3.4
                cpl C                       ; anderen DAC wählen
                mov a,r2                    ; DAC 2 aktualisieren
		jnc noInvert2
		xrl a,#0ffh
noInvert2:	mov P1,a
                mov P3.5,C
                clr P3.4
                setb P3.4
;               -----------------------------------------------------------------------------
                MOV   B,#DRAW_DLY              ; ins Draw delay
DrawLine_IDL2:  
                DJNZ  B,DrawLine_IDL2         
;               -----------------------------------------------------------------------------

;               *** prüfen, ob Ziel erreicht
                mov A,R1
                cjne A,DLINE_R3,DrawLine_Err
                jnb DLINE_F_SWXY,DrawLine_Out
                mov A,R1                    ;ggf. X- und Y-Wert zurücktauschen
                xch A,R2
                mov R1,A
                ajmp DrawLine_Out

;               *** Fehler aktualisieren
DrawLine_Err:   mov A,R7
                add A,R6
                mov R7,A
                jnc DrawLine_ChkY
                clr DLINE_F_ENEG

;               *** Wenn Fehler zu groß, einen Schritt in Y-Richtung
DrawLine_ChkY:  jb DLINE_F_ENEG,DrawLine_IncX
                mov A,R5
                setb C
                subb A,R7
                jc DrawLine_IncY
                subb A,R7
                jc DrawLine_IncY
                ajmp DrawLine_IncX
DrawLine_IncY:  mov A,R7                    ; Fehler und Y-Wert aktualisieren
                clr C
                subb A,R5
                mov R7,A
                mov DLINE_F_ENEG,C
                jb DLINE_F_YDIR,DrawLine_IncYN
                inc R2
                ajmp DrawLine_IncX
DrawLine_IncYN: dec R2

;               *** X-Wert aktualisieren
DrawLine_IncX:  jb DLINE_F_XDIR,DrawLine_IncXN
                inc R1
                ajmp DrawLineLoop
DrawLine_IncXN: dec R1
                ajmp DrawLineLoop

DrawLine_Out:   ret

;               **********************************************
;               *** Tabelle für DCF77-Decodierer
;               ***
;               *** Satzaufbau:
;               ***  1. Bitmaske für Flags
;               ***  2. Adresse für Wertmerker
;               ***  3. Wert bei gesetztem Bit
;               ***
;               *** Flag-Bits:
;               ***  0 - Empfangendes Bit muß 0 sein
;               ***  1 - Wertmerker vor Addition zurücksetzen
;               ***  2 - Aktuellen Wert auf Wertmerker addieren
;               ***  3 - Paritybit zurücksetzen
;               ***  4 - Paritybit mit empfangenen Bit vergleichen
;               ***  5 - Empfangendes Bit muß 1 sein
;               **********************************************

DCF_Tab:        .db 00000001b,0,0           ; DCF-Sekunde 0  (Start, Immer 0)
                .db 00000000b,0,0           ; DCF-Sekunde 1
                .db 00000000b,0,0           ; DCF-Sekunde 2
                .db 00000000b,0,0           ; DCF-Sekunde 3
                .db 00000000b,0,0           ; DCF-Sekunde 4
                .db 00000000b,0,0           ; DCF-Sekunde 5
                .db 00000000b,0,0           ; DCF-Sekunde 6
                .db 00000000b,0,0           ; DCF-Sekunde 7
                .db 00000000b,0,0           ; DCF-Sekunde 8
                .db 00000000b,0,0           ; DCF-Sekunde 9
                .db 00000000b,0,0           ; DCF-Sekunde 10
                .db 00000000b,0,0           ; DCF-Sekunde 11
                .db 00000000b,0,0           ; DCF-Sekunde 12
                .db 00000000b,0,0           ; DCF-Sekunde 13
                .db 00000000b,0,0           ; DCF-Sekunde 14
                .db 00000000b,0,0           ; DCF-Sekunde 15 (Reserveantenne aktiv)
                .db 00000000b,0,0           ; DCF-Sekunde 16 (Umstellung Sommer/Winterzeit)
                .db 00000000b,0,0           ; DCF-Sekunde 17 (Sommerzeit aktiv)
                .db 00000000b,0,0           ; DCF-Sekunde 18 (Winterzeit aktiv)
                .db 00000000b,0,0           ; DCF-Sekunde 19 (Ankündigung Schaltsekunde)
                .db 00100000b,0,0           ; DCF-Sekunde 20 (Zeitbeginn, immer 1)

                .db 00001110b,DCF_MIN,1     ; DCF-Sekunde 21 (Start Minuten)
                .db 00000100b,DCF_MIN,2     ; DCF-Sekunde 22
                .db 00000100b,DCF_MIN,4     ; DCF-Sekunde 23
                .db 00000100b,DCF_MIN,8     ; DCF-Sekunde 24
                .db 00000100b,DCF_MIN,10    ; DCF-Sekunde 25
                .db 00000100b,DCF_MIN,20    ; DCF-Sekunde 26
                .db 00000100b,DCF_MIN,40    ; DCF-Sekunde 27
                .db 00010000b,0,0           ; DCF-Sekunde 28 (Parity Minuten)

                .db 00001110b,DCF_HR,1      ; DCF-Sekunde 29 (Start Stunden)
                .db 00000100b,DCF_HR,2      ; DCF-Sekunde 30
                .db 00000100b,DCF_HR,4      ; DCF-Sekunde 31
                .db 00000100b,DCF_HR,8      ; DCF-Sekunde 32
                .db 00000100b,DCF_HR,10     ; DCF-Sekunde 33
                .db 00000100b,DCF_HR,20     ; DCF-Sekunde 34
                .db 00010000b,0,0           ; DCF-Sekunde 35 (Parity Stunden)

                .db 00001110b,DCF_DAY,1     ; DCF-Sekunde 36 (Start Tag)
                .db 00000100b,DCF_DAY,2     ; DCF-Sekunde 37
                .db 00000100b,DCF_DAY,4     ; DCF-Sekunde 38
                .db 00000100b,DCF_DAY,8     ; DCF-Sekunde 39
                .db 00000100b,DCF_DAY,10    ; DCF-Sekunde 40
                .db 00000100b,DCF_DAY,20    ; DCF-Sekunde 41
                .db 00000110b,DCF_DOW,1     ; DCF-Sekunde 42 (Start Wochentag)
                .db 00000100b,DCF_DOW,2     ; DCF-Sekunde 43
                .db 00000100b,DCF_DOW,4     ; DCF-Sekunde 44
                .db 00000110b,DCF_MON,1     ; DCF-Sekunde 45 (Start Monat)
                .db 00000100b,DCF_MON,2     ; DCF-Sekunde 46
                .db 00000100b,DCF_MON,4     ; DCF-Sekunde 47
                .db 00000100b,DCF_MON,8     ; DCF-Sekunde 48
                .db 00000100b,DCF_MON,10    ; DCF-Sekunde 49
                .db 00000110b,DCF_YR,1      ; DCF-Sekunde 50 (Start Jahr)
                .db 00000100b,DCF_YR,2      ; DCF-Sekunde 51
                .db 00000100b,DCF_YR,4      ; DCF-Sekunde 52
                .db 00000100b,DCF_YR,8      ; DCF-Sekunde 53
                .db 00000100b,DCF_YR,10     ; DCF-Sekunde 54
                .db 00000100b,DCF_YR,20     ; DCF-Sekunde 55
                .db 00000100b,DCF_YR,40     ; DCF-Sekunde 56
                .db 00000100b,DCF_YR,80     ; DCF-Sekunde 57
                .db 00010000b,0,0           ; DCF-Sekunde 58 (Parity Datum)
                .db 00000000b,0,0           ; DCF-Sekunde 59 (Sync-Pause)

;               **********************************************
;               *** Tabelle für DCF77-Bereichsprüfung
;               ***
;               *** Satzaufbau:
;               ***  1. Adresse für Wertmerker
;               ***  2. Minimalwert
;               ***  3. Maximalwert
;               **********************************************

DCF_ValCheck:   .db DCF_MIN,0,59
                .db DCF_HR,0,23
                .db DCF_DAY,1,31
                .db DCF_DOW,1,7
                .db DCF_MON,1,12
                .db DCF_YR,0,99
