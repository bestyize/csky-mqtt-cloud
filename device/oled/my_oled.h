#ifndef _MY_OLED_H
#define _MY_OLED_H
#include "stdint.h"
#include "stdbool.h"
#define OLED_MODE 0
#define SIZE 8
#define XLevelL 0x00
#define XLevelH 0x10
#define Max_Column 128
#define Max_Row 64
#define Brightness 0xFF
#define X_WIDTH 128
#define Y_WIDTH 64
//-----------------OLED IIC端口定义----------------



//OLED控制用函数
void OLED_WR_Byte(unsigned dat, unsigned cmd);
void OLED_Display_On(void);
void OLED_Display_Off(void);
void OLED_Init(void);
void OLED_Clear(void);
void OLED_DrawPoint(uint8_t x, uint8_t y, uint8_t t);
void OLED_Fill(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2, uint8_t dot);
void OLED_ShowChar(uint8_t x, uint8_t y, uint8_t chr, uint8_t Char_Size);
void OLED_ShowNum(uint8_t x, uint8_t y, uint32_t num, uint8_t len, uint8_t size);
void OLED_ShowString(uint8_t x, uint8_t y, uint8_t *p, uint8_t Char_Size);
void OLED_Set_Pos(unsigned char x, unsigned char y);
void OLED_ShowCHinese(uint8_t x, uint8_t y, uint8_t no);
void OLED_DrawBMP(unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1, unsigned char BMP[]);
void Delay_50ms(unsigned int Del_50ms);
void Delay_1ms(unsigned int Del_1ms);
void fill_picture(unsigned char fill_Data);
void Picture();
void IIC_Start();
void IIC_Stop();
void Write_IIC_Command(unsigned char IIC_Command);
void Write_IIC_Data(unsigned char IIC_Data);
void Write_IIC_Byte(unsigned char IIC_Byte);

void IIC_Wait_Ack();

void my_oled_init();
void my_oled_show_str(uint8_t x, uint8_t y, uint8_t *str);
void my_oled_init_test(void);

#define OLED_BUF_LEN 14


typedef struct{
	uint8_t line;//在这一行的起始位置
	char buf[OLED_BUF_LEN];//显示的内容
	bool new_value;//是不是刷新
}oled_display_params_t;

/*显示结构体*/
typedef struct{
	oled_display_params_t oled_display_params[8];
}oled_display_t;
extern oled_display_t oled_display;



#endif