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

;               **********************************************
;               *** Daten für Anzeige
;               **********************************************

ScaleData:      .db 116,032,122,026,122,044,000
                .db 131,029,134,026,140,026,143,029,143,032,131,044,143,044,000
                .db 134,215,131,212,125,212,122,215,122,227,125,230,131,230,134,227,134,224
                .db 131,221,125,221,122,224,000
                .db 214,122,217,119,223,119,226,122,226,125,223,128,226,131,226,134,223,137
                .db 217,137,214,134,000,217,128,223,128,000
                .db 029,134,032,137,038,137,041,134,041,122,038,119,032,119,029,122,029,125
                .db 032,128,038,128,041,125,000

                .db 108,178,108,176,112,176,112,178,108,178,000,108,182,108,184,112,184,112,182
                .db 108,182,000
                .db 144,178,144,176,148,176,148,178,144,178,000,144,182,144,184,148,184,148,182
                .db 144,182,000

                .db 128,002,128,022,000,141,002,140,007,000,154,004,153,009,000,166,008,165,012,000
                .db 179,012,177,017,000,191,018,186,027,000,202,026,199,030,000,212,034,208,038,000
                .db 221,043,217,047,000,229,053,225,056,000,237,065,228,070,000,243,076,238,078,000
                .db 247,089,243,090,000,251,101,246,102,000,253,114,248,115,000,253,128,233,128,000
                .db 253,141,248,140,000,251,154,246,153,000,247,166,243,165,000,243,179,238,177,000
                .db 237,191,228,186,000,229,202,225,199,000,221,212,217,208,000,212,221,208,217,000
                .db 202,229,199,225,000,191,237,186,228,000,179,243,177,238,000,166,247,165,243,000
                .db 154,251,153,246,000,141,253,140,248,000,127,253,127,233,000,114,253,115,248,000
                .db 101,251,102,246,000,089,247,090,243,000,076,243,078,238,000,065,237,070,228,000
                .db 053,229,056,225,000,043,221,047,217,000,034,212,038,208,000,026,202,030,199,000
                .db 018,190,027,185,000,012,179,017,177,000,008,166,012,165,000,004,154,009,153,000
                .db 002,141,007,140,000,002,127,022,127,000,002,114,007,115,000,004,101,009,102,000
                .db 008,089,012,090,000,012,076,017,078,000,018,065,027,070,000,026,053,030,056,000
                .db 034,043,038,047,000,043,034,047,038,000,053,026,056,030,000,064,018,069,027,000
                .db 076,012,078,017,000,089,008,090,012,000,101,004,102,009,000,114,002,115,007,255

SecPtrData:     .db 128,026,128,128,255,138,026,128,128,255,149,028,128,128,255,159,030,128,128,255
                .db 169,034,128,128,255,179,039,128,128,255,187,045,128,128,255,196,052,128,128,255
                .db 203,059,128,128,255,210,068,128,128,255,216,077,128,128,255,221,086,128,128,255
                .db 225,096,128,128,255,227,106,128,128,255,229,117,128,128,255,229,128,128,128,255
                .db 229,138,128,128,255,227,149,128,128,255,225,159,128,128,255,221,169,128,128,255
                .db 216,179,128,128,255,210,187,128,128,255,203,196,128,128,255,196,203,128,128,255
                .db 187,210,128,128,255,179,216,128,128,255,169,221,128,128,255,159,225,128,128,255
                .db 149,227,128,128,255,138,229,128,128,255,127,229,128,128,255,117,229,128,128,255
                .db 106,227,128,128,255,096,225,128,128,255,086,221,128,128,255,077,216,128,128,255
                .db 068,210,128,128,255,059,203,128,128,255,052,196,128,128,255,045,187,128,128,255
                .db 039,178,128,128,255,034,169,128,128,255,030,159,128,128,255,028,149,128,128,255
                .db 026,138,128,128,255,026,127,128,128,255,026,117,128,128,255,028,106,128,128,255
                .db 030,096,128,128,255,034,086,128,128,255,039,077,128,128,255,045,068,128,128,255
                .db 052,059,128,128,255,059,052,128,128,255,068,045,128,128,255,076,039,128,128,255
                .db 086,034,128,128,255,096,030,128,128,255,106,028,128,128,255,117,026,128,128,255

