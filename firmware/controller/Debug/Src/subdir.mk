################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/adc.c \
../Src/crc.c \
../Src/dcmi.c \
../Src/dma2d.c \
../Src/eth.c \
../Src/fmc.c \
../Src/freertos.c \
../Src/gpio.c \
../Src/i2c.c \
../Src/ltdc.c \
../Src/main.c \
../Src/quadspi.c \
../Src/rtc.c \
../Src/sai.c \
../Src/spdifrx.c \
../Src/spi.c \
../Src/stm32f7xx_hal_msp.c \
../Src/stm32f7xx_hal_timebase_tim.c \
../Src/stm32f7xx_it.c \
../Src/syscalls.c \
../Src/sysmem.c \
../Src/system_stm32f7xx.c \
../Src/tim.c \
../Src/usart.c 

OBJS += \
./Src/adc.o \
./Src/crc.o \
./Src/dcmi.o \
./Src/dma2d.o \
./Src/eth.o \
./Src/fmc.o \
./Src/freertos.o \
./Src/gpio.o \
./Src/i2c.o \
./Src/ltdc.o \
./Src/main.o \
./Src/quadspi.o \
./Src/rtc.o \
./Src/sai.o \
./Src/spdifrx.o \
./Src/spi.o \
./Src/stm32f7xx_hal_msp.o \
./Src/stm32f7xx_hal_timebase_tim.o \
./Src/stm32f7xx_it.o \
./Src/syscalls.o \
./Src/sysmem.o \
./Src/system_stm32f7xx.o \
./Src/tim.o \
./Src/usart.o 

C_DEPS += \
./Src/adc.d \
./Src/crc.d \
./Src/dcmi.d \
./Src/dma2d.d \
./Src/eth.d \
./Src/fmc.d \
./Src/freertos.d \
./Src/gpio.d \
./Src/i2c.d \
./Src/ltdc.d \
./Src/main.d \
./Src/quadspi.d \
./Src/rtc.d \
./Src/sai.d \
./Src/spdifrx.d \
./Src/spi.d \
./Src/stm32f7xx_hal_msp.d \
./Src/stm32f7xx_hal_timebase_tim.d \
./Src/stm32f7xx_it.d \
./Src/syscalls.d \
./Src/sysmem.d \
./Src/system_stm32f7xx.d \
./Src/tim.d \
./Src/usart.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o Src/%.su Src/%.cyclo: ../Src/%.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Src

clean-Src:
	-$(RM) ./Src/adc.cyclo ./Src/adc.d ./Src/adc.o ./Src/adc.su ./Src/crc.cyclo ./Src/crc.d ./Src/crc.o ./Src/crc.su ./Src/dcmi.cyclo ./Src/dcmi.d ./Src/dcmi.o ./Src/dcmi.su ./Src/dma2d.cyclo ./Src/dma2d.d ./Src/dma2d.o ./Src/dma2d.su ./Src/eth.cyclo ./Src/eth.d ./Src/eth.o ./Src/eth.su ./Src/fmc.cyclo ./Src/fmc.d ./Src/fmc.o ./Src/fmc.su ./Src/freertos.cyclo ./Src/freertos.d ./Src/freertos.o ./Src/freertos.su ./Src/gpio.cyclo ./Src/gpio.d ./Src/gpio.o ./Src/gpio.su ./Src/i2c.cyclo ./Src/i2c.d ./Src/i2c.o ./Src/i2c.su ./Src/ltdc.cyclo ./Src/ltdc.d ./Src/ltdc.o ./Src/ltdc.su ./Src/main.cyclo ./Src/main.d ./Src/main.o ./Src/main.su ./Src/quadspi.cyclo ./Src/quadspi.d ./Src/quadspi.o ./Src/quadspi.su ./Src/rtc.cyclo ./Src/rtc.d ./Src/rtc.o ./Src/rtc.su ./Src/sai.cyclo ./Src/sai.d ./Src/sai.o ./Src/sai.su ./Src/spdifrx.cyclo ./Src/spdifrx.d ./Src/spdifrx.o ./Src/spdifrx.su ./Src/spi.cyclo ./Src/spi.d ./Src/spi.o ./Src/spi.su ./Src/stm32f7xx_hal_msp.cyclo ./Src/stm32f7xx_hal_msp.d ./Src/stm32f7xx_hal_msp.o ./Src/stm32f7xx_hal_msp.su ./Src/stm32f7xx_hal_timebase_tim.cyclo ./Src/stm32f7xx_hal_timebase_tim.d ./Src/stm32f7xx_hal_timebase_tim.o ./Src/stm32f7xx_hal_timebase_tim.su ./Src/stm32f7xx_it.cyclo ./Src/stm32f7xx_it.d ./Src/stm32f7xx_it.o ./Src/stm32f7xx_it.su ./Src/syscalls.cyclo ./Src/syscalls.d ./Src/syscalls.o ./Src/syscalls.su ./Src/sysmem.cyclo ./Src/sysmem.d ./Src/sysmem.o ./Src/sysmem.su ./Src/system_stm32f7xx.cyclo ./Src/system_stm32f7xx.d ./Src/system_stm32f7xx.o ./Src/system_stm32f7xx.su ./Src/tim.cyclo ./Src/tim.d ./Src/tim.o ./Src/tim.su ./Src/usart.cyclo ./Src/usart.d ./Src/usart.o ./Src/usart.su

.PHONY: clean-Src

