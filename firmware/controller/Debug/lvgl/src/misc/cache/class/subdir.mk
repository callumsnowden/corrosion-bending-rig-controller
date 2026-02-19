################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/misc/cache/class/lv_cache_lru_ll.c \
../lvgl/src/misc/cache/class/lv_cache_lru_rb.c \
../lvgl/src/misc/cache/class/lv_cache_sc_da.c 

OBJS += \
./lvgl/src/misc/cache/class/lv_cache_lru_ll.o \
./lvgl/src/misc/cache/class/lv_cache_lru_rb.o \
./lvgl/src/misc/cache/class/lv_cache_sc_da.o 

C_DEPS += \
./lvgl/src/misc/cache/class/lv_cache_lru_ll.d \
./lvgl/src/misc/cache/class/lv_cache_lru_rb.d \
./lvgl/src/misc/cache/class/lv_cache_sc_da.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/misc/cache/class/%.o lvgl/src/misc/cache/class/%.su lvgl/src/misc/cache/class/%.cyclo: ../lvgl/src/misc/cache/class/%.c lvgl/src/misc/cache/class/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-misc-2f-cache-2f-class

clean-lvgl-2f-src-2f-misc-2f-cache-2f-class:
	-$(RM) ./lvgl/src/misc/cache/class/lv_cache_lru_ll.cyclo ./lvgl/src/misc/cache/class/lv_cache_lru_ll.d ./lvgl/src/misc/cache/class/lv_cache_lru_ll.o ./lvgl/src/misc/cache/class/lv_cache_lru_ll.su ./lvgl/src/misc/cache/class/lv_cache_lru_rb.cyclo ./lvgl/src/misc/cache/class/lv_cache_lru_rb.d ./lvgl/src/misc/cache/class/lv_cache_lru_rb.o ./lvgl/src/misc/cache/class/lv_cache_lru_rb.su ./lvgl/src/misc/cache/class/lv_cache_sc_da.cyclo ./lvgl/src/misc/cache/class/lv_cache_sc_da.d ./lvgl/src/misc/cache/class/lv_cache_sc_da.o ./lvgl/src/misc/cache/class/lv_cache_sc_da.su

.PHONY: clean-lvgl-2f-src-2f-misc-2f-cache-2f-class

