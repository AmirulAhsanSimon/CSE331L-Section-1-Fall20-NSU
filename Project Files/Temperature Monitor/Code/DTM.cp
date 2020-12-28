#line 1 "C:/Users/neloy/Dropbox/NSU Lab Officer/Semester/Fall'20/CSE331 Section 1/CSE331L-Section-1-Fall20-NSU-main/Project Files/Temperature Monitor/Code/DTM.c"

sbit LCD_D7 at RB2_bit;
sbit LCD_D6 at RB3_bit;
sbit LCD_D5 at RB4_bit;
sbit LCD_D4 at RB5_bit;
sbit LCD_EN at RB6_bit;
sbit LCD_RS at RB7_bit;

sbit LCD_D7_Direction at TRISB2_bit;
sbit LCD_D6_Direction at TRISB3_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D4_Direction at TRISB5_bit;
sbit LCD_EN_Direction at TRISB6_bit;
sbit LCD_RS_Direction at TRISB7_bit;



int temp;
char temper[7];


void readTenperature(void)
{
 temp = ADC_Read(0);
 temp = temp * 0.4887;

 if(temp<=10)
 {
 PORTD=0b00000100;
 }

 else if(temp>10 && temp<=22 )
 {
 PORTD=0b00001000;
 }
 else if(temp>22 && temp<=32 )
 {
 PORTD=0b00010000;
 }
 else if(temp>32 && temp<=48 )
 {
 PORTD=0b00100000;
 }
 else if(temp>48)
 {
 PORTD=0b01000000;
 }
}

void conversion(void)
{
 inttostr(temp,temper);
}

void display(void)
{
 lcd_out(1,1,"Temperature=");
 lcd_out(1,13,Ltrim(temper));
 Lcd_Chr_Cp(0xdf);
 Lcd_Chr_Cp('C');
 Lcd_Chr_Cp(' ');

}


void main()
{

 ADC_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_out(1,3,"Temperature");
 lcd_out(2,3,"Monitor");
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 TRISD=0;

 while(1)
 {
 readTenperature();
 conversion();
 display();
 }
}