MinPtrData:     .db 138,127,128,026,118,127,138,127,255,137,129,138,026,118,126,137,129,255
                .db 137,130,149,028,118,125,137,130,255,137,131,159,030,118,124,137,131,255
                .db 137,132,169,034,118,123,137,132,255,136,133,179,039,119,122,136,133,255
                .db 136,133,187,045,119,122,136,133,255,135,134,196,052,120,121,135,134,255
                .db 134,135,203,059,121,120,134,135,255,133,136,210,068,122,119,133,136,255
                .db 132,136,216,077,123,119,132,136,255,132,137,221,086,123,118,132,137,255
                .db 131,137,225,096,124,118,131,137,255,130,137,227,106,125,118,130,137,255
                .db 129,137,229,117,126,118,129,137,255,127,137,229,128,128,118,127,137,255
                .db 126,137,229,138,129,118,126,137,255,125,137,227,149,130,118,125,137,255
                .db 124,137,225,159,131,118,124,137,255,123,137,221,169,132,118,123,137,255
                .db 122,136,216,179,133,119,122,136,255,122,136,210,187,133,119,122,136,255
                .db 121,135,203,196,134,120,121,135,255,120,134,196,203,135,121,120,134,255
                .db 119,133,187,210,136,122,119,133,255,119,133,179,216,136,122,119,133,255
                .db 118,132,169,221,137,123,118,132,255,118,131,159,225,137,124,118,131,255
                .db 118,130,149,227,137,125,118,130,255,118,129,138,229,137,126,118,129,255
                .db 118,127,127,229,137,128,118,127,255,118,126,117,229,137,129,118,126,255
                .db 118,125,106,227,137,130,118,125,255,118,124,096,225,137,131,118,124,255
                .db 118,123,086,221,137,132,118,123,255,119,123,077,216,136,132,119,123,255
                .db 119,122,068,210,136,133,119,122,255,120,121,059,203,135,134,120,121,255
                .db 121,120,052,196,134,135,121,120,255,122,119,045,187,133,136,122,119,255
                .db 123,119,039,178,132,136,123,119,255,123,118,034,169,132,137,123,118,255
                .db 124,118,030,159,131,137,124,118,255,125,118,028,149,130,137,125,118,255
                .db 126,118,026,138,129,137,126,118,255,128,118,026,127,127,137,128,118,255
                .db 129,118,026,117,126,137,129,118,255,130,118,028,106,125,137,130,118,255
                .db 131,118,030,096,124,137,131,118,255,132,118,034,086,123,137,132,118,255
                .db 132,119,039,077,123,136,132,119,255,133,119,045,068,122,136,133,119,255
                .db 134,120,052,059,121,135,134,120,255,135,121,059,052,120,134,135,121,255
                .db 136,122,068,045,119,133,136,122,255,136,122,076,039,119,133,136,122,255
                .db 137,123,086,034,118,132,137,123,255,137,124,096,030,118,131,137,124,255
                .db 137,125,106,028,118,130,137,125,255,137,126,117,026,118,129,137,126,255

HrPtrData:      .db 138,127,128,068,118,127,138,127,255,137,129,134,068,118,126,137,129,255
                .db 137,130,140,069,118,125,137,130,255,137,131,146,070,118,124,137,131,255
                .db 137,132,152,073,118,123,137,132,255,136,133,158,076,119,122,136,133,255
                .db 136,133,163,079,119,122,136,133,255,135,134,168,083,120,121,135,134,255
                .db 134,135,172,087,121,120,134,135,255,133,136,176,092,122,119,133,136,255
                .db 132,136,179,098,123,119,132,136,255,132,137,182,103,123,118,132,137,255
                .db 131,137,185,109,124,118,131,137,255,130,137,186,115,125,118,130,137,255
                .db 129,137,187,121,126,118,129,137,255,127,137,187,128,128,118,127,137,255
                .db 126,137,187,134,129,118,126,137,255,125,137,186,140,130,118,125,137,255
                .db 124,137,185,146,131,118,124,137,255,123,137,182,152,132,118,123,137,255
                .db 122,136,179,158,133,119,122,136,255,122,136,176,163,133,119,122,136,255
                .db 121,135,172,168,134,120,121,135,255,120,134,168,172,135,121,120,134,255
                .db 119,133,163,176,136,122,119,133,255,119,133,158,179,136,122,119,133,255
                .db 118,132,152,182,137,123,118,132,255,118,131,146,185,137,124,118,131,255
                .db 118,130,140,186,137,125,118,130,255,118,129,134,187,137,126,118,129,255
                .db 118,127,127,187,137,128,118,127,255,118,126,121,187,137,129,118,126,255
                .db 118,125,115,186,137,130,118,125,255,118,124,109,185,137,131,118,124,255
                .db 118,123,103,182,137,132,118,123,255,119,123,098,179,136,132,119,123,255
                .db 119,122,092,176,136,133,119,122,255,120,121,087,172,135,134,120,121,255
                .db 121,120,083,168,134,135,121,120,255,122,119,079,163,133,136,122,119,255
                .db 123,119,076,157,132,136,123,119,255,123,118,073,152,132,137,123,118,255
                .db 124,118,070,146,131,137,124,118,255,125,118,069,140,130,137,125,118,255
                .db 126,118,068,134,129,137,126,118,255,128,118,068,127,127,137,128,118,255
                .db 129,118,068,121,126,137,129,118,255,130,118,069,115,125,137,130,118,255
                .db 131,118,070,109,124,137,131,118,255,132,118,073,103,123,137,132,118,255
                .db 132,119,076,098,123,136,132,119,255,133,119,079,092,122,136,133,119,255
                .db 134,120,083,087,121,135,134,120,255,135,121,087,083,120,134,135,121,255
                .db 136,122,092,079,119,133,136,122,255,136,122,097,076,119,133,136,122,255
                .db 137,123,103,073,118,132,137,123,255,137,124,109,070,118,131,137,124,255
                .db 137,125,115,069,118,130,137,125,255,137,126,121,068,118,129,137,126,255

