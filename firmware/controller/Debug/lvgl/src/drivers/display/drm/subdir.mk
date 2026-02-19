################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/drivers/display/drm/lv_linux_drm.c \
../lvgl/src/drivers/display/drm/lv_linux_drm_common.c \
../lvgl/src/drivers/display/drm/lv_linux_drm_egl.c 

OBJS += \
./lvgl/src/drivers/display/drm/lv_linux_drm.o \
./lvgl/src/drivers/display/drm/lv_linux_drm_common.o \
./lvgl/src/drivers/display/drm/lv_linux_drm_egl.o 

C_DEPS += \
./lvgl/src/drivers/display/drm/lv_linux_drm.d \
./lvgl/src/drivers/display/drm/lv_linux_drm_common.d \
./lvgl/src/drivers/display/drm/lv_linux_drm_egl.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/drivers/display/drm/%.o lvgl/src/drivers/display/drm/%.su lvgl/src/drivers/display/drm/%.cyclo: ../lvgl/src/drivers/display/drm/%.c lvgl/src/drivers/display/drm/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-drivers-2f-display-2f-drm

clean-lvgl-2f-src-2f-drivers-2f-display-2f-drm:
	-$(RM) ./lvgl/src/drivers/display/drm/lv_linux_drm.cyclo ./lvgl/src/drivers/display/drm/lv_linux_drm.d ./lvgl/src/drivers/display/drm/lv_linux_drm.o ./lvgl/src/drivers/display/drm/lv_linux_drm.su ./lvgl/src/drivers/display/drm/lv_linux_drm_common.cyclo ./lvgl/src/drivers/display/drm/lv_linux_drm_common.d ./lvgl/src/drivers/display/drm/lv_linux_drm_common.o ./lvgl/src/drivers/display/drm/lv_linux_drm_common.su ./lvgl/src/drivers/display/drm/lv_linux_drm_egl.cyclo ./lvgl/src/drivers/display/drm/lv_linux_drm_egl.d ./lvgl/src/drivers/display/drm/lv_linux_drm_egl.o ./lvgl/src/drivers/display/drm/lv_linux_drm_egl.su

.PHONY: clean-lvgl-2f-src-2f-drivers-2f-display-2f-drm

