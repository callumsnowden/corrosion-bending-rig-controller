################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/demos/widgets/lv_demo_widgets.c \
../lvgl/demos/widgets/lv_demo_widgets_analytics.c \
../lvgl/demos/widgets/lv_demo_widgets_components.c \
../lvgl/demos/widgets/lv_demo_widgets_profile.c \
../lvgl/demos/widgets/lv_demo_widgets_shop.c 

OBJS += \
./lvgl/demos/widgets/lv_demo_widgets.o \
./lvgl/demos/widgets/lv_demo_widgets_analytics.o \
./lvgl/demos/widgets/lv_demo_widgets_components.o \
./lvgl/demos/widgets/lv_demo_widgets_profile.o \
./lvgl/demos/widgets/lv_demo_widgets_shop.o 

C_DEPS += \
./lvgl/demos/widgets/lv_demo_widgets.d \
./lvgl/demos/widgets/lv_demo_widgets_analytics.d \
./lvgl/demos/widgets/lv_demo_widgets_components.d \
./lvgl/demos/widgets/lv_demo_widgets_profile.d \
./lvgl/demos/widgets/lv_demo_widgets_shop.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/demos/widgets/%.o lvgl/demos/widgets/%.su lvgl/demos/widgets/%.cyclo: ../lvgl/demos/widgets/%.c lvgl/demos/widgets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-demos-2f-widgets

clean-lvgl-2f-demos-2f-widgets:
	-$(RM) ./lvgl/demos/widgets/lv_demo_widgets.cyclo ./lvgl/demos/widgets/lv_demo_widgets.d ./lvgl/demos/widgets/lv_demo_widgets.o ./lvgl/demos/widgets/lv_demo_widgets.su ./lvgl/demos/widgets/lv_demo_widgets_analytics.cyclo ./lvgl/demos/widgets/lv_demo_widgets_analytics.d ./lvgl/demos/widgets/lv_demo_widgets_analytics.o ./lvgl/demos/widgets/lv_demo_widgets_analytics.su ./lvgl/demos/widgets/lv_demo_widgets_components.cyclo ./lvgl/demos/widgets/lv_demo_widgets_components.d ./lvgl/demos/widgets/lv_demo_widgets_components.o ./lvgl/demos/widgets/lv_demo_widgets_components.su ./lvgl/demos/widgets/lv_demo_widgets_profile.cyclo ./lvgl/demos/widgets/lv_demo_widgets_profile.d ./lvgl/demos/widgets/lv_demo_widgets_profile.o ./lvgl/demos/widgets/lv_demo_widgets_profile.su ./lvgl/demos/widgets/lv_demo_widgets_shop.cyclo ./lvgl/demos/widgets/lv_demo_widgets_shop.d ./lvgl/demos/widgets/lv_demo_widgets_shop.o ./lvgl/demos/widgets/lv_demo_widgets_shop.su

.PHONY: clean-lvgl-2f-demos-2f-widgets

