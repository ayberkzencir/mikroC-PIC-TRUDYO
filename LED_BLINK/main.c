 //bu led bootloader modu aktif olduðunda yanar bootloader modu kapalý olduðunda ise söner

 sbit LED at LATA4_bit; // burada  LEDleri tanýmlamasýný yaptýk

void main() 
{
    TRISA = 0b00000000;   //Bu kýsým denetleyici üzerindeki LED leri çalýþtýrmak içindir
    LATA = 0x00;

    while(1)
    {
     LED = !LED ; delay_ms(200);           //burada kodlama mantýðý eðer lED 1 ise 0 a 0 ise 1 eþitleyecek ve bunu her 200ms de bir yapacak
     
    }
}