NumSecOnes:     .dw NumSecOnes0,NumSecOnes1,NumSecOnes2,NumSecOnes3,NumSecOnes4
                .dw NumSecOnes5,NumSecOnes6,NumSecOnes7,NumSecOnes8,NumSecOnes9
NumSecOnes0:    .db 166,176,168,174,172,174,174,176,174,184,172,186,168,186,166,184,166,176
                .db 255
NumSecOnes1:    .db 168,178,172,174,172,186,255
NumSecOnes2:    .db 166,176,168,174,172,174,174,176,174,178,166,186,174,186,255
NumSecOnes3:    .db 166,176,168,174,172,174,174,176,174,178,172,180,174,182,174,184,172,186
                .db 168,186,166,184,000,168,180,172,180,255
NumSecOnes4:    .db 174,180,166,180,172,174,172,186,255
NumSecOnes5:    .db 174,174,166,174,166,182,168,180,172,180,174,182,174,184,172,186,168,186
                .db 166,184,255
NumSecOnes6:    .db 174,176,172,174,168,174,166,176,166,184,168,186,172,186,174,184,174,182
                .db 172,180,168,180,166,182,255
NumSecOnes7:    .db 166,174,174,174,174,176,170,180,170,186,255
NumSecOnes8:    .db 168,180,166,178,166,176,168,174,172,174,174,176,174,178,172,180,168,180
                .db 166,182,166,184,168,186,172,186,174,184,174,182,172,180,255
NumSecOnes9:    .db 166,184,168,186,172,186,174,184,174,176,172,174,168,174,166,176,166,178
                .db 168,180,172,180,174,178,255

NumSecTens:     .dw NumSecTens0,NumSecTens1,NumSecTens2,NumSecTens3,NumSecTens4,NumSecTens5
NumSecTens0:    .db 154,176,156,174,160,174,162,176,162,184,160,186,156,186,154,184,154,176
                .db 255
NumSecTens1:    .db 156,178,160,174,160,186,255
NumSecTens2:    .db 154,176,156,174,160,174,162,176,162,178,154,186,162,186,255
NumSecTens3:    .db 154,176,156,174,160,174,162,176,162,178,160,180,162,182,162,184,160,186
                .db 156,186,154,184,000,156,180,160,180,255
NumSecTens4:    .db 162,180,154,180,160,174,160,186,255
NumSecTens5:    .db 162,174,154,174,154,182,156,180,160,180,162,182,162,184,160,186,156,186
                .db 154,184,255

NumMinOnes:     .dw NumMinOnes0,NumMinOnes1,NumMinOnes2,NumMinOnes3,NumMinOnes4
                .dw NumMinOnes5,NumMinOnes6,NumMinOnes7,NumMinOnes8,NumMinOnes9
NumMinOnes0:    .db 130,176,132,174,136,174,138,176,138,184,136,186,132,186,130,184,130,176
                .db 255
