################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context.c \
../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context_port.c \
../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_heap.c \
../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_init.c 

OBJS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context.o \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context_port.o \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_heap.o \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_init.o 

C_DEPS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context.d \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context_port.d \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_heap.d \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_init.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/%.o Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/%.su Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/%.cyclo: ../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/%.c Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/hal_stm_lvgl" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/lvgl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-GCC-2f-ARM_CM33-2f-secure

clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-GCC-2f-ARM_CM33-2f-secure:
	-$(RM) ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context.cyclo ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context.d ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context.o ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context.su ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context_port.cyclo ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context_port.d ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context_port.o ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_context_port.su ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_heap.cyclo ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_heap.d ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_heap.o ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_heap.su ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_init.cyclo ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_init.d ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_init.o ./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM33/secure/secure_init.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-GCC-2f-ARM_CM33-2f-secure

