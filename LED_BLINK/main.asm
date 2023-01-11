
_main:

;main.c,12 :: 		void main()
;main.c,14 :: 		TRISA  = 0b00000000;   //Bu kýsým denetleyici üzerindeki LED leri çalýþtýrmak içindir
	CLRF        TRISA+0 
;main.c,15 :: 		TRISE  = 0x00; // buradada hepsini çýkýþ veridk
	CLRF        TRISE+0 
;main.c,18 :: 		LATA = 0x00;
	CLRF        LATA+0 
;main.c,19 :: 		LATE = 0x00;
	CLRF        LATE+0 
;main.c,22 :: 		while(1)
L_main0:
;main.c,24 :: 		LED =! LED; delay_ms(500);
	BTG         LATA4_bit+0, BitPos(LATA4_bit+0) 
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;main.c,25 :: 		LED_An();
	CALL        _LED_An+0, 0
;main.c,28 :: 		}
	GOTO        L_main0
;main.c,29 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_LED_An:

;main.c,31 :: 		void LED_An(void)
;main.c,33 :: 		LEDR =! LEDR; delay_ms(500);
	BTG         LATE0_bit+0, BitPos(LATE0_bit+0) 
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_LED_An3:
	DECFSZ      R13, 1, 1
	BRA         L_LED_An3
	DECFSZ      R12, 1, 1
	BRA         L_LED_An3
	DECFSZ      R11, 1, 1
	BRA         L_LED_An3
	NOP
;main.c,34 :: 		LEDG =! LEDG ;delay_ms(500);
	BTG         LATE1_bit+0, BitPos(LATE1_bit+0) 
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_LED_An4:
	DECFSZ      R13, 1, 1
	BRA         L_LED_An4
	DECFSZ      R12, 1, 1
	BRA         L_LED_An4
	DECFSZ      R11, 1, 1
	BRA         L_LED_An4
	NOP
;main.c,35 :: 		LEDB =! LEDB ;delay_ms(500);
	BTG         LATE2_bit+0, BitPos(LATE2_bit+0) 
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_LED_An5:
	DECFSZ      R13, 1, 1
	BRA         L_LED_An5
	DECFSZ      R12, 1, 1
	BRA         L_LED_An5
	DECFSZ      R11, 1, 1
	BRA         L_LED_An5
	NOP
;main.c,36 :: 		}
L_end_LED_An:
	RETURN      0
; end of _LED_An
