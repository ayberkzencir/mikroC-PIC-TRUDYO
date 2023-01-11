
sbit LEDR at LATE0_bit ;        //18F sonras�ndaki i�lemcileri ��k�� olarak kullancakasak iki t�rl�kullan�m� var birincisi LAT fonksiyonu ikincisi direk Portun RA RB gbi ismini yazmak
sbit LEDG at LATE1_bit ;
sbit LEDB at LATE2_bit;         //LAT ile RB RA aras�ndakji fark LAT bir registerd�r.LATE0 da bizim LATA yazm�� oldu�umuz de�erler daha sonra E0'a otomaik olarak yaz�l�r.

sbit button at RA0_bit;

 //  ADC lerin �al��mas�n� sa�layan register kodlamas� yapmam�z gerekmektedir.
void wait();

void main() 
{
   TRISA  =0xFF;         //RA 0 giri� olarak verd�k
   TRISE =0x00;
   
   LATA= 0x00;
   LATE=0x00;
   
   ADCON1 = 0xFF; //burada analog bir de�eri digital olarak kullanaca��z bu y�zden ADCON kontrol register�m�z�n b�t�n bitlerini 1 yapt�k
   
   
   while(1)
   {
     if(button) {
      LEDR= 1; LEDG = 1; LEDB =1; //burada butona her bast�g�m�da E portunda 1 birim kayacak yani di�er ledleri de yakacak
       wait();
       }
    else  if(!button){
     LEDR = 0; LEDG = 0; LEDB = 0; // E portunun pinlerini 1 birim sola kayd�r
        wait();
                 }
     
     
   }
   
}

void wait()
{
 delay_ms(20);
}