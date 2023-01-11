#line 1 "C:/Users/agart/OneDrive/Belgeler/GitHub/mikroC-PIC-TRUDYO/LED_BLINK/main.c"


 sbit LED at LATA4_bit;

void main()
{
 TRISA = 0b00000000;
 LATA = 0x00;

 while(1)
 {
 LED = !LED ; delay_ms(200);

 }
}
