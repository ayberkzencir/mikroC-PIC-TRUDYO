#line 1 "C:/Users/agart/OneDrive/Belgeler/GitHub/mikroC-PIC-TRUDYO/LED_BUTTON1/LED_BUTTON.c"

sbit LEDR at LATE0_bit;
sbit LEDB at LATE1_bit;
sbit LEDG at LATE2_bit;


sbit button at RB0_bit;

void ButtonState();
void Wait();

void main()
{
 TRISE = 0x00;
 TRISB = 0x01;

 LATE = 0x00;
 LATB =0x00;

 ADCON0 = 0xFF ;


 while(1)
 {
 ButtonState();
 }


}
void ButtonState()
{
 switch(button)
 {
 case 1:
 LEDR =!LEDR;
 Wait();
 LEDB = !LEDB;
 Wait();
 LEDG = !LEDG;
 Wait();
 case 0:
 LEDR = 0;
 LEDB = 0;
 LEDG = 0;

 }
}
void Wait()
{
 delay_ms(500);
}
