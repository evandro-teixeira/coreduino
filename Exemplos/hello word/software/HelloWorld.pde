/*-----------------------------------------------------
Projeto: Hello World COREduino PIC18F4550
Autor: Evandro Teixeira
-----------------------------------------------------*/
#include <stdio.h>
unsigned short adc = 0;
const int unsigned PotIn = 13; 
char txt[17];

void setup()
{
    // put your setup code here, to run once:
    delay(1000);
    lcd.pins (20,18,5,4,3,2,0,0,0,0); // Inicializa pinos do Displays  
    lcd.begin(16, 2); // LCD 16x2
  
   pinMode(29,OUTPUT); // inicializa pino backlight
   pinMode(0,OUTPUT); // inicializa pino LED0

   // Escreve Texto no Display
   lcd.print("Hello World");
   lcd.setCursor(0, 1);
   lcd.print("COREDuino PIC18F");

}

void loop() 
{
	// put your main code here, to run repeatedly:
	adc = analogRead(PotIn);   

	//delay(10000); // atraso de 1 segundo

	//lcd.printf("adc: %d",adc);
	//sprintf(txt,"adc: %d",adc);

	 //lcd.setCursor(0, 1);
	 //lcd.print(txt);
	
	toggle(0); //alterna entre OFF e ON
	delay(adc); // atraso de 1 segundo
}
