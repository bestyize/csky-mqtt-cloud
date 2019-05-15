
#ifndef __MY_OLED_H
#define __MY_OLED_H			  	 

#include "stdint.h" 


//第N行，一共有15行
enum LINE{
	LINE0=0,LINE1=16,LINE2=32,LINE3=48,LINE4=64,LINE5=80,LINE6=96,LINE7=112,LINE8=128,LINE9=144,LINE10=160,LINE11=176,LINE12=192,LINE13=208,LINE14=224
};
//第N列，一共有30列
enum ROW{
	ROW0=0,ROW1=8,ROW2=16,ROW3=24,ROW4=32,ROW5=40,ROW6=48,ROW7=56,ROW8=64,ROW9=72,ROW10=80,ROW11=88,ROW12=96,ROW13=104,ROW14=112,ROW15=120,ROW16=128,ROW17=136,ROW18=144,ROW19=152,ROW20=160,ROW21=168,ROW22=176,ROW23=184,ROW24=192,ROW25=200,ROW26=208,ROW27=216,ROW28=224,ROW29=232
};

void Lcd_Init(void); 
void LCD_Clear(uint16_t Color);
void Address_set(unsigned int x1,unsigned int y1,unsigned int x2,unsigned int y2);
void LCD_WR_DATA8(char da); //发送数据-8位参数
void LCD_WR_DATA(int da);
void LCD_WR_REG(char da);

void LCD_DrawPoint(uint16_t x,uint16_t y);//画点
void LCD_DrawPoint_big(uint16_t x,uint16_t y);//画一个大点
uint16_t  LCD_ReadPoint(uint16_t x,uint16_t y); //读点
void Draw_Circle(uint16_t x0,uint16_t y0,uint8_t r);
void LCD_DrawLine(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2);
void LCD_DrawRectangle(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2);		   
void LCD_Fill(uint16_t xsta,uint16_t ysta,uint16_t xend,uint16_t yend,uint16_t color);
void LCD_ShowChar(uint16_t x,uint16_t y,uint8_t num,uint8_t mode);//显示一个字符
void LCD_ShowNum(uint16_t x,uint16_t y,uint32_t num,uint8_t len);//显示数字
void LCD_Show2Num(uint16_t x,uint16_t y,uint16_t num,uint8_t len);//显示2个数字
void LCD_ShowString(uint16_t x,uint16_t y,const char *p);		 //显示一个字符串,16字体
 
void showhanzi(unsigned int x,unsigned int y,unsigned char index);

#define my_oled_init 			Lcd_Init
#define my_oled_clear		 	LCD_Clear
#define my_oled_draw_point 		LCD_DrawPoint
#define my_oled_draw_point_big  LCD_DrawPoint_big
#define my_oled_read_point 		LCD_ReadPoint
#define my_oled_draw_circle     Draw_Circle
#define my_oled_draw_line       LCD_DrawLine
#define my_oled_draw_rectangle  LCD_DrawRectangle
#define my_oled_fill            LCD_Fill
#define my_oled_show_char       LCD_ShowChar
#define my_oled_show_num        LCD_ShowNum
#define my_oled_show_str        LCD_ShowString

void oled_draw_logo();




					  		 
#endif  
	 
	 



