/*-----------------------------------------------------
Projeto: Motor de Passo
Autor: Evandro Teixeira
-----------------------------------------------------*/
//#include <stdio.h>
/*
#define 	B0	28
#define 	B1	25
#define 	B2	24
#define 	B3	23
*/
unsigned char                    dir                = 0;
unsigned long int	speed           = 0;
unsigned short 	adc 	= 0;
const int unsigned 	PotIn	= 13; 	// adc

void step_motor(unsigned char dir, unsigned long int vel);


/*const int unsigned           B0 	= 28;
const int unsigned              B1 	= 24; 
const int unsigned              B2 	= 25;
const int unsigned              B3 	= 23;
const int unsigned              D0 	= 0;	
const int unsigned              D1 	= 1;*/

void setup() 
{
	pinMode(0,OUTPUT); 	// inicializa pino LED0    
	pinMode(1,OUTPUT); 	// inicializa pino LED1
    
	pinMode(28,OUTPUT); 	// inicializa pino B0    
	pinMode(24,OUTPUT); 	// inicializa pino B1    
	pinMode(25,OUTPUT); 	// inicializa pino B2    
	pinMode(23,OUTPUT); 	// inicializa pino B3

	pinMode(27,INPUT); 	// inicializa pino CH1    
	pinMode(26,INPUT); 	// inicializa pino CH2      
}

void loop() 
{
	// put your main code here, to run repeatedly:
	adc = analogRead(PotIn);   
	//speed = (adc*100);
	//speed = ((adc*50000) / 1023)+500;
	speed = (adc*10000);
	speed = speed / 1023;
	speed = speed + 500; 
	//toggle(0); //alterna entre OFF e ON
	delay(adc);

	if(digitalRead(27) == 0)
	{
		dir = 1;
	}
	
	if(digitalRead(26) == 0)
	{
		dir = 0;
	}
	
	step_motor(dir,speed);
}

void step_motor(unsigned char dir, unsigned long int vel)
{
	static unsigned char i  = 0;
	//static unsigned long int    x = 0;

	if(dir == 1)
	{
		digitalWrite(0,HIGH);
		digitalWrite(1,LOW);

		switch(i)
		{
			case 0:
				digitalWrite(28,HIGH);
				digitalWrite(24,HIGH);
				digitalWrite(25,LOW);
				digitalWrite(23,LOW);
				i = 1;
			break;
			case 1:
				digitalWrite(28,LOW);
				digitalWrite(24,HIGH);
				digitalWrite(25,HIGH);
				digitalWrite(23,LOW);
				i = 2;
			break;
			case 2:
				digitalWrite(28,LOW);
				digitalWrite(24,LOW);
				digitalWrite(25,HIGH);
				digitalWrite(23,HIGH);
				i = 3;
			break;
			case 3:
				digitalWrite(28,HIGH);
				digitalWrite(24,LOW);
				digitalWrite(25,LOW);
				digitalWrite(23,HIGH);
				i = 0;
			break;
		}
	}
	else
	{
		digitalWrite(0,LOW);
		digitalWrite(1,HIGH);
			
		switch(i)
		{
			case 0:
				digitalWrite(28,HIGH);
				digitalWrite(24,LOW);
				digitalWrite(25,LOW);
				digitalWrite(23,HIGH);
				i = 1;
			break;
			case 1:
				digitalWrite(28,HIGH);
				digitalWrite(24,HIGH);
				digitalWrite(25,LOW);
				digitalWrite(23,LOW);
				i = 2;
			break;
			case 2:
				digitalWrite(28,LOW);
				digitalWrite(24,HIGH);
				digitalWrite(25,HIGH);
				digitalWrite(23,LOW);
				i = 3;
			break;
			case 3:
				digitalWrite(28,LOW);
				digitalWrite(24,LOW);
				digitalWrite(25,HIGH);
				digitalWrite(23,HIGH);
				i = 0;
			break;
		}
	}
	/*
	x++;
	if(x >= vel)
	{
		x = 0;
		i++;
		if(i >=4)	i = 0;
	}	
	*/
}

