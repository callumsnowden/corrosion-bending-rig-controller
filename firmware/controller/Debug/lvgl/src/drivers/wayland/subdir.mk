################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/drivers/wayland/lv_wayland.c \
../lvgl/src/drivers/wayland/lv_wl_egl_backend.c \
../lvgl/src/drivers/wayland/lv_wl_g2d_backend.c \
../lvgl/src/drivers/wayland/lv_wl_keyboard.c \
../lvgl/src/drivers/wayland/lv_wl_pointer.c \
../lvgl/src/drivers/wayland/lv_wl_seat.c \
../lvgl/src/drivers/wayland/lv_wl_shm_backend.c \
../lvgl/src/drivers/wayland/lv_wl_touch.c \
../lvgl/src/drivers/wayland/lv_wl_window.c \
../lvgl/src/drivers/wayland/lv_wl_xdg_shell.c 

OBJS += \
./lvgl/src/drivers/wayland/lv_wayland.o \
./lvgl/src/drivers/wayland/lv_wl_egl_backend.o \
./lvgl/src/drivers/wayland/lv_wl_g2d_backend.o \
./lvgl/src/drivers/wayland/lv_wl_keyboard.o \
./lvgl/src/drivers/wayland/lv_wl_pointer.o \
./lvgl/src/drivers/wayland/lv_wl_seat.o \
./lvgl/src/drivers/wayland/lv_wl_shm_backend.o \
./lvgl/src/drivers/wayland/lv_wl_touch.o \
./lvgl/src/drivers/wayland/lv_wl_window.o \
./lvgl/src/drivers/wayland/lv_wl_xdg_shell.o 

C_DEPS += \
./lvgl/src/drivers/wayland/lv_wayland.d \
./lvgl/src/drivers/wayland/lv_wl_egl_backend.d \
./lvgl/src/drivers/wayland/lv_wl_g2d_backend.d \
./lvgl/src/drivers/wayland/lv_wl_keyboard.d \
./lvgl/src/drivers/wayland/lv_wl_pointer.d \
./lvgl/src/drivers/wayland/lv_wl_seat.d \
./lvgl/src/drivers/wayland/lv_wl_shm_backend.d \
./lvgl/src/drivers/wayland/lv_wl_touch.d \
./lvgl/src/drivers/wayland/lv_wl_window.d \
./lvgl/src/drivers/wayland/lv_wl_xdg_shell.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/drivers/wayland/%.o lvgl/src/drivers/wayland/%.su lvgl/src/drivers/wayland/%.cyclo: ../lvgl/src/drivers/wayland/%.c lvgl/src/drivers/wayland/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/STM32746G-Discovery" -I"C:/Users/q42536cs/OneDrive - The University of Manchester/Documents/GitHub/corrosion-bending-rig-controller/firmware/controller/Drivers/BSP/Components" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-drivers-2f-wayland

clean-lvgl-2f-src-2f-drivers-2f-wayland:
	-$(RM) ./lvgl/src/drivers/wayland/lv_wayland.cyclo ./lvgl/src/drivers/wayland/lv_wayland.d ./lvgl/src/drivers/wayland/lv_wayland.o ./lvgl/src/drivers/wayland/lv_wayland.su ./lvgl/src/drivers/wayland/lv_wl_egl_backend.cyclo ./lvgl/src/drivers/wayland/lv_wl_egl_backend.d ./lvgl/src/drivers/wayland/lv_wl_egl_backend.o ./lvgl/src/drivers/wayland/lv_wl_egl_backend.su ./lvgl/src/drivers/wayland/lv_wl_g2d_backend.cyclo ./lvgl/src/drivers/wayland/lv_wl_g2d_backend.d ./lvgl/src/drivers/wayland/lv_wl_g2d_backend.o ./lvgl/src/drivers/wayland/lv_wl_g2d_backend.su ./lvgl/src/drivers/wayland/lv_wl_keyboard.cyclo ./lvgl/src/drivers/wayland/lv_wl_keyboard.d ./lvgl/src/drivers/wayland/lv_wl_keyboard.o ./lvgl/src/drivers/wayland/lv_wl_keyboard.su ./lvgl/src/drivers/wayland/lv_wl_pointer.cyclo ./lvgl/src/drivers/wayland/lv_wl_pointer.d ./lvgl/src/drivers/wayland/lv_wl_pointer.o ./lvgl/src/drivers/wayland/lv_wl_pointer.su ./lvgl/src/drivers/wayland/lv_wl_seat.cyclo ./lvgl/src/drivers/wayland/lv_wl_seat.d ./lvgl/src/drivers/wayland/lv_wl_seat.o ./lvgl/src/drivers/wayland/lv_wl_seat.su ./lvgl/src/drivers/wayland/lv_wl_shm_backend.cyclo ./lvgl/src/drivers/wayland/lv_wl_shm_backend.d ./lvgl/src/drivers/wayland/lv_wl_shm_backend.o ./lvgl/src/drivers/wayland/lv_wl_shm_backend.su ./lvgl/src/drivers/wayland/lv_wl_touch.cyclo ./lvgl/src/drivers/wayland/lv_wl_touch.d ./lvgl/src/drivers/wayland/lv_wl_touch.o ./lvgl/src/drivers/wayland/lv_wl_touch.su ./lvgl/src/drivers/wayland/lv_wl_window.cyclo ./lvgl/src/drivers/wayland/lv_wl_window.d ./lvgl/src/drivers/wayland/lv_wl_window.o ./lvgl/src/drivers/wayland/lv_wl_window.su ./lvgl/src/drivers/wayland/lv_wl_xdg_shell.cyclo ./lvgl/src/drivers/wayland/lv_wl_xdg_shell.d ./lvgl/src/drivers/wayland/lv_wl_xdg_shell.o ./lvgl/src/drivers/wayland/lv_wl_xdg_shell.su

.PHONY: clean-lvgl-2f-src-2f-drivers-2f-wayland

