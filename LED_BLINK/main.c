 //bu led bootloader modu aktif oldu?unda yanar bootloader modu kapal? oldu?unda ise s?ner

 sbit LED at LATA4_bit; // burada  LED de?i?kenimize A4 tan?mlamas?n? yapt?k   lat A4 portunu belirledik demekki Bizim dahili LED imiz A4 portundaym?s

 sbit LEDR at LATE0_bit;
 sbit LEDG at LATE1_bit;
 sbit LEDB at LATE2_bit;
 
void wait(void);
void LED_An();

void main() 
{
    TRISA = 0b00000000;   //Bu k?s?m denetleyici ?zerindeki LED leri ?al??t?rmak i?indir
    TRISE  =0x00; // buradada hepsini ??k?? veridk


    LATA = 0x00;
    LATE = 0x00;
    

    while(1)
    {
       LED =! LED; wait();
         LED_An();
       
     
  }
  }
  
  void LED_An(void)
  {
    LEDR =! LEDR; wait();
    LEDG =! LEDG; wait();
    LEDB =! LEDB; wait();
    
  }
  void wait(void)
  {
   delay_ms(50);
  }