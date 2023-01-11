
_main:

;LED_BUTTON.c,11 :: 		void main()
;LED_BUTTON.c,13 :: 		TRISA  =0xFF;         //RA 0 giriþ olarak verdýk
	MOVLW       255
	MOVWF       TRISA+0 
;LED_BUTTON.c,14 :: 		TRISE =0x00;
	CLRF        TRISE+0 
;LED_BUTTON.c,16 :: 		LATA= 0x00;
	CLRF        LATA+0 
;LED_BUTTON.c,17 :: 		LATE=0x00;
	CLRF        LATE+0 
;LED_BUTTON.c,19 :: 		ADCON1 = 0xFF; //burada analog bir deðeri digital olarak kullanacaðýz bu yüzden ADCON kontrol registerýmýzýn bütün bitlerini 1 yaptýk
	MOVLW       255
	MOVWF       ADCON1+0 
;LED_BUTTON.c,22 :: 		while(1)
L_main0:
;LED_BUTTON.c,24 :: 		if(button) {
	BTFSS       RA0_bit+0, BitPos(RA0_bit+0) 
	GOTO        L_main2
;LED_BUTTON.c,25 :: 		LEDR= 1; LEDG = 1; LEDB =1; //burada butona her bastýgýmýda E portunda 1 birim kayacak yani diðer ledleri de yakacak
	BSF         LATE0_bit+0, BitPos(LATE0_bit+0) 
	BSF         LATE1_bit+0, BitPos(LATE1_bit+0) 
	BSF         LATE2_bit+0, BitPos(LATE2_bit+0) 
;LED_BUTTON.c,26 :: 		wait();
	CALL        _wait+0, 0
;LED_BUTTON.c,27 :: 		}
	GOTO        L_main3
L_main2:
;LED_BUTTON.c,28 :: 		else  if(!button){
	BTFSC       RA0_bit+0, BitPos(RA0_bit+0) 
	GOTO        L_main4
;LED_BUTTON.c,29 :: 		LEDR = 0; LEDG = 0; LEDB = 0; // E portunun pinlerini 1 birim sola kaydýr
	BCF         LATE0_bit+0, BitPos(LATE0_bit+0) 
	BCF         LATE1_bit+0, BitPos(LATE1_bit+0) 
	BCF         LATE2_bit+0, BitPos(LATE2_bit+0) 
;LED_BUTTON.c,30 :: 		wait();
	CALL        _wait+0, 0
;LED_BUTTON.c,31 :: 		}
L_main4:
L_main3:
;LED_BUTTON.c,34 :: 		}
	GOTO        L_main0
;LED_BUTTON.c,36 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_wait:

;LED_BUTTON.c,38 :: 		void wait()
;LED_BUTTON.c,40 :: 		delay_ms(20);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_wait5:
	DECFSZ      R13, 1, 1
	BRA         L_wait5
	DECFSZ      R12, 1, 1
	BRA         L_wait5
	DECFSZ      R11, 1, 1
	BRA         L_wait5
;LED_BUTTON.c,41 :: 		}
L_end_wait:
	RETURN      0
; end of _wait
