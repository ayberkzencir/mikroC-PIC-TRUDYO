#line 1 "C:/Users/agart/OneDrive/Belgeler/GitHub/mikroC-PIC-TRUDYO/LED_BLINK/main.c"


 sbit LED at LATA4_bit;

 sbit LEDR at LATE0_bit;
 sbit LEDG at LATE1_bit;
 sbit LEDB at LATE2_bit;


void LED_An();

void main()
{
 TRISA = 0b00000000;
 TRISE = 0x00;


 LATA = 0x00;
 LATE = 0x00;


 while(1)
 {
 LED =! LED; delay_ms(500);
 LED_An();


 }
 }

 void LED_An(void)
 {
 LEDR =! LEDR; delay_ms(500);
 LEDG =! LEDG ;delay_ms(500);
 LEDB =! LEDB ;delay_ms(500);
 }
