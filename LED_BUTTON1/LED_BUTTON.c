
sbit LEDR at LATE0_bit;
sbit LEDB at LATE1_bit;
sbit LEDG at LATE2_bit;   //18F serisinden sonra ��kan picler i�in iki t�r kullan�m� vard�r birincisi LAT di�eri ise RB direk bit ismi yazarak LAT bitlerini full kodlama yapoabilir ama di�eri direk bitt kodlamas� yaoar
                                     //LAT asl�nda bir registerd�r zaten burada g�stermek i�in belirttik  yani bizim LAT  ayazd���m�z de�erler sonras�nda otomatik olarak RE lere yaz�l�r

sbit button  at RB0_bit;

void ButtonState();
void Wait();

void main()
{
      TRISE = 0x00;
      TRISB = 0x01; //0b00000001 RB0 a giri� verdik

      LATE = 0x00;
      LATB =0x00;
      
      ADCON0 = 0xFF ; //ADCON register�m�z� aktif ettik analog sens�rleri kullan�rken bu register�m�z� aktif etmemiz gerekmektedir.   RB0 0 pinimizin A12 analog 12 bitini aktif etmek gerekiyor ama biz t�m ADCON bitlerini aktif ettik
             //0Xff yaparak hepsini digital olarak kullanaca��m�z� belirttik
      
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