#line 1 "C:/Users/agart/OneDrive/Belgeler/GitHub/mikroC-PIC-TRUDYO/LED_BUTTON1/LED_BUTTON.c"

sbit LEDR at LATE0_bit ;
sbit LEDG at LATE1_bit ;
sbit LEDB at LATE2_bit;

sbit button at RA0_bit;


void wait();

void main()
{
 TRISA =0xFF;
 TRISE =0x00;

 LATA= 0x00;
 LATE=0x00;

 ADCON1 = 0xFF;


 while(1)
 {
 if(button) {
 LEDR= 1; LEDG = 1; LEDB =1;
 wait();
 }
 else if(!button){
 LEDR = 0; LEDG = 0; LEDB = 0;
 wait();
 }


 }

}

void wait()
{
 delay_ms(20);
}
