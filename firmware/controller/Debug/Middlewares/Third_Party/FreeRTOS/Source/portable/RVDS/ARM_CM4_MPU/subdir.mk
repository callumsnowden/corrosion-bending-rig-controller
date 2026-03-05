################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4_MPU/port.c 

OBJS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4_MPU/port.o 

C_DEPS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4_MPU/port.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4_MPU/%.o Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4_MPU/%.su Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4_MPU/%.cyclo: ../Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4_MPU/%.c Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4_MPU/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-RVDS-2f-ARM_CM4_MPU

clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-RVDS-2f-ARM_CM4_MPU:
	-$(RM) ./Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4_MPU/port.cyclo ./Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4_MPU/port.d ./Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4_MPU/port.o ./Middlewares/Third_Party/FreeRTOS/Source/portable/RVDS/ARM_CM4_MPU/port.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-RVDS-2f-ARM_CM4_MPU

