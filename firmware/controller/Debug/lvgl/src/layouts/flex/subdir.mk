################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/layouts/flex/lv_flex.c 

OBJS += \
./lvgl/src/layouts/flex/lv_flex.o 

C_DEPS += \
./lvgl/src/layouts/flex/lv_flex.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/layouts/flex/%.o lvgl/src/layouts/flex/%.su lvgl/src/layouts/flex/%.cyclo: ../lvgl/src/layouts/flex/%.c lvgl/src/layouts/flex/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-layouts-2f-flex

clean-lvgl-2f-src-2f-layouts-2f-flex:
	-$(RM) ./lvgl/src/layouts/flex/lv_flex.cyclo ./lvgl/src/layouts/flex/lv_flex.d ./lvgl/src/layouts/flex/lv_flex.o ./lvgl/src/layouts/flex/lv_flex.su

.PHONY: clean-lvgl-2f-src-2f-layouts-2f-flex

