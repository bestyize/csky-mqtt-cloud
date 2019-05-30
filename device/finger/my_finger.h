#ifndef _MY_FINGER_H
#define _MY_FINGER_H
#include "stdint.h"
#include "my_finger_interface.h"
extern uint8_t FPM10A_RECEICE_BUFFER[32];
extern char local_date;
extern char base_date;

#define KEY_UP    	my_finger_button_up_read
#define KEY_DOWN  	my_finger_button_down_read
#define KEY_OK 		my_finger_button_ok_read
#define KEY_CANCEL 	my_finger_button_cancel_read


void FPM10A_Cmd_Get_Img(void);
void FPM10A_Cmd_Check(void);
void Device_Check(void);
void FPM10A_Receive_Data(uint8_t ucLength);
void FPM10A_Delete_All_Fingerprint();
void FPM10A_Find_Fingerprint();
void FPM10A_Cmd_Search_Finger(void);
void FPM10A_Add_Fingerprint();
void FPM10A_Cmd_Reg_Model();
void FPM10A_Cmd_Save_Finger( unsigned int storeID );
void FINGERPRINT_Cmd_Delete_All_Finger(void);

void my_finger_init(void);
void my_finger_display_main_menu(void);


#endif