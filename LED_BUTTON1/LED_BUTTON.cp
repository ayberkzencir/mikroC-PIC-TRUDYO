#line 1 "C:/Users/agart/OneDrive/Belgeler/GitHub/mikroC-PIC-TRUDYO/LED_BUTTON1/LED_BUTTON.c"

sbit LEDR at LATE0_bit;
sbit LEDB at LATE1_bit;
sbit LEDG at LATE2_bit;


sbit button at RB0_bit;



void main()
{
 TRISE = 0x00;
 TRISB = 0x01;

 LATE = 0x00;
 LATB =0x00;

 ADCON1 = 0xFF ;


 while(1)
 {
 if(button == 1)
 LEDR = 1;
 else
 LEDR = 0;
 }


}
