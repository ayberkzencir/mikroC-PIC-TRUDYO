
_main:

;LED_BUTTON.c,11 :: 		void main()
;LED_BUTTON.c,13 :: 		TRISE = 0x00;
	CLRF        TRISE+0 
;LED_BUTTON.c,14 :: 		TRISB = 0x01; //0b00000001 RB0 a giriþ verdik
	MOVLW       1
	MOVWF       TRISB+0 
;LED_BUTTON.c,16 :: 		LATE = 0x00;
	CLRF        LATE+0 
;LED_BUTTON.c,17 :: 		LATB =0x00;
	CLRF        LATB+0 
;LED_BUTTON.c,19 :: 		ADCON1 = 0xFF ; //ADCON registerýmýzý aktif ettik analog sensörleri kullanýrken bu registerýmýzý aktif etmemiz gerekmektedir.   RB0 0 pinimizin A12 analog 12 bitini aktif etmek gerekiyor ama biz tüm ADCON bitlerini aktif ettik
	MOVLW       255
	MOVWF       ADCON1+0 
;LED_BUTTON.c,22 :: 		while(1)
L_main0:
;LED_BUTTON.c,24 :: 		if(button == 1)
	BTFSS       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main2
;LED_BUTTON.c,25 :: 		LEDR = 1;
	BSF         LATE0_bit+0, BitPos(LATE0_bit+0) 
	GOTO        L_main3
L_main2:
;LED_BUTTON.c,27 :: 		LEDR = 0;
	BCF         LATE0_bit+0, BitPos(LATE0_bit+0) 
L_main3:
;LED_BUTTON.c,28 :: 		}
	GOTO        L_main0
;LED_BUTTON.c,31 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
