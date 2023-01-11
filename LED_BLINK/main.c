 //bu led bootloader modu aktif oldu�unda yanar bootloader modu kapal� oldu�unda ise s�ner

 sbit LED at LATA4_bit; // burada  LEDleri tan�mlamas�n� yapt�k

void main() 
{
    TRISA = 0b00000000;   //Bu k�s�m denetleyici �zerindeki LED leri �al��t�rmak i�indir
    LATA = 0x00;

    while(1)
    {
     LED = !LED ; delay_ms(200);           //burada kodlama mant��� e�er lED 1 ise 0 a 0 ise 1 e�itleyecek ve bunu her 200ms de bir yapacak
     
    }
}