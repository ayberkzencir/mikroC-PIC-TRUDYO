
_main:

;main.c,12 :: 		void main()
;main.c,14 :: 		TRISA = 0b00000000;   //Bu kýsým denetleyici üzerindeki LED leri çalýþtýrmak içindir
	CLRF        TRISA+0 
;main.c,15 :: 		TRISE  =0x00; // buradada hepsini çýkýþ veridk
	CLRF        TRISE+0 
;main.c,18 :: 		LATA = 0x00;
	CLRF        LATA+0 
;main.c,19 :: 		LATE = 0x00;
	CLRF        LATE+0 
;main.c,22 :: 		while(1)
L_main0:
;main.c,24 :: 		LED =! LED; wait();
	BTG         LATA4_bit+0, BitPos(LATA4_bit+0) 
	CALL        _wait+0, 0
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
;main.c,33 :: 		LEDR =! LEDR; wait();
	BTG         LATE0_bit+0, BitPos(LATE0_bit+0) 
	CALL        _wait+0, 0
;main.c,34 :: 		LEDG =! LEDG; wait();
	BTG         LATE1_bit+0, BitPos(LATE1_bit+0) 
	CALL        _wait+0, 0
;main.c,35 :: 		LEDB =! LEDB; wait();
	BTG         LATE2_bit+0, BitPos(LATE2_bit+0) 
	CALL        _wait+0, 0
;main.c,37 :: 		}
L_end_LED_An:
	RETURN      0
; end of _LED_An

_wait:

;main.c,38 :: 		void wait(void)
;main.c,40 :: 		delay_ms(50);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_wait2:
	DECFSZ      R13, 1, 1
	BRA         L_wait2
	DECFSZ      R12, 1, 1
	BRA         L_wait2
	DECFSZ      R11, 1, 1
	BRA         L_wait2
	NOP
	NOP
;main.c,41 :: 		}
L_end_wait:
	RETURN      0
; end of _wait
