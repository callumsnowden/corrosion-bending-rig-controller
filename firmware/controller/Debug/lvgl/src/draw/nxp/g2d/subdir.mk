################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.c \
../lvgl/src/draw/nxp/g2d/lv_draw_g2d.c \
../lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.c \
../lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.c \
../lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.c \
../lvgl/src/draw/nxp/g2d/lv_g2d_utils.c 

OBJS += \
./lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.o \
./lvgl/src/draw/nxp/g2d/lv_draw_g2d.o \
./lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.o \
./lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.o \
./lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.o \
./lvgl/src/draw/nxp/g2d/lv_g2d_utils.o 

C_DEPS += \
./lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.d \
./lvgl/src/draw/nxp/g2d/lv_draw_g2d.d \
./lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.d \
./lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.d \
./lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.d \
./lvgl/src/draw/nxp/g2d/lv_g2d_utils.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/draw/nxp/g2d/%.o lvgl/src/draw/nxp/g2d/%.su lvgl/src/draw/nxp/g2d/%.cyclo: ../lvgl/src/draw/nxp/g2d/%.c lvgl/src/draw/nxp/g2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-draw-2f-nxp-2f-g2d

clean-lvgl-2f-src-2f-draw-2f-nxp-2f-g2d:
	-$(RM) ./lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.cyclo ./lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.d ./lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.o ./lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.su ./lvgl/src/draw/nxp/g2d/lv_draw_g2d.cyclo ./lvgl/src/draw/nxp/g2d/lv_draw_g2d.d ./lvgl/src/draw/nxp/g2d/lv_draw_g2d.o ./lvgl/src/draw/nxp/g2d/lv_draw_g2d.su ./lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.cyclo ./lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.d ./lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.o ./lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.su ./lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.cyclo ./lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.d ./lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.o ./lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.su ./lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.cyclo ./lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.d ./lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.o ./lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.su ./lvgl/src/draw/nxp/g2d/lv_g2d_utils.cyclo ./lvgl/src/draw/nxp/g2d/lv_g2d_utils.d ./lvgl/src/draw/nxp/g2d/lv_g2d_utils.o ./lvgl/src/draw/nxp/g2d/lv_g2d_utils.su

.PHONY: clean-lvgl-2f-src-2f-draw-2f-nxp-2f-g2d

