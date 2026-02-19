################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.c \
../lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.c \
../lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.c \
../lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.c \
../lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.c 

OBJS += \
./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.o \
./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.o \
./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.o \
./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.o \
./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.o 

C_DEPS += \
./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.d \
./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.d \
./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.d \
./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.d \
./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/libs/vg_lite_driver/VGLite/%.o lvgl/src/libs/vg_lite_driver/VGLite/%.su lvgl/src/libs/vg_lite_driver/VGLite/%.cyclo: ../lvgl/src/libs/vg_lite_driver/VGLite/%.c lvgl/src/libs/vg_lite_driver/VGLite/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-libs-2f-vg_lite_driver-2f-VGLite

clean-lvgl-2f-src-2f-libs-2f-vg_lite_driver-2f-VGLite:
	-$(RM) ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.cyclo ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.d ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.o ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.su ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.cyclo ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.d ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.o ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.su ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.cyclo ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.d ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.o ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.su ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.cyclo ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.d ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.o ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.su ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.cyclo ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.d ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.o ./lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.su

.PHONY: clean-lvgl-2f-src-2f-libs-2f-vg_lite_driver-2f-VGLite

