################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/libs/gltf/gltf_view/assets/chromatic.c \
../lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.c 

OBJS += \
./lvgl/src/libs/gltf/gltf_view/assets/chromatic.o \
./lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.o 

C_DEPS += \
./lvgl/src/libs/gltf/gltf_view/assets/chromatic.d \
./lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/libs/gltf/gltf_view/assets/%.o lvgl/src/libs/gltf/gltf_view/assets/%.su lvgl/src/libs/gltf/gltf_view/assets/%.cyclo: ../lvgl/src/libs/gltf/gltf_view/assets/%.c lvgl/src/libs/gltf/gltf_view/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-libs-2f-gltf-2f-gltf_view-2f-assets

clean-lvgl-2f-src-2f-libs-2f-gltf-2f-gltf_view-2f-assets:
	-$(RM) ./lvgl/src/libs/gltf/gltf_view/assets/chromatic.cyclo ./lvgl/src/libs/gltf/gltf_view/assets/chromatic.d ./lvgl/src/libs/gltf/gltf_view/assets/chromatic.o ./lvgl/src/libs/gltf/gltf_view/assets/chromatic.su ./lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.cyclo ./lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.d ./lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.o ./lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.su

.PHONY: clean-lvgl-2f-src-2f-libs-2f-gltf-2f-gltf_view-2f-assets

