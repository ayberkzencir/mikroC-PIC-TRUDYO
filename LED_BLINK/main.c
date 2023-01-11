 //bu led bootloader modu aktif olduðunda yanar bootloader modu kapalý olduðunda ise söner

 sbit LED at LATA4_bit; // burada  LED deðiþkenimize A4 tanýmlamasýný yaptýk   lat A4 portunu belirledik demekki Bizim dahili LED imiz A4 portundaymýs

 sbit LEDR at LATE0_bit;
 sbit LEDG at LATE1_bit;
 sbit LEDB at LATE2_bit;
 
 
void LED_An();

void main() 
{
    TRISA  = 0b00000000;   //Bu kýsým denetleyici üzerindeki LED leri çalýþtýrmak içindir
    TRISE  = 0x00; // buradada hepsini çýkýþ veridk
    

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