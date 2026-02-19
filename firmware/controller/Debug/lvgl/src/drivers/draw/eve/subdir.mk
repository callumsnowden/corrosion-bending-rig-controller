################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/drivers/draw/eve/lv_draw_eve_display.c 

OBJS += \
./lvgl/src/drivers/draw/eve/lv_draw_eve_display.o 

C_DEPS += \
./lvgl/src/drivers/draw/eve/lv_draw_eve_display.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/drivers/draw/eve/%.o lvgl/src/drivers/draw/eve/%.su lvgl/src/drivers/draw/eve/%.cyclo: ../lvgl/src/drivers/draw/eve/%.c lvgl/src/drivers/draw/eve/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-drivers-2f-draw-2f-eve

clean-lvgl-2f-src-2f-drivers-2f-draw-2f-eve:
	-$(RM) ./lvgl/src/drivers/draw/eve/lv_draw_eve_display.cyclo ./lvgl/src/drivers/draw/eve/lv_draw_eve_display.d ./lvgl/src/drivers/draw/eve/lv_draw_eve_display.o ./lvgl/src/drivers/draw/eve/lv_draw_eve_display.su

.PHONY: clean-lvgl-2f-src-2f-drivers-2f-draw-2f-eve

