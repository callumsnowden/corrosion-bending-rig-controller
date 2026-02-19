################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/draw/espressif/ppa/lv_draw_ppa.c \
../lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.c \
../lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.c \
../lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.c 

OBJS += \
./lvgl/src/draw/espressif/ppa/lv_draw_ppa.o \
./lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.o \
./lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.o \
./lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.o 

C_DEPS += \
./lvgl/src/draw/espressif/ppa/lv_draw_ppa.d \
./lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.d \
./lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.d \
./lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/draw/espressif/ppa/%.o lvgl/src/draw/espressif/ppa/%.su lvgl/src/draw/espressif/ppa/%.cyclo: ../lvgl/src/draw/espressif/ppa/%.c lvgl/src/draw/espressif/ppa/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-draw-2f-espressif-2f-ppa

clean-lvgl-2f-src-2f-draw-2f-espressif-2f-ppa:
	-$(RM) ./lvgl/src/draw/espressif/ppa/lv_draw_ppa.cyclo ./lvgl/src/draw/espressif/ppa/lv_draw_ppa.d ./lvgl/src/draw/espressif/ppa/lv_draw_ppa.o ./lvgl/src/draw/espressif/ppa/lv_draw_ppa.su ./lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.cyclo ./lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.d ./lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.o ./lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.su ./lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.cyclo ./lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.d ./lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.o ./lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.su ./lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.cyclo ./lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.d ./lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.o ./lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.su

.PHONY: clean-lvgl-2f-src-2f-draw-2f-espressif-2f-ppa