NumMinOnes1:    .db 132,178,136,174,136,186,255
NumMinOnes2:    .db 130,176,132,174,136,174,138,176,138,178,130,186,138,186,255
NumMinOnes3:    .db 130,176,132,174,136,174,138,176,138,178,136,180,138,182,138,184,136,186
                .db 132,186,130,184,000,132,180,136,180,255
NumMinOnes4:    .db 138,180,130,180,136,174,136,186,255
NumMinOnes5:    .db 138,174,130,174,130,182,132,180,136,180,138,182,138,184,136,186,132,186
                .db 130,184,255
NumMinOnes6:    .db 138,176,136,174,132,174,130,176,130,184,132,186,136,186,138,184,138,182
                .db 136,180,132,180,130,182,255
NumMinOnes7:    .db 130,174,138,174,138,176,134,180,134,186,255
NumMinOnes8:    .db 132,180,130,178,130,176,132,174,136,174,138,176,138,178,136,180,132,180
                .db 130,182,130,184,132,186,136,186,138,184,138,182,136,180,255
NumMinOnes9:    .db 130,184,132,186,136,186,138,184,138,176,136,174,132,174,130,176,130,178
                .db 132,180,136,180,138,178,255

NumMinTens:     .dw NumMinTens0,NumMinTens1,NumMinTens2,NumMinTens3,NumMinTens4,NumMinTens5
NumMinTens0:    .db 118,176,120,174,124,174,126,176,126,184,124,186,120,186,118,184,118,176
                .db 255
NumMinTens1:    .db 120,178,124,174,124,186,255
NumMinTens2:    .db 118,176,120,174,124,174,126,176,126,178,118,186,126,186,255
NumMinTens3:    .db 118,176,120,174,124,174,126,176,126,178,124,180,126,182,126,184,124,186
                .db 120,186,118,184,000,120,180,124,180,255
NumMinTens4:    .db 126,180,118,180,124,174,124,186,255
NumMinTens5:    .db 126,174,118,174,118,182,120,180,124,180,126,182,126,184,124,186,120,186
                .db 118,184,255

NumHrOnes:      .dw NumHrOnes0,NumHrOnes1,NumHrOnes2,NumHrOnes3,NumHrOnes4
                .dw NumHrOnes5,NumHrOnes6,NumHrOnes7,NumHrOnes8,NumHrOnes9
NumHrOnes0:     .db 094,176,096,174,100,174,102,176,102,184,100,186,096,186,094,184,094,176
                .db 255
NumHrOnes1:     .db 096,178,100,174,100,186,255
NumHrOnes2:     .db 094,176,096,174,100,174,102,176,102,178,094,186,102,186,255
NumHrOnes3:     .db 094,176,096,174,100,174,102,176,102,178,100,180,102,182,102,184,100,186
                .db 096,186,094,184,000,096,180,100,180,255
NumHrOnes4:     .db 102,180,094,180,100,174,100,186,255
NumHrOnes5:     .db 102,174,094,174,094,182,096,180,100,180,102,182,102,184,100,186,096,186
                .db 094,184,255
NumHrOnes6:     .db 102,176,100,174,096,174,094,176,094,184,096,186,100,186,102,184,102,182
                .db 100,180,096,180,094,182,255
NumHrOnes7:     .db 094,174,102,174,102,176,098,180,098,186,255
NumHrOnes8:     .db 096,180,094,178,094,176,096,174,100,174,102,176,102,178,100,180,096,180
                .db 094,182,094,184,096,186,100,186,102,184,102,182,100,180,255
NumHrOnes9:     .db 094,184,096,186,100,186,102,184,102,176,100,174,096,174,094,176,094,178
                .db 096,180,100,180,102,178,255

NumHrTens:      .dw NumHrTens0,NumHrTens1,NumHrTens2
NumHrTens0:     .db 082,176,084,174,088,174,090,176,090,184,088,186,084,186,082,184,082,176
                .db 255
NumHrTens1:     .db 084,178,088,174,088,186,255
NumHrTens2:     .db 082,176,084,174,088,174,090,176,090,178,082,186,090,186,255

DCFStats:      .dw DCFStat0,DCFStat1,DCFStat2
DCFStat0:       .db 122,076,125,073,131,079,134,076,255
DCFStat1:       .db 125,082,128,070,131,082,125,082,255
DCFStat2:       .db 125,082,128,070,131,082,125,082,000,125,076,122,073,122,070,125,067,131,067
                .db 134,070,134,073,131,076,255

