


#中天微课程实验程序

1、本版基于alios
2、实现PWM调光
3、实现串口接收  由于该工程串口中断无法调通，只能用任务里轮询接收了，为了不与其他任务冲突，优先级调到最低
4、实现延时函数  us级延时不是操作系统提供的，毫秒级延时是通过操作系统实现的
5、串口接收部分做了很多函数处理，可以通过串口控制LED、PWM了


#2019-5-9更新
1、修复上个版本的bug
2、添加了串口1的驱动


#2019-5-15更新

OLED实现
DHT11实现

功能基本完成

2019-5-20 BMP280添加成功

2019-5-30 添加指纹模块





