
_main:

;main.c,5 :: 		void main()
;main.c,7 :: 		TRISA = 0b00000000;   //Bu kýsým denetleyici üzerindeki LED leri çalýþtýrmak içindir
	CLRF        TRISA+0 
;main.c,8 :: 		LATA = 0x00;
	CLRF        LATA+0 
;main.c,10 :: 		while(1)
L_main0:
;main.c,12 :: 		LED = !LED ; delay_ms(200);           //burada kodlama mantýðý eðer lED 1 ise 0 a 0 ise 1 eþitleyecek ve bunu her 200ms de bir yapacak
	BTG         LATA4_bit+0, BitPos(LATA4_bit+0) 
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;main.c,14 :: 		}
	GOTO        L_main0
;main.c,15 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
