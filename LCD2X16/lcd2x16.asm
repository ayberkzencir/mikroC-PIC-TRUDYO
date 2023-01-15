
_Delay2s:

;lcd2x16.c,26 :: 		void Delay2s(){                         // 2 seconds delay function
;lcd2x16.c,27 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_Delay2s0:
	DECFSZ      R13, 1, 1
	BRA         L_Delay2s0
	DECFSZ      R12, 1, 1
	BRA         L_Delay2s0
	DECFSZ      R11, 1, 1
	BRA         L_Delay2s0
	NOP
	NOP
;lcd2x16.c,28 :: 		}
L_end_Delay2s:
	RETURN      0
; end of _Delay2s

_main:

;lcd2x16.c,30 :: 		void main() {
;lcd2x16.c,35 :: 		ANSELE  = 0;                             // Configure AN pins as digital
	CLRF        ANSELE+0 
;lcd2x16.c,36 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;lcd2x16.c,37 :: 		C1ON_bit = 0;                           // Disable comparators
	BCF         C1ON_bit+0, BitPos(C1ON_bit+0) 
;lcd2x16.c,38 :: 		C2ON_bit = 0;
	BCF         C2ON_bit+0, BitPos(C2ON_bit+0) 
;lcd2x16.c,41 :: 		SPI1_Init();                                      // Initialize SPI module used with PortExpander
	CALL        _SPI1_Init+0, 0
;lcd2x16.c,46 :: 		SPI_Glcd_Init(0);                                // Initialize Glcd via SPI
	CLRF        FARG_SPI_Glcd_Init_DeviceAddress+0 
	CALL        _SPI_Glcd_Init+0, 0
;lcd2x16.c,47 :: 		SPI_Glcd_Fill(0x00);                             // Clear Glcd
	CLRF        FARG_SPI_Glcd_Fill_pattern+0 
	CALL        _SPI_Glcd_Fill+0, 0
;lcd2x16.c,49 :: 		while(1) {
L_main1:
;lcd2x16.c,51 :: 		SPI_Glcd_Image(truck);                   // Draw image
	MOVLW       _truck+0
	MOVWF       FARG_SPI_Glcd_Image_image+0 
	MOVLW       hi_addr(_truck+0)
	MOVWF       FARG_SPI_Glcd_Image_image+1 
	MOVLW       higher_addr(_truck+0)
	MOVWF       FARG_SPI_Glcd_Image_image+2 
	CALL        _SPI_Glcd_Image+0, 0
;lcd2x16.c,52 :: 		Delay2s(); Delay2s();
	CALL        _Delay2s+0, 0
	CALL        _Delay2s+0, 0
;lcd2x16.c,54 :: 		SPI_Glcd_Fill(0x00);                           // Clear Glcd
	CLRF        FARG_SPI_Glcd_Fill_pattern+0 
	CALL        _SPI_Glcd_Fill+0, 0
;lcd2x16.c,57 :: 		SPI_Glcd_Box(62,40,124,56,1);                  // Draw box
	MOVLW       62
	MOVWF       FARG_SPI_Glcd_Box_x_upper_left+0 
	MOVLW       40
	MOVWF       FARG_SPI_Glcd_Box_y_upper_left+0 
	MOVLW       124
	MOVWF       FARG_SPI_Glcd_Box_x_bottom_right+0 
	MOVLW       56
	MOVWF       FARG_SPI_Glcd_Box_y_bottom_right+0 
	MOVLW       1
	MOVWF       FARG_SPI_Glcd_Box_color+0 
	CALL        _SPI_Glcd_Box+0, 0
;lcd2x16.c,58 :: 		SPI_Glcd_Rectangle(5,5,84,35,1);               // Draw rectangle
	MOVLW       5
	MOVWF       FARG_SPI_Glcd_Rectangle_x_upper_left+0 
	MOVLW       5
	MOVWF       FARG_SPI_Glcd_Rectangle_y_upper_left+0 
	MOVLW       84
	MOVWF       FARG_SPI_Glcd_Rectangle_x_bottom_right+0 
	MOVLW       35
	MOVWF       FARG_SPI_Glcd_Rectangle_y_bottom_right+0 
	MOVLW       1
	MOVWF       FARG_SPI_Glcd_Rectangle_color+0 
	CALL        _SPI_Glcd_Rectangle+0, 0
;lcd2x16.c,59 :: 		SPI_Glcd_Line(0, 63, 127, 0,1);                // Draw line
	CLRF        FARG_SPI_Glcd_Line_x_start+0 
	CLRF        FARG_SPI_Glcd_Line_x_start+1 
	MOVLW       63
	MOVWF       FARG_SPI_Glcd_Line_y_start+0 
	MOVLW       0
	MOVWF       FARG_SPI_Glcd_Line_y_start+1 
	MOVLW       127
	MOVWF       FARG_SPI_Glcd_Line_x_end+0 
	MOVLW       0
	MOVWF       FARG_SPI_Glcd_Line_x_end+1 
	CLRF        FARG_SPI_Glcd_Line_y_end+0 
	CLRF        FARG_SPI_Glcd_Line_y_end+1 
	MOVLW       1
	MOVWF       FARG_SPI_Glcd_Line_color+0 
	CALL        _SPI_Glcd_Line+0, 0
;lcd2x16.c,60 :: 		Delay2s();
	CALL        _Delay2s+0, 0
;lcd2x16.c,62 :: 		for(counter = 5; counter < 60; counter+=5 ) {  // Draw horizontal and vertical line
	MOVLW       5
	MOVWF       main_counter_L0+0 
L_main3:
	MOVLW       60
	SUBWF       main_counter_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;lcd2x16.c,63 :: 		Delay_ms(250);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;lcd2x16.c,64 :: 		SPI_Glcd_V_Line(2, 54, counter, 1);
	MOVLW       2
	MOVWF       FARG_SPI_Glcd_V_Line_y_start+0 
	MOVLW       54
	MOVWF       FARG_SPI_Glcd_V_Line_y_end+0 
	MOVF        main_counter_L0+0, 0 
	MOVWF       FARG_SPI_Glcd_V_Line_x_pos+0 
	MOVLW       1
	MOVWF       FARG_SPI_Glcd_V_Line_color+0 
	CALL        _SPI_Glcd_V_Line+0, 0
;lcd2x16.c,65 :: 		SPI_Glcd_H_Line(2, 120, counter, 1);
	MOVLW       2
	MOVWF       FARG_SPI_Glcd_H_Line_x_start+0 
	MOVLW       120
	MOVWF       FARG_SPI_Glcd_H_Line_x_end+0 
	MOVF        main_counter_L0+0, 0 
	MOVWF       FARG_SPI_Glcd_H_Line_y_pos+0 
	MOVLW       1
	MOVWF       FARG_SPI_Glcd_H_Line_color+0 
	CALL        _SPI_Glcd_H_Line+0, 0
;lcd2x16.c,62 :: 		for(counter = 5; counter < 60; counter+=5 ) {  // Draw horizontal and vertical line
	MOVLW       5
	ADDWF       main_counter_L0+0, 1 
;lcd2x16.c,66 :: 		}
	GOTO        L_main3
L_main4:
;lcd2x16.c,67 :: 		Delay2s();
	CALL        _Delay2s+0, 0
;lcd2x16.c,70 :: 		SPI_Glcd_Fill(0x00);                                   // Clear Glcd
	CLRF        FARG_SPI_Glcd_Fill_pattern+0 
	CALL        _SPI_Glcd_Fill+0, 0
;lcd2x16.c,71 :: 		SPI_Glcd_Set_Font(Font_Glcd_Character8x7, 8, 8, 32);   // Choose font, see __Lib_GLCDFonts.c in Uses folder
	MOVLW       _Font_Glcd_Character8x7+0
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+0 
	MOVLW       hi_addr(_Font_Glcd_Character8x7+0)
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+1 
	MOVLW       higher_addr(_Font_Glcd_Character8x7+0)
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+2 
	MOVLW       8
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontWidth+0 
	MOVLW       8
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontHeight+0 
	MOVLW       32
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontOffs+0 
	MOVLW       0
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontOffs+1 
	CALL        _SPI_Glcd_Set_Font+0, 0
;lcd2x16.c,72 :: 		SPI_Glcd_Write_Text("mikroE", 5, 7, 2);                // Write string
	MOVLW       ?lstr1_lcd2x16+0
	MOVWF       FARG_SPI_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr1_lcd2x16+0)
	MOVWF       FARG_SPI_Glcd_Write_Text_text+1 
	MOVLW       5
	MOVWF       FARG_SPI_Glcd_Write_Text_x_pos+0 
	MOVLW       7
	MOVWF       FARG_SPI_Glcd_Write_Text_page_num+0 
	MOVLW       2
	MOVWF       FARG_SPI_Glcd_Write_Text_color+0 
	CALL        _SPI_Glcd_Write_Text+0, 0
;lcd2x16.c,75 :: 		for (counter = 1; counter <= 10; counter++)              // Draw circles
	MOVLW       1
	MOVWF       main_counter_L0+0 
L_main7:
	MOVF        main_counter_L0+0, 0 
	SUBLW       10
	BTFSS       STATUS+0, 0 
	GOTO        L_main8
;lcd2x16.c,76 :: 		SPI_Glcd_Circle(63,32, 3*counter, 1);
	MOVLW       63
	MOVWF       FARG_SPI_Glcd_Circle_x_center+0 
	MOVLW       0
	MOVWF       FARG_SPI_Glcd_Circle_x_center+1 
	MOVLW       32
	MOVWF       FARG_SPI_Glcd_Circle_y_center+0 
	MOVLW       0
	MOVWF       FARG_SPI_Glcd_Circle_y_center+1 
	MOVLW       3
	MULWF       main_counter_L0+0 
	MOVF        PRODL+0, 0 
	MOVWF       FARG_SPI_Glcd_Circle_radius+0 
	MOVF        PRODH+0, 0 
	MOVWF       FARG_SPI_Glcd_Circle_radius+1 
	MOVLW       1
	MOVWF       FARG_SPI_Glcd_Circle_color+0 
	CALL        _SPI_Glcd_Circle+0, 0
;lcd2x16.c,75 :: 		for (counter = 1; counter <= 10; counter++)              // Draw circles
	INCF        main_counter_L0+0, 1 
;lcd2x16.c,76 :: 		SPI_Glcd_Circle(63,32, 3*counter, 1);
	GOTO        L_main7
L_main8:
;lcd2x16.c,77 :: 		Delay2s();
	CALL        _Delay2s+0, 0
;lcd2x16.c,80 :: 		SPI_Glcd_Box(12,20, 70,63, 2);                         // Draw box
	MOVLW       12
	MOVWF       FARG_SPI_Glcd_Box_x_upper_left+0 
	MOVLW       20
	MOVWF       FARG_SPI_Glcd_Box_y_upper_left+0 
	MOVLW       70
	MOVWF       FARG_SPI_Glcd_Box_x_bottom_right+0 
	MOVLW       63
	MOVWF       FARG_SPI_Glcd_Box_y_bottom_right+0 
	MOVLW       2
	MOVWF       FARG_SPI_Glcd_Box_color+0 
	CALL        _SPI_Glcd_Box+0, 0
;lcd2x16.c,81 :: 		Delay2s();
	CALL        _Delay2s+0, 0
;lcd2x16.c,83 :: 		SPI_Glcd_Fill(0xFF);                                   // Fill Glcd
	MOVLW       255
	MOVWF       FARG_SPI_Glcd_Fill_pattern+0 
	CALL        _SPI_Glcd_Fill+0, 0
;lcd2x16.c,84 :: 		SPI_Glcd_Set_Font(Font_Glcd_Character8x7, 8, 7, 32);   // Change font
	MOVLW       _Font_Glcd_Character8x7+0
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+0 
	MOVLW       hi_addr(_Font_Glcd_Character8x7+0)
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+1 
	MOVLW       higher_addr(_Font_Glcd_Character8x7+0)
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+2 
	MOVLW       8
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontWidth+0 
	MOVLW       7
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontHeight+0 
	MOVLW       32
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontOffs+0 
	MOVLW       0
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontOffs+1 
	CALL        _SPI_Glcd_Set_Font+0, 0
;lcd2x16.c,85 :: 		someText = "8x7 Font";
	MOVLW       ?lstr2_lcd2x16+0
	MOVWF       main_someText_L0+0 
	MOVLW       hi_addr(?lstr2_lcd2x16+0)
	MOVWF       main_someText_L0+1 
;lcd2x16.c,86 :: 		SPI_Glcd_Write_Text(someText, 5, 1, 2);                // Write string
	MOVF        main_someText_L0+0, 0 
	MOVWF       FARG_SPI_Glcd_Write_Text_text+0 
	MOVF        main_someText_L0+1, 0 
	MOVWF       FARG_SPI_Glcd_Write_Text_text+1 
	MOVLW       5
	MOVWF       FARG_SPI_Glcd_Write_Text_x_pos+0 
	MOVLW       1
	MOVWF       FARG_SPI_Glcd_Write_Text_page_num+0 
	MOVLW       2
	MOVWF       FARG_SPI_Glcd_Write_Text_color+0 
	CALL        _SPI_Glcd_Write_Text+0, 0
;lcd2x16.c,87 :: 		Delay2s();
	CALL        _Delay2s+0, 0
;lcd2x16.c,89 :: 		SPI_Glcd_Set_Font(Font_Glcd_System3x5, 3, 5, 32);      // Change font
	MOVLW       _Font_Glcd_System3x5+0
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+0 
	MOVLW       hi_addr(_Font_Glcd_System3x5+0)
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+1 
	MOVLW       higher_addr(_Font_Glcd_System3x5+0)
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+2 
	MOVLW       3
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontWidth+0 
	MOVLW       5
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontHeight+0 
	MOVLW       32
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontOffs+0 
	MOVLW       0
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontOffs+1 
	CALL        _SPI_Glcd_Set_Font+0, 0
;lcd2x16.c,90 :: 		someText = "3X5 CAPITALS ONLY";
	MOVLW       ?lstr3_lcd2x16+0
	MOVWF       main_someText_L0+0 
	MOVLW       hi_addr(?lstr3_lcd2x16+0)
	MOVWF       main_someText_L0+1 
;lcd2x16.c,91 :: 		SPI_Glcd_Write_Text(someText, 5, 3, 2);                // Write string
	MOVF        main_someText_L0+0, 0 
	MOVWF       FARG_SPI_Glcd_Write_Text_text+0 
	MOVF        main_someText_L0+1, 0 
	MOVWF       FARG_SPI_Glcd_Write_Text_text+1 
	MOVLW       5
	MOVWF       FARG_SPI_Glcd_Write_Text_x_pos+0 
	MOVLW       3
	MOVWF       FARG_SPI_Glcd_Write_Text_page_num+0 
	MOVLW       2
	MOVWF       FARG_SPI_Glcd_Write_Text_color+0 
	CALL        _SPI_Glcd_Write_Text+0, 0
;lcd2x16.c,92 :: 		Delay2s();
	CALL        _Delay2s+0, 0
;lcd2x16.c,94 :: 		SPI_Glcd_Set_Font(Font_Glcd_System5x7, 5, 7, 32);      // Change font
	MOVLW       _Font_Glcd_System5x7+0
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+0 
	MOVLW       hi_addr(_Font_Glcd_System5x7+0)
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+1 
	MOVLW       higher_addr(_Font_Glcd_System5x7+0)
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+2 
	MOVLW       5
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontWidth+0 
	MOVLW       7
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontHeight+0 
	MOVLW       32
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontOffs+0 
	MOVLW       0
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontOffs+1 
	CALL        _SPI_Glcd_Set_Font+0, 0
;lcd2x16.c,95 :: 		someText = "5x7 Font";
	MOVLW       ?lstr4_lcd2x16+0
	MOVWF       main_someText_L0+0 
	MOVLW       hi_addr(?lstr4_lcd2x16+0)
	MOVWF       main_someText_L0+1 
;lcd2x16.c,96 :: 		SPI_Glcd_Write_Text(someText, 5, 5, 2);                // Write string
	MOVF        main_someText_L0+0, 0 
	MOVWF       FARG_SPI_Glcd_Write_Text_text+0 
	MOVF        main_someText_L0+1, 0 
	MOVWF       FARG_SPI_Glcd_Write_Text_text+1 
	MOVLW       5
	MOVWF       FARG_SPI_Glcd_Write_Text_x_pos+0 
	MOVLW       5
	MOVWF       FARG_SPI_Glcd_Write_Text_page_num+0 
	MOVLW       2
	MOVWF       FARG_SPI_Glcd_Write_Text_color+0 
	CALL        _SPI_Glcd_Write_Text+0, 0
;lcd2x16.c,97 :: 		Delay2s();
	CALL        _Delay2s+0, 0
;lcd2x16.c,99 :: 		SPI_Glcd_Set_Font(Font_Glcd_5x7, 5, 7, 32);            // Change font
	MOVLW       _Font_Glcd_5x7+0
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+0 
	MOVLW       hi_addr(_Font_Glcd_5x7+0)
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+1 
	MOVLW       higher_addr(_Font_Glcd_5x7+0)
	MOVWF       FARG_SPI_Glcd_Set_Font_activeFont+2 
	MOVLW       5
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontWidth+0 
	MOVLW       7
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontHeight+0 
	MOVLW       32
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontOffs+0 
	MOVLW       0
	MOVWF       FARG_SPI_Glcd_Set_Font_aFontOffs+1 
	CALL        _SPI_Glcd_Set_Font+0, 0
;lcd2x16.c,100 :: 		someText = "5x7 Font (v2)";
	MOVLW       ?lstr5_lcd2x16+0
	MOVWF       main_someText_L0+0 
	MOVLW       hi_addr(?lstr5_lcd2x16+0)
	MOVWF       main_someText_L0+1 
;lcd2x16.c,101 :: 		SPI_Glcd_Write_Text(someText, 5, 7, 2);                // Write string
	MOVF        main_someText_L0+0, 0 
	MOVWF       FARG_SPI_Glcd_Write_Text_text+0 
	MOVF        main_someText_L0+1, 0 
	MOVWF       FARG_SPI_Glcd_Write_Text_text+1 
	MOVLW       5
	MOVWF       FARG_SPI_Glcd_Write_Text_x_pos+0 
	MOVLW       7
	MOVWF       FARG_SPI_Glcd_Write_Text_page_num+0 
	MOVLW       2
	MOVWF       FARG_SPI_Glcd_Write_Text_color+0 
	CALL        _SPI_Glcd_Write_Text+0, 0
;lcd2x16.c,102 :: 		Delay2s();
	CALL        _Delay2s+0, 0
;lcd2x16.c,104 :: 		}
	GOTO        L_main1
;lcd2x16.c,105 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
