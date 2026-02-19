################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/drivers/uefi/lv_uefi_context.c \
../lvgl/src/drivers/uefi/lv_uefi_display.c \
../lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.c \
../lvgl/src/drivers/uefi/lv_uefi_indev_pointer.c \
../lvgl/src/drivers/uefi/lv_uefi_indev_touch.c \
../lvgl/src/drivers/uefi/lv_uefi_private.c 

OBJS += \
./lvgl/src/drivers/uefi/lv_uefi_context.o \
./lvgl/src/drivers/uefi/lv_uefi_display.o \
./lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.o \
./lvgl/src/drivers/uefi/lv_uefi_indev_pointer.o \
./lvgl/src/drivers/uefi/lv_uefi_indev_touch.o \
./lvgl/src/drivers/uefi/lv_uefi_private.o 

C_DEPS += \
./lvgl/src/drivers/uefi/lv_uefi_context.d \
./lvgl/src/drivers/uefi/lv_uefi_display.d \
./lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.d \
./lvgl/src/drivers/uefi/lv_uefi_indev_pointer.d \
./lvgl/src/drivers/uefi/lv_uefi_indev_touch.d \
./lvgl/src/drivers/uefi/lv_uefi_private.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/drivers/uefi/%.o lvgl/src/drivers/uefi/%.su lvgl/src/drivers/uefi/%.cyclo: ../lvgl/src/drivers/uefi/%.c lvgl/src/drivers/uefi/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-drivers-2f-uefi

clean-lvgl-2f-src-2f-drivers-2f-uefi:
	-$(RM) ./lvgl/src/drivers/uefi/lv_uefi_context.cyclo ./lvgl/src/drivers/uefi/lv_uefi_context.d ./lvgl/src/drivers/uefi/lv_uefi_context.o ./lvgl/src/drivers/uefi/lv_uefi_context.su ./lvgl/src/drivers/uefi/lv_uefi_display.cyclo ./lvgl/src/drivers/uefi/lv_uefi_display.d ./lvgl/src/drivers/uefi/lv_uefi_display.o ./lvgl/src/drivers/uefi/lv_uefi_display.su ./lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.cyclo ./lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.d ./lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.o ./lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.su ./lvgl/src/drivers/uefi/lv_uefi_indev_pointer.cyclo ./lvgl/src/drivers/uefi/lv_uefi_indev_pointer.d ./lvgl/src/drivers/uefi/lv_uefi_indev_pointer.o ./lvgl/src/drivers/uefi/lv_uefi_indev_pointer.su ./lvgl/src/drivers/uefi/lv_uefi_indev_touch.cyclo ./lvgl/src/drivers/uefi/lv_uefi_indev_touch.d ./lvgl/src/drivers/uefi/lv_uefi_indev_touch.o ./lvgl/src/drivers/uefi/lv_uefi_indev_touch.su ./lvgl/src/drivers/uefi/lv_uefi_private.cyclo ./lvgl/src/drivers/uefi/lv_uefi_private.d ./lvgl/src/drivers/uefi/lv_uefi_private.o ./lvgl/src/drivers/uefi/lv_uefi_private.su

.PHONY: clean-lvgl-2f-src-2f-drivers-2f-uefi

