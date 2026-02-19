################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/demos/benchmark/assets/img_benchmark_avatar.c \
../lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.c \
../lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.c 

OBJS += \
./lvgl/demos/benchmark/assets/img_benchmark_avatar.o \
./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.o \
./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.o 

C_DEPS += \
./lvgl/demos/benchmark/assets/img_benchmark_avatar.d \
./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.d \
./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/demos/benchmark/assets/%.o lvgl/demos/benchmark/assets/%.su lvgl/demos/benchmark/assets/%.cyclo: ../lvgl/demos/benchmark/assets/%.c lvgl/demos/benchmark/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-demos-2f-benchmark-2f-assets

clean-lvgl-2f-demos-2f-benchmark-2f-assets:
	-$(RM) ./lvgl/demos/benchmark/assets/img_benchmark_avatar.cyclo ./lvgl/demos/benchmark/assets/img_benchmark_avatar.d ./lvgl/demos/benchmark/assets/img_benchmark_avatar.o ./lvgl/demos/benchmark/assets/img_benchmark_avatar.su ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.cyclo ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.d ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.o ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.su ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.cyclo ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.d ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.o ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.su

.PHONY: clean-lvgl-2f-demos-2f-benchmark-2f-assets

