################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/examples/libs/svg/lv_example_svg_1.c \
../lvgl/examples/libs/svg/lv_example_svg_2.c \
../lvgl/examples/libs/svg/lv_example_svg_3.c 

OBJS += \
./lvgl/examples/libs/svg/lv_example_svg_1.o \
./lvgl/examples/libs/svg/lv_example_svg_2.o \
./lvgl/examples/libs/svg/lv_example_svg_3.o 

C_DEPS += \
./lvgl/examples/libs/svg/lv_example_svg_1.d \
./lvgl/examples/libs/svg/lv_example_svg_2.d \
./lvgl/examples/libs/svg/lv_example_svg_3.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/examples/libs/svg/%.o lvgl/examples/libs/svg/%.su lvgl/examples/libs/svg/%.cyclo: ../lvgl/examples/libs/svg/%.c lvgl/examples/libs/svg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-examples-2f-libs-2f-svg

clean-lvgl-2f-examples-2f-libs-2f-svg:
	-$(RM) ./lvgl/examples/libs/svg/lv_example_svg_1.cyclo ./lvgl/examples/libs/svg/lv_example_svg_1.d ./lvgl/examples/libs/svg/lv_example_svg_1.o ./lvgl/examples/libs/svg/lv_example_svg_1.su ./lvgl/examples/libs/svg/lv_example_svg_2.cyclo ./lvgl/examples/libs/svg/lv_example_svg_2.d ./lvgl/examples/libs/svg/lv_example_svg_2.o ./lvgl/examples/libs/svg/lv_example_svg_2.su ./lvgl/examples/libs/svg/lv_example_svg_3.cyclo ./lvgl/examples/libs/svg/lv_example_svg_3.d ./lvgl/examples/libs/svg/lv_example_svg_3.o ./lvgl/examples/libs/svg/lv_example_svg_3.su

.PHONY: clean-lvgl-2f-examples-2f-libs-2f-svg

