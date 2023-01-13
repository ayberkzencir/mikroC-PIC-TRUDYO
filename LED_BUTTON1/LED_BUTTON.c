
sbit LEDR at LATE0_bit;
sbit LEDB at LATE1_bit;
sbit LEDG at LATE2_bit;   //18F serisinden sonra çýkan picler için iki tür kullanýmý vardýr birincisi LAT diðeri ise RB direk bit ismi yazarak LAT bitlerini full kodlama yapoabilir ama diðeri direk bitt kodlamasý yaoar
                                     //LAT aslýnda bir registerdýr zaten burada göstermek için belirttik  yani bizim LAT  ayazdýðýmýz deðerler sonrasýnda otomatik olarak RE lere yazýlýr

sbit button  at RB0_bit;

void ButtonState();
void Wait();

void main()
{
      TRISE = 0x00;
      TRISB = 0x01; //0b00000001 RB0 a giriþ verdik

      LATE = 0x00;
      LATB =0x00;
      
      ADCON0 = 0xFF ; //ADCON registerýmýzý aktif ettik analog sensörleri kullanýrken bu registerýmýzý aktif etmemiz gerekmektedir.   RB0 0 pinimizin A12 analog 12 bitini aktif etmek gerekiyor ama biz tüm ADCON bitlerini aktif ettik
             //0Xff yaparak hepsini digital olarak kullanacaðýmýzý belirttik
      
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