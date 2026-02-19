################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/draw/sw/blend/lv_draw_sw_blend.c \
../lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.c \
../lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.c \
../lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.c \
../lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.c \
../lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.c \
../lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.c \
../lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.c \
../lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.c \
../lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.c 

OBJS += \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend.o \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.o \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.o \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.o \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.o \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.o \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.o \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.o \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.o \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.o 

C_DEPS += \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend.d \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.d \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.d \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.d \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.d \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.d \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.d \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.d \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.d \
./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/draw/sw/blend/%.o lvgl/src/draw/sw/blend/%.su lvgl/src/draw/sw/blend/%.cyclo: ../lvgl/src/draw/sw/blend/%.c lvgl/src/draw/sw/blend/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-draw-2f-sw-2f-blend

clean-lvgl-2f-src-2f-draw-2f-sw-2f-blend:
	-$(RM) ./lvgl/src/draw/sw/blend/lv_draw_sw_blend.cyclo ./lvgl/src/draw/sw/blend/lv_draw_sw_blend.d ./lvgl/src/draw/sw/blend/lv_draw_sw_blend.o ./lvgl/src/draw/sw/blend/lv_draw_sw_blend.su ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.cyclo ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.d ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.o ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.su ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.cyclo ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.d ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.o ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.su ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.cyclo ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.d ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.o ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.su ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.cyclo ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.d ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.o ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.su ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.cyclo ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.d ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.o ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.su ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.cyclo ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.d ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.o ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.su ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.cyclo ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.d ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.o ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.su ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.cyclo ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.d ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.o ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.su ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.cyclo ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.d ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.o ./lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.su

.PHONY: clean-lvgl-2f-src-2f-draw-2f-sw-2f-blend

