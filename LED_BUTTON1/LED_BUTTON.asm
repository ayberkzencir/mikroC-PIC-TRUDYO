
_main:

;LED_BUTTON.c,12 :: 		void main()
;LED_BUTTON.c,14 :: 		TRISE = 0x00;
	CLRF        TRISE+0 
;LED_BUTTON.c,15 :: 		TRISB = 0x01; //0b00000001 RB0 a giriþ verdik
	MOVLW       1
	MOVWF       TRISB+0 
;LED_BUTTON.c,17 :: 		LATE = 0x00;
	CLRF        LATE+0 
;LED_BUTTON.c,18 :: 		LATB =0x00;
	CLRF        LATB+0 
;LED_BUTTON.c,20 :: 		ADCON0 = 0xFF ; //ADCON registerýmýzý aktif ettik analog sensörleri kullanýrken bu registerýmýzý aktif etmemiz gerekmektedir.   RB0 0 pinimizin A12 analog 12 bitini aktif etmek gerekiyor ama biz tüm ADCON bitlerini aktif ettik
	MOVLW       255
	MOVWF       ADCON0+0 
;LED_BUTTON.c,23 :: 		while(1)
L_main0:
;LED_BUTTON.c,25 :: 		ButtonState();
	CALL        _ButtonState+0, 0
;LED_BUTTON.c,26 :: 		}
	GOTO        L_main0
;LED_BUTTON.c,29 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_ButtonState:

;LED_BUTTON.c,30 :: 		void ButtonState()
;LED_BUTTON.c,32 :: 		switch(button)
	GOTO        L_ButtonState2
;LED_BUTTON.c,34 :: 		case 1:
L_ButtonState4:
;LED_BUTTON.c,35 :: 		LEDR =!LEDR;
	BTG         LATE0_bit+0, BitPos(LATE0_bit+0) 
;LED_BUTTON.c,36 :: 		Wait();
	CALL        _Wait+0, 0
;LED_BUTTON.c,37 :: 		LEDB = !LEDB;
	BTG         LATE1_bit+0, BitPos(LATE1_bit+0) 
;LED_BUTTON.c,38 :: 		Wait();
	CALL        _Wait+0, 0
;LED_BUTTON.c,39 :: 		LEDG = !LEDG;
	BTG         LATE2_bit+0, BitPos(LATE2_bit+0) 
;LED_BUTTON.c,40 :: 		Wait();
	CALL        _Wait+0, 0
;LED_BUTTON.c,41 :: 		case 0:
L_ButtonState5:
;LED_BUTTON.c,42 :: 		LEDR = 0;
	BCF         LATE0_bit+0, BitPos(LATE0_bit+0) 
;LED_BUTTON.c,43 :: 		LEDB = 0;
	BCF         LATE1_bit+0, BitPos(LATE1_bit+0) 
;LED_BUTTON.c,44 :: 		LEDG = 0;
	BCF         LATE2_bit+0, BitPos(LATE2_bit+0) 
;LED_BUTTON.c,46 :: 		}
	GOTO        L_ButtonState3
L_ButtonState2:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_ButtonState4
	BTFSS       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_ButtonState5
L_ButtonState3:
;LED_BUTTON.c,47 :: 		}
L_end_ButtonState:
	RETURN      0
; end of _ButtonState

_Wait:

;LED_BUTTON.c,48 :: 		void Wait()
;LED_BUTTON.c,50 :: 		delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_Wait6:
	DECFSZ      R13, 1, 1
	BRA         L_Wait6
	DECFSZ      R12, 1, 1
	BRA         L_Wait6
	DECFSZ      R11, 1, 1
	BRA         L_Wait6
	NOP
;LED_BUTTON.c,51 :: 		}
L_end_Wait:
	RETURN      0
; end of _Wait
