
sbit LEDR at LATE0_bit ;        //18F sonrasýndaki iþlemcileri çýkýþ olarak kullancakasak iki türlükullanýmý var birincisi LAT fonksiyonu ikincisi direk Portun RA RB gbi ismini yazmak
sbit LEDG at LATE1_bit ;
sbit LEDB at LATE2_bit;         //LAT ile RB RA arasýndakji fark LAT bir registerdýr.LATE0 da bizim LATA yazmýþ olduðumuz deðerler daha sonra E0'a otomaik olarak yazýlýr.

sbit button at RA0_bit;

 //  ADC lerin çalýþmasýný saðlayan register kodlamasý yapmamýz gerekmektedir.
void wait();

void main() 
{
   TRISA  =0xFF;         //RA 0 giriþ olarak verdýk
   TRISE =0x00;
   
   LATA= 0x00;
   LATE=0x00;
   
   ADCON1 = 0xFF; //burada analog bir deðeri digital olarak kullanacaðýz bu yüzden ADCON kontrol registerýmýzýn bütün bitlerini 1 yaptýk
   
   
   while(1)
   {
     if(button) {
      LEDR= 1; LEDG = 1; LEDB =1; //burada butona her bastýgýmýda E portunda 1 birim kayacak yani diðer ledleri de yakacak
       wait();
       }
    else  if(!button){
     LEDR = 0; LEDG = 0; LEDB = 0; // E portunun pinlerini 1 birim sola kaydýr
        wait();
                 }
     
     
   }
   
}

void wait()
{
 delay_ms(20);
}