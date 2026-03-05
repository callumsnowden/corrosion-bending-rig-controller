################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/portasm.s 

C_SRCS += \
../Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/port.c 

OBJS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/port.o \
./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/portasm.o 

S_DEPS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/portasm.d 

C_DEPS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/port.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/%.o Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/%.su Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/%.cyclo: ../Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/%.c Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/%.o: ../Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/%.s Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -DDEBUG -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/hal_stm_lvgl" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/lvgl" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-IAR-2f-ARM_CM3

clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-IAR-2f-ARM_CM3:
	-$(RM) ./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/port.cyclo ./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/port.d ./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/port.o ./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/port.su ./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/portasm.d ./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM3/portasm.o

.PHONY: clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-IAR-2f-ARM_CM3

