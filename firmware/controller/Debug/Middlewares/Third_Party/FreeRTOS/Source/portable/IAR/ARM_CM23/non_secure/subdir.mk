################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/portasm.s 

C_SRCS += \
../Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/port.c 

OBJS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/port.o \
./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/portasm.o 

S_DEPS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/portasm.d 

C_DEPS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/port.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/%.o Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/%.su Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/%.cyclo: ../Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/%.c Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/hal_stm_lvgl" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/lvgl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/%.o: ../Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/%.s Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -DDEBUG -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/hal_stm_lvgl" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/lvgl" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-IAR-2f-ARM_CM23-2f-non_secure

clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-IAR-2f-ARM_CM23-2f-non_secure:
	-$(RM) ./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/port.cyclo ./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/port.d ./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/port.o ./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/port.su ./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/portasm.d ./Middlewares/Third_Party/FreeRTOS/Source/portable/IAR/ARM_CM23/non_secure/portasm.o

.PHONY: clean-Middlewares-2f-Third_Party-2f-FreeRTOS-2f-Source-2f-portable-2f-IAR-2f-ARM_CM23-2f-non_secure

