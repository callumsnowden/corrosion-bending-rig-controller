################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/widgets/gif/lv_gif.c 

OBJS += \
./lvgl/src/widgets/gif/lv_gif.o 

C_DEPS += \
./lvgl/src/widgets/gif/lv_gif.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/widgets/gif/%.o lvgl/src/widgets/gif/%.su lvgl/src/widgets/gif/%.cyclo: ../lvgl/src/widgets/gif/%.c lvgl/src/widgets/gif/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-widgets-2f-gif

clean-lvgl-2f-src-2f-widgets-2f-gif:
	-$(RM) ./lvgl/src/widgets/gif/lv_gif.cyclo ./lvgl/src/widgets/gif/lv_gif.d ./lvgl/src/widgets/gif/lv_gif.o ./lvgl/src/widgets/gif/lv_gif.su

.PHONY: clean-lvgl-2f-src-2f-widgets-2f-gif

