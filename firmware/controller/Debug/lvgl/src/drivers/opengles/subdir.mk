################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/drivers/opengles/lv_opengles_debug.c \
../lvgl/src/drivers/opengles/lv_opengles_driver.c \
../lvgl/src/drivers/opengles/lv_opengles_egl.c \
../lvgl/src/drivers/opengles/lv_opengles_glfw.c \
../lvgl/src/drivers/opengles/lv_opengles_texture.c 

OBJS += \
./lvgl/src/drivers/opengles/lv_opengles_debug.o \
./lvgl/src/drivers/opengles/lv_opengles_driver.o \
./lvgl/src/drivers/opengles/lv_opengles_egl.o \
./lvgl/src/drivers/opengles/lv_opengles_glfw.o \
./lvgl/src/drivers/opengles/lv_opengles_texture.o 

C_DEPS += \
./lvgl/src/drivers/opengles/lv_opengles_debug.d \
./lvgl/src/drivers/opengles/lv_opengles_driver.d \
./lvgl/src/drivers/opengles/lv_opengles_egl.d \
./lvgl/src/drivers/opengles/lv_opengles_glfw.d \
./lvgl/src/drivers/opengles/lv_opengles_texture.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/drivers/opengles/%.o lvgl/src/drivers/opengles/%.su lvgl/src/drivers/opengles/%.cyclo: ../lvgl/src/drivers/opengles/%.c lvgl/src/drivers/opengles/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-drivers-2f-opengles

clean-lvgl-2f-src-2f-drivers-2f-opengles:
	-$(RM) ./lvgl/src/drivers/opengles/lv_opengles_debug.cyclo ./lvgl/src/drivers/opengles/lv_opengles_debug.d ./lvgl/src/drivers/opengles/lv_opengles_debug.o ./lvgl/src/drivers/opengles/lv_opengles_debug.su ./lvgl/src/drivers/opengles/lv_opengles_driver.cyclo ./lvgl/src/drivers/opengles/lv_opengles_driver.d ./lvgl/src/drivers/opengles/lv_opengles_driver.o ./lvgl/src/drivers/opengles/lv_opengles_driver.su ./lvgl/src/drivers/opengles/lv_opengles_egl.cyclo ./lvgl/src/drivers/opengles/lv_opengles_egl.d ./lvgl/src/drivers/opengles/lv_opengles_egl.o ./lvgl/src/drivers/opengles/lv_opengles_egl.su ./lvgl/src/drivers/opengles/lv_opengles_glfw.cyclo ./lvgl/src/drivers/opengles/lv_opengles_glfw.d ./lvgl/src/drivers/opengles/lv_opengles_glfw.o ./lvgl/src/drivers/opengles/lv_opengles_glfw.su ./lvgl/src/drivers/opengles/lv_opengles_texture.cyclo ./lvgl/src/drivers/opengles/lv_opengles_texture.d ./lvgl/src/drivers/opengles/lv_opengles_texture.o ./lvgl/src/drivers/opengles/lv_opengles_texture.su

.PHONY: clean-lvgl-2f-src-2f-drivers-2f-opengles

