/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * File Name          : freertos.c
  * Description        : Code for freertos applications
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2026 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "FreeRTOS.h"
#include "task.h"
#include "main.h"
#include "cmsis_os.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

#include "stm32746g_discovery.h"
#include "stm32f7xx_hal_i2c.h"
#include "sdmmc.h"
#include "fatfs.h"
#include "bsp_driver_sd.h"
#include "i2c.h"
#include "tim.h"
#include "lvgl/lvgl.h"
#include "tfp_printf.h"
#include <stdio.h>
#include <math.h>
#include <string.h>

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

typedef enum {
	MACHINE_DISABLED,
	MACHINE_IDLE,
	HOME_EXTEND,
	HOME_RETRACT,
	HOME_IDLE,
	EXTEND,
	RETRACT,
	JOG_EXTEND,
	JOG_RETRACT,
	COMPLETED,
	MACHINE_ERROR
} MachineState_t;

enum UiButtons {
	NULL_BUTTON,
	ENABLE_BUTTON_CHECKED,
	ENABLE_BUTTON_UNCHECKED,
	HOME_BUTTON,
	START_CYCLE_BUTTON,
	JOG_RETRACT_BUTTON,
	JOG_RETRACT_BUTTON_PRESSED,
	JOG_RETRACT_BUTTON_RELEASED,
	JOG_EXTEND_BUTTON,
	JOG_EXTEND_BUTTON_PRESSED,
	JOG_EXTEND_BUTTON_RELEASED,
	END_CYCLE_UNLOAD_BUTTON,
	END_CYCLE_CANCEL_BUTTON,
	JOG_RETRACT_TENTH_BUTTON_CLICKED,
	JOG_RETRACT_MM_BUTTON_CLICKED,
	JOG_EXTEND_TENTH_BUTTON_CLICKED,
	JOG_EXTEND_MM_BUTTON_CLICKED
};

enum LoggerControlValue {
	LOG_IDLE,
	LOG_STOP,
	LOG_START,
	LOG_RUNNING
};

typedef struct {
	uint32_t runtime;
	float distance;
	float force;
} LogLine_t;

typedef struct {
	uint32_t starttime;
	uint32_t runtime;
	float distance;
} RetractDistanceMessage_t;

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

#define ADC_ADDRESS 0x48

#define LIMIT_SW_RETRACT_Pin GPIO_PIN_6
#define LIMIT_SW_RETRACT_Port GPIOG
#define LIMIT_SW_EXTEND_Pin GPIO_PIN_7
#define LIMIT_SW_EXTEND_Port GPIOG

#define STEPPER_ENABLE_Pin GPIO_PIN_3
#define STEPPER_ENABLE_Port GPIOI
#define STEPPER_DIRECTION_Pin GPIO_PIN_2
#define STEPPER_DIRECTION_Port GPIOI

#define MAX_MOVE_DISTANCE 30 // mm
#define MAX_RUN_TIME 43200 // minutes (10 days worth)

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN Variables */

TaskHandle_t xTaskGuiHandle = NULL;
TaskHandle_t xTaskAdcHandle = NULL;
TaskHandle_t xTaskProcessControlHandle = NULL;
TaskHandle_t xTaskLoggerHandle = NULL;
QueueHandle_t xAdcVoltageQueue;
QueueHandle_t xLogLineQueue;
QueueHandle_t xRetractionDistanceQueue;

/* USER CODE END Variables */
osThreadId defaultTaskHandle;

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN FunctionPrototypes */

/*
 * RTOS tasks
 */
void vTaskGui(void * pvParameters);
void vTaskAdcPoll(void * pvParameters);
void vTaskProcessControl(void * pvParameters);
void vTaskLogger(void * pvParameters);

void settingsTextAreaEventHandler(lv_event_t * e);
void cycleCompleteMsgBoxBtnHandler(lv_event_t * e);
void enableButtonEventHandler(lv_event_t * e);
void uiButtonEventHandler(lv_event_t * e);
void createCycleCompleteMessageBox();
void createJogWarningMessageBox();

uint32_t roundToMultiple(uint32_t value, uint32_t multiple);

/* USER CODE END FunctionPrototypes */

void StartDefaultTask(void const * argument);

void MX_FREERTOS_Init(void); /* (MISRA C 2004 rule 8.1) */

/* GetIdleTaskMemory prototype (linked to static allocation support) */
void vApplicationGetIdleTaskMemory( StaticTask_t **ppxIdleTaskTCBBuffer, StackType_t **ppxIdleTaskStackBuffer, uint32_t *pulIdleTaskStackSize );

/* GetTimerTaskMemory prototype (linked to static allocation support) */
void vApplicationGetTimerTaskMemory( StaticTask_t **ppxTimerTaskTCBBuffer, StackType_t **ppxTimerTaskStackBuffer, uint32_t *pulTimerTaskStackSize );

/* Hook prototypes */
void vApplicationIdleHook(void);
void vApplicationStackOverflowHook(xTaskHandle xTask, signed char *pcTaskName);
void vApplicationMallocFailedHook(void);

/* USER CODE BEGIN 2 */
void vApplicationIdleHook( void )
{
   /* vApplicationIdleHook() will only be called if configUSE_IDLE_HOOK is set
   to 1 in FreeRTOSConfig.h. It will be called on each iteration of the idle
   task. It is essential that code added to this hook function never attempts
   to block in any way (for example, call xQueueReceive() with a block time
   specified, or call vTaskDelay()). If the application makes use of the
   vTaskDelete() API function (as this demo application does) then it is also
   important that vApplicationIdleHook() is permitted to return to its calling
   function, because it is the responsibility of the idle task to clean up
   memory allocated by the kernel to any task that has since been deleted. */
}
/* USER CODE END 2 */

/* USER CODE BEGIN 4 */
void vApplicationStackOverflowHook(xTaskHandle xTask, signed char *pcTaskName)
{
   /* Run time stack overflow checking is performed if
   configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2. This hook function is
   called if a stack overflow is detected. */
}
/* USER CODE END 4 */

/* USER CODE BEGIN 5 */
void vApplicationMallocFailedHook(void)
{
   /* vApplicationMallocFailedHook() will only be called if
   configUSE_MALLOC_FAILED_HOOK is set to 1 in FreeRTOSConfig.h. It is a hook
   function that will get called if a call to pvPortMalloc() fails.
   pvPortMalloc() is called internally by the kernel whenever a task, queue,
   timer or semaphore is created. It is also called by various parts of the
   demo application. If heap_1.c or heap_2.c are used, then the size of the
   heap available to pvPortMalloc() is defined by configTOTAL_HEAP_SIZE in
   FreeRTOSConfig.h, and the xPortGetFreeHeapSize() API function can be used
   to query the size of free heap space that remains (although it does not
   provide information on how the remaining heap might be fragmented). */
}
/* USER CODE END 5 */

/* USER CODE BEGIN GET_IDLE_TASK_MEMORY */
static StaticTask_t xIdleTaskTCBBuffer;
static StackType_t xIdleStack[configMINIMAL_STACK_SIZE];

void vApplicationGetIdleTaskMemory( StaticTask_t **ppxIdleTaskTCBBuffer, StackType_t **ppxIdleTaskStackBuffer, uint32_t *pulIdleTaskStackSize )
{
  *ppxIdleTaskTCBBuffer = &xIdleTaskTCBBuffer;
  *ppxIdleTaskStackBuffer = &xIdleStack[0];
  *pulIdleTaskStackSize = configMINIMAL_STACK_SIZE;
  /* place for user code */
}
/* USER CODE END GET_IDLE_TASK_MEMORY */

/* USER CODE BEGIN GET_TIMER_TASK_MEMORY */
static StaticTask_t xTimerTaskTCBBuffer;
static StackType_t xTimerStack[configTIMER_TASK_STACK_DEPTH];

void vApplicationGetTimerTaskMemory( StaticTask_t **ppxTimerTaskTCBBuffer, StackType_t **ppxTimerTaskStackBuffer, uint32_t *pulTimerTaskStackSize )
{
  *ppxTimerTaskTCBBuffer = &xTimerTaskTCBBuffer;
  *ppxTimerTaskStackBuffer = &xTimerStack[0];
  *pulTimerTaskStackSize = configTIMER_TASK_STACK_DEPTH;
  /* place for user code */
}
/* USER CODE END GET_TIMER_TASK_MEMORY */

/**
  * @brief  FreeRTOS initialization
  * @param  None
  * @retval None
  */
void MX_FREERTOS_Init(void) {
  /* USER CODE BEGIN Init */

	BSP_LED_Init(LED1);

	/*
	 * Start TIM2 for step pulse generation
	 */
	HAL_TIM_Base_Start(&htim2);
	HAL_TIM_OnePulse_Start(&htim2, TIM_CHANNEL_1);

  /* USER CODE END Init */

  /* USER CODE BEGIN RTOS_MUTEX */
  /* add mutexes, ... */
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */
  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */

  /* USER CODE BEGIN RTOS_QUEUES */

	/*
	 * Create queue for force readings
	 */
	xAdcVoltageQueue = xQueueCreate(2, sizeof(float));

	/*
	 * Create queue for distance readings
	 */
	xRetractionDistanceQueue = xQueueCreate(2, sizeof(RetractDistanceMessage_t));

	/*
	 * Create queue for log lines
	 */
	xLogLineQueue = xQueueCreate(2, sizeof(LogLine_t));

  /* USER CODE END RTOS_QUEUES */

  /* Create the thread(s) */
  /* definition and creation of defaultTask */
  osThreadDef(defaultTask, StartDefaultTask, osPriorityNormal, 0, 256);
  defaultTaskHandle = osThreadCreate(osThread(defaultTask), NULL);

  /* USER CODE BEGIN RTOS_THREADS */
  xTaskCreate(vTaskGui, "GUItsk", 2536, NULL, 2, &xTaskGuiHandle);
  xTaskCreate(vTaskAdcPoll, "ADCpolltsk", 512, NULL, 1, &xTaskAdcHandle);
  xTaskCreate(vTaskProcessControl, "ProcCtlTsk", 512, NULL, 4, &xTaskProcessControlHandle);
  xTaskCreate(vTaskLogger, "LoggerTsk", 512, NULL, 3, &xTaskLoggerHandle);

  /* USER CODE END RTOS_THREADS */

}

/* USER CODE BEGIN Header_StartDefaultTask */
/**
  * @brief  Function implementing the defaultTask thread.
  * @param  argument: Not used
  * @retval None
  */
/* USER CODE END Header_StartDefaultTask */
void StartDefaultTask(void const * argument)
{
  /* USER CODE BEGIN StartDefaultTask */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END StartDefaultTask */
}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */

void vTaskGui(void * pvParameters)
{
	lv_lock();

	/*Create a Tab view object*/
	lv_obj_t * tabview;
	tabview = lv_tabview_create(lv_screen_active());

	/*Add 3 tabs (the tabs are page (lv_page) and can be scrolled*/
	lv_obj_t * homeTab = lv_tabview_add_tab(tabview, LV_SYMBOL_HOME " Home");
	lv_obj_t * settingsTab = lv_tabview_add_tab(tabview, LV_SYMBOL_SETTINGS " Settings");
	lv_obj_t * diagnosticsTab = lv_tabview_add_tab(tabview, LV_SYMBOL_WARNING " Diagnostics");
	lv_obj_set_name(tabview, "tabview");
	lv_tabview_set_tab_bar_size(tabview, LV_PCT(12));

	/*Change the active screen's background color*/
	lv_obj_set_style_bg_color(tabview, lv_color_hex(0xdbdbdb), LV_PART_MAIN);

	/*
	 * Diagnostics tab widgets
	 */
	lv_obj_t * counterLabel = lv_label_create(diagnosticsTab);
	lv_obj_set_name(counterLabel, "counterLabel");
	lv_label_set_text(counterLabel, "Unhomed");
	lv_obj_align(counterLabel, LV_ALIGN_TOP_LEFT, 0, 0);
	lv_label_set_recolor(counterLabel, true);

	lv_obj_t * voltageLabel = lv_label_create(diagnosticsTab);
	lv_obj_set_name(voltageLabel, "voltageLabel");
	lv_label_set_text(voltageLabel, "No force reading");
	lv_obj_align(voltageLabel, LV_ALIGN_TOP_RIGHT, 0, 0);
	lv_label_set_recolor(voltageLabel, true);

	lv_obj_t * adcStatusLabel = lv_label_create(diagnosticsTab);
	lv_label_set_text(adcStatusLabel, "ADC timer not running");
	lv_obj_set_name(adcStatusLabel, "adcStatusLabel");
	lv_obj_align(adcStatusLabel, LV_ALIGN_TOP_RIGHT, 0, 40);

	lv_obj_t * systickLabel = lv_label_create(diagnosticsTab);
	lv_obj_set_name(systickLabel, "systickLabel");
	lv_label_set_text(systickLabel, "systick: ");
	lv_obj_align(systickLabel, LV_ALIGN_TOP_MID, 0, 0);

	lv_obj_t * extendLedLabel = lv_label_create(diagnosticsTab);
	lv_obj_t * extendLed = lv_led_create(diagnosticsTab);
	lv_obj_set_name(extendLedLabel, "extendLedLabel");
	lv_label_set_text(extendLedLabel, "Extend sensor");
	lv_obj_update_layout(extendLed);
	lv_obj_align_to(extendLedLabel, counterLabel, LV_ALIGN_OUT_BOTTOM_LEFT, 0, (lv_obj_get_height(extendLed) + 2));
	lv_obj_set_name(extendLed, "extendLed");
	lv_obj_align_to(extendLed, extendLedLabel, LV_ALIGN_OUT_RIGHT_MID, 10, 0);

	lv_obj_t * retractLedLabel = lv_label_create(diagnosticsTab);
	lv_obj_t * retractLed = lv_led_create(diagnosticsTab);
	lv_obj_set_name(retractLedLabel, "retractLedLabel");
	lv_label_set_text(retractLedLabel, "Retract sensor");
	lv_obj_update_layout(retractLed);
	lv_obj_align_to(retractLedLabel, extendLedLabel, LV_ALIGN_OUT_BOTTOM_LEFT, 0, (lv_obj_get_height(retractLed) + 2));
	lv_obj_set_name(retractLed, "retractLed");
	lv_obj_align_to(retractLed, retractLedLabel, LV_ALIGN_OUT_RIGHT_MID, 10, 0);

	lv_obj_t * guiTaskWatermarkLabel = lv_label_create(diagnosticsTab);
	lv_obj_set_name(guiTaskWatermarkLabel, "guiTaskWatermarkLabel");
	lv_obj_align_to(guiTaskWatermarkLabel, retractLedLabel, LV_ALIGN_OUT_BOTTOM_LEFT, 0, (lv_obj_get_height(retractLed) + 2));

	lv_obj_t * adcTaskWatermarkLabel = lv_label_create(diagnosticsTab);
	lv_obj_set_name(adcTaskWatermarkLabel, "adcTaskWatermarkLabel");
	lv_obj_align_to(adcTaskWatermarkLabel, guiTaskWatermarkLabel, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 0);

	lv_obj_t * controlTaskWatermarkLabel = lv_label_create(diagnosticsTab);
	lv_obj_set_name(controlTaskWatermarkLabel, "controlTaskWatermarkLabel");
	lv_obj_align_to(controlTaskWatermarkLabel, adcTaskWatermarkLabel, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 0);

	lv_obj_t * loggerTaskWatermarkLabel = lv_label_create(diagnosticsTab);
	lv_obj_set_name(loggerTaskWatermarkLabel, "loggerTaskWatermarkLabel");
	lv_obj_align_to(loggerTaskWatermarkLabel, controlTaskWatermarkLabel, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 0);

	lv_obj_t * loggerTaskStatusLabel = lv_label_create(diagnosticsTab);
	lv_obj_set_name(loggerTaskStatusLabel, "loggerTaskStatusLabel");
	lv_label_set_text(loggerTaskStatusLabel, "Logger status");
	lv_obj_align_to(loggerTaskStatusLabel, loggerTaskWatermarkLabel, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 0);

	/*
	 * Home tab widgets
	 */

	lv_obj_t * enableButton = lv_button_create(homeTab);
	lv_obj_t * enableButtonLabel = lv_label_create(enableButton);
	lv_label_set_text(enableButtonLabel, "Enable machine");
	lv_obj_set_name(enableButton, "enableButton");
	lv_obj_center(enableButtonLabel);
	lv_obj_align(enableButton, LV_ALIGN_TOP_LEFT, 0, 0);
	lv_obj_add_flag(enableButton, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_add_event_cb(enableButton, enableButtonEventHandler, LV_EVENT_CLICKED, NULL);
	lv_obj_set_height(enableButton, LV_SIZE_CONTENT);
	lv_obj_set_width(enableButton, LV_PCT(30));

	lv_obj_t * homeAxisButton = lv_button_create(homeTab);
	lv_obj_t * homeAxisButtonLabel = lv_label_create(homeAxisButton);
	lv_label_set_text(homeAxisButtonLabel, "Home axis");
	lv_obj_set_name(homeAxisButton, "homeAxisButton");
	lv_obj_center(homeAxisButtonLabel);
	lv_obj_align(homeAxisButton, LV_ALIGN_TOP_MID, 0, 0);
	lv_obj_add_state(homeAxisButton, LV_STATE_DISABLED);
	lv_obj_add_event_cb(homeAxisButton, uiButtonEventHandler, LV_EVENT_CLICKED, (void *)HOME_BUTTON);
	lv_obj_set_height(homeAxisButton, LV_SIZE_CONTENT);
	lv_obj_set_width(homeAxisButton, LV_PCT(30));

	lv_obj_t * startCycleButton = lv_button_create(homeTab);
	lv_obj_t * startCycleButtonLabel = lv_label_create(startCycleButton);
	lv_label_set_text(startCycleButtonLabel, "Start cycle");
	lv_obj_set_name(startCycleButton, "startCycleButton");
	lv_obj_center(startCycleButtonLabel);
	lv_obj_align(startCycleButton, LV_ALIGN_TOP_RIGHT, 0, 0);
	lv_obj_add_state(startCycleButton, LV_STATE_DISABLED);
	lv_obj_add_event_cb(startCycleButton, uiButtonEventHandler, LV_EVENT_CLICKED, (void *)START_CYCLE_BUTTON);
	lv_obj_set_height(startCycleButton, LV_SIZE_CONTENT);
	lv_obj_set_width(startCycleButton, LV_PCT(30));

	lv_obj_t * logFilenameLabel = lv_label_create(homeTab);
	lv_obj_set_name(logFilenameLabel, "logFilenameLabel");
	lv_label_set_text(logFilenameLabel, "Not logging");
	lv_obj_align_to(logFilenameLabel, homeAxisButton, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 5);
	lv_obj_set_style_text_align(logFilenameLabel, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN);
	lv_obj_set_width(logFilenameLabel, LV_PCT(30));

	lv_obj_t * forceLabel = lv_label_create(homeTab);
	lv_obj_set_name(forceLabel, "forceLabel");
	lv_label_set_text(forceLabel, "F: 0N");
	lv_obj_align_to(forceLabel, logFilenameLabel, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 5);
	lv_obj_set_style_text_align(forceLabel, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN);
	lv_obj_set_width(forceLabel, LV_PCT(30));

	lv_obj_t * distanceLabel = lv_label_create(homeTab);
	lv_obj_set_name(distanceLabel, "distanceLabel");
	lv_label_set_text(distanceLabel, "D: 0.0mm");
	lv_obj_align_to(distanceLabel, forceLabel, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 0);
	lv_obj_set_style_text_align(distanceLabel, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN);
	lv_obj_set_width(distanceLabel, LV_PCT(30));

	lv_obj_t * jogRetractButton = lv_button_create(homeTab);
	lv_obj_t * jogRetractButtonLabel = lv_label_create(jogRetractButton);
	lv_label_set_text(jogRetractButtonLabel, "Jog retract");
	lv_obj_set_name(jogRetractButton, "jogRetractButton");
	lv_obj_center(jogRetractButtonLabel);
	lv_obj_align_to(jogRetractButton, enableButton, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 5);
	lv_obj_add_state(jogRetractButton, LV_STATE_DISABLED);
	lv_obj_add_event_cb(jogRetractButton, uiButtonEventHandler, LV_EVENT_PRESSED, (void *)JOG_RETRACT_BUTTON_PRESSED);
	lv_obj_add_event_cb(jogRetractButton, uiButtonEventHandler, LV_EVENT_RELEASED, (void *)JOG_RETRACT_BUTTON_RELEASED);
	lv_obj_set_height(jogRetractButton, LV_SIZE_CONTENT);
	lv_obj_set_width(jogRetractButton, LV_PCT(30));

	lv_obj_t * jogRetractMmButton = lv_button_create(homeTab);
	lv_obj_t * jogRetractMmButtonLabel = lv_label_create(jogRetractMmButton);
	lv_label_set_text(jogRetractMmButtonLabel, "1mm");
	lv_obj_set_name(jogRetractMmButton, "jogRetractMmButton");
	lv_obj_center(jogRetractMmButtonLabel);
	lv_obj_align_to(jogRetractMmButton, jogRetractButton, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 5);
	lv_obj_add_state(jogRetractMmButton, LV_STATE_DISABLED);
	lv_obj_add_event_cb(jogRetractMmButton, uiButtonEventHandler, LV_EVENT_CLICKED, (void *)JOG_RETRACT_MM_BUTTON_CLICKED);
	lv_obj_set_height(jogRetractMmButton, LV_SIZE_CONTENT);
	lv_obj_set_width(jogRetractMmButton, LV_PCT(13));

	lv_obj_t * jogRetractTenthButton = lv_button_create(homeTab);
	lv_obj_t * jogRetractTenthButtonLabel = lv_label_create(jogRetractTenthButton);
	lv_label_set_text(jogRetractTenthButtonLabel, "0.1mm");
	lv_obj_set_name(jogRetractTenthButton, "jogRetractTenthButton");
	lv_obj_center(jogRetractTenthButtonLabel);
	lv_obj_align_to(jogRetractTenthButton, jogRetractButton, LV_ALIGN_OUT_BOTTOM_LEFT, lv_obj_get_width(jogRetractMmButton), 5);
	lv_obj_add_state(jogRetractTenthButton, LV_STATE_DISABLED);
	lv_obj_add_event_cb(jogRetractTenthButton, uiButtonEventHandler, LV_EVENT_CLICKED, (void *)JOG_RETRACT_TENTH_BUTTON_CLICKED);
	lv_obj_set_height(jogRetractTenthButton, LV_SIZE_CONTENT);
	lv_obj_set_width(jogRetractTenthButton, LV_PCT(13));

	lv_obj_t * jogExtendButton = lv_button_create(homeTab);
	lv_obj_t * jogExtendButtonLabel = lv_label_create(jogExtendButton);
	lv_label_set_text(jogExtendButtonLabel, "Jog extend");
	lv_obj_set_name(jogExtendButton, "jogExtendButton");
	lv_obj_center(jogExtendButtonLabel);
	lv_obj_align_to(jogExtendButton, startCycleButton, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 5);
	lv_obj_add_state(jogExtendButton, LV_STATE_DISABLED);
	lv_obj_add_event_cb(jogExtendButton, uiButtonEventHandler, LV_EVENT_PRESSED, (void *)JOG_EXTEND_BUTTON_PRESSED);
	lv_obj_add_event_cb(jogExtendButton, uiButtonEventHandler, LV_EVENT_RELEASED, (void *)JOG_EXTEND_BUTTON_RELEASED);
	lv_obj_set_height(jogExtendButton, LV_SIZE_CONTENT);
	lv_obj_set_width(jogExtendButton, LV_PCT(30));

	lv_obj_t * jogExtendTenthButton = lv_button_create(homeTab);
	lv_obj_t * jogExtendTenthButtonLabel = lv_label_create(jogExtendTenthButton);
	lv_label_set_text(jogExtendTenthButtonLabel, "0.1mm");
	lv_obj_set_name(jogExtendTenthButton, "jogExtendTenthButton");
	lv_obj_center(jogExtendTenthButtonLabel);
	lv_obj_align_to(jogExtendTenthButton, jogExtendButton, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 5);
	lv_obj_add_state(jogExtendTenthButton, LV_STATE_DISABLED);
	lv_obj_add_event_cb(jogExtendTenthButton, uiButtonEventHandler, LV_EVENT_CLICKED, (void *)JOG_EXTEND_TENTH_BUTTON_CLICKED);
	lv_obj_set_height(jogExtendTenthButton, LV_SIZE_CONTENT);
	lv_obj_set_width(jogExtendTenthButton, LV_PCT(13));

	lv_obj_t * jogExtendMmButton = lv_button_create(homeTab);
	lv_obj_t * jogExtendMmButtonLabel = lv_label_create(jogExtendMmButton);
	lv_label_set_text(jogExtendMmButtonLabel, "1mm");
	lv_obj_set_name(jogExtendMmButton, "jogExtendMmButton");
	lv_obj_center(jogExtendMmButtonLabel);
	lv_obj_align_to(jogExtendMmButton, jogExtendButton, LV_ALIGN_OUT_BOTTOM_RIGHT, 0, 5);
	lv_obj_add_state(jogExtendMmButton, LV_STATE_DISABLED);
	lv_obj_add_event_cb(jogExtendMmButton, uiButtonEventHandler, LV_EVENT_CLICKED, (void *)JOG_EXTEND_MM_BUTTON_CLICKED);
	lv_obj_set_height(jogExtendMmButton, LV_SIZE_CONTENT);
	lv_obj_set_width(jogExtendMmButton, LV_PCT(13));

	lv_obj_t * testProgressBar = lv_bar_create(homeTab);
	lv_obj_set_name(testProgressBar, "testProgressBar");
	lv_obj_set_size(testProgressBar, LV_PCT(90), LV_PCT(5));
	lv_obj_set_align(testProgressBar, LV_ALIGN_BOTTOM_MID);
	lv_bar_set_value(testProgressBar, 0, LV_ANIM_OFF);


	/*
	 * Settings tab widgets
	 */

	lv_obj_t * distanceTextAreaLabel = lv_label_create(settingsTab);
	lv_label_set_text(distanceTextAreaLabel, "Movement (mm)");
	lv_obj_align(distanceTextAreaLabel, LV_ALIGN_TOP_LEFT, 0, 0);

	lv_obj_t * distanceTextArea = lv_textarea_create(settingsTab);
	lv_obj_set_name(distanceTextArea, "distanceTextArea");
	lv_textarea_set_one_line(distanceTextArea, true);
	lv_textarea_set_accepted_chars(distanceTextArea, "0123456789");
	lv_textarea_set_max_length(distanceTextArea, 2);
	lv_obj_set_width(distanceTextArea, lv_pct(40));
	lv_obj_align_to(distanceTextArea, distanceTextAreaLabel, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 0);
	lv_obj_add_event_cb(distanceTextArea, settingsTextAreaEventHandler, LV_EVENT_ALL, NULL);

	lv_obj_t * timeTextAreaLabel = lv_label_create(settingsTab);
	lv_label_set_text(timeTextAreaLabel, "Runtime (min)");
	lv_obj_align(timeTextAreaLabel, LV_ALIGN_TOP_RIGHT, 0, 0);

	lv_obj_t * timeTextArea = lv_textarea_create(settingsTab);
	lv_obj_set_name(timeTextArea, "timeTextArea");
	lv_textarea_set_one_line(timeTextArea, true);
	lv_textarea_set_accepted_chars(timeTextArea, "0123456789");
	lv_textarea_set_max_length(timeTextArea, 5);
	lv_obj_set_width(timeTextArea, lv_pct(40));
	lv_obj_align_to(timeTextArea, timeTextAreaLabel, LV_ALIGN_OUT_BOTTOM_RIGHT, 0, 0);
	lv_obj_add_event_cb(timeTextArea, settingsTextAreaEventHandler, LV_EVENT_ALL, NULL);

	lv_obj_t * settingsKeyboard = lv_keyboard_create(settingsTab);
	lv_obj_set_name(settingsKeyboard, "settingsKeyboard");
	lv_obj_set_size(settingsKeyboard, LV_HOR_RES, (LV_VER_RES / 2));
	lv_keyboard_set_mode(settingsKeyboard, LV_KEYBOARD_MODE_NUMBER);
	lv_keyboard_set_textarea(settingsKeyboard, distanceTextArea);
	lv_obj_add_flag(settingsKeyboard, LV_OBJ_FLAG_HIDDEN);

	lv_unlock();

	lv_tick_set_cb(xTaskGetTickCount);

	float adcVoltage = 0.0;

	uint16_t diagUpdateInterval = 500; // Period which the diagnostics screen should be updated (ms)
	uint32_t lastDiagUpdateTime = 0;

	for (;;)
	{
		xQueueReceive(xAdcVoltageQueue, &adcVoltage, 0);

		/*
		 * Update diagnostics screen info
		 */
		if(HAL_GetTick() > lastDiagUpdateTime + diagUpdateInterval)
		{
			lv_lock();
			lv_label_set_text_fmt(voltageLabel, "ADC V: %.2fV", adcVoltage);
			lv_label_set_text_fmt(guiTaskWatermarkLabel, "guiTskWM: %lu", uxTaskGetStackHighWaterMark(xTaskGuiHandle));
			lv_label_set_text_fmt(adcTaskWatermarkLabel, "adcTskWM: %lu", uxTaskGetStackHighWaterMark(xTaskAdcHandle));
			lv_label_set_text_fmt(controlTaskWatermarkLabel, "controlTskWM: %lu", uxTaskGetStackHighWaterMark(xTaskProcessControlHandle));
			lv_label_set_text_fmt(loggerTaskWatermarkLabel, "loggerTskWM: %lu", uxTaskGetStackHighWaterMark(xTaskLoggerHandle));
			lv_label_set_text_fmt(systickLabel, "systick(s): %lu", (uint32_t)(HAL_GetTick() / 1000));

			!HAL_GPIO_ReadPin(LIMIT_SW_EXTEND_Port, LIMIT_SW_EXTEND_Pin) ? lv_led_on(extendLed) : lv_led_off(extendLed);
			!HAL_GPIO_ReadPin(LIMIT_SW_RETRACT_Port, LIMIT_SW_RETRACT_Pin) ? lv_led_on(retractLed) : lv_led_off(retractLed);
			lv_unlock();

			lastDiagUpdateTime = HAL_GetTick();
		}

		lv_timer_handler();
		lv_sleep_ms(20);
	}
}

void vTaskAdcPoll(void *pvParameters)
{
	/*
	 * This task polls the ADC periodically as dictated by adcPollInterval.
	 * TIM4 regularly generates a notification that a log message should be
	 * written, meaning that the ADC can be polled without writing every time.
	 * This in turn then drives the logging task by issuing log line messages
	 * to a queue. Those LogLine messages contain both the force and distance
	 * readings plus a timestamp.
	 *
	 * Having a simple delay implemented for ADC reading plus a notification from
	 * TIM4 means that the two can be decoupled, but the log lines are still
	 * written like clockwork (ish).
	 */
	uint8_t AdcConversionWaiting = 1;
	uint8_t AdcRawValue[2] = {0};
	uint8_t AdcReadTryCount = 0;
	float AdcVoltage = 0.0;
	float forceReading = 0.0;
	uint8_t AdcConfigRegister[2] = {0};
	uint8_t ADC_CONFIG_VALUE[3] = {0};
	RetractDistanceMessage_t retractMessage;

	uint16_t adcPollInterval = 1000; // ADC poll interval in ms
	uint32_t lastAdcPollTime = 0; // Last time ADC was polled

	LogLine_t logLine;

	/*
	 * Issue a general call reset to get the ADC ready
	 */
	ADC_CONFIG_VALUE[0] = 0x06;
	HAL_I2C_Master_Transmit(&hi2c1, (uint16_t) (0x00), ADC_CONFIG_VALUE, 1, 10);

	/*
	 * Check the contents of the ADC config register
	 */
	ADC_CONFIG_VALUE[0] = 0x01;
	HAL_I2C_Master_Transmit(&hi2c1, (uint16_t) (ADC_ADDRESS << 1), ADC_CONFIG_VALUE, 1, 10);
	if(HAL_I2C_Master_Receive(&hi2c1, (uint16_t) (ADC_ADDRESS << 1), AdcConfigRegister, 2, 10) == HAL_OK)
	{
		uint16_t adcConfigReg16Bit = (AdcConfigRegister[0] << 8 | AdcConfigRegister[1]);
		lv_lock();
		lv_label_set_text_fmt(lv_obj_find_by_name(lv_screen_active(), "adcStatusLabel"), "Conf 0x%X", adcConfigReg16Bit);
		lv_unlock();
	}

	/*
	 * Configure ADC to run at 64SPS, continuous conversion
	 */
	ADC_CONFIG_VALUE[0] = 0x01;
	ADC_CONFIG_VALUE[1] = 0x80;
	ADC_CONFIG_VALUE[2] = 0x63;
	HAL_I2C_Master_Transmit(&hi2c1, (uint16_t ) (ADC_ADDRESS << 1), ADC_CONFIG_VALUE, 3, 10);
	if(HAL_I2C_Master_Receive(&hi2c1, (uint16_t) (ADC_ADDRESS << 1), AdcConfigRegister, 2, 10) == HAL_OK)
	{
		uint16_t adcConfigReg16Bit = (AdcConfigRegister[0] << 8 | AdcConfigRegister[1]);
		if(adcConfigReg16Bit == 0x0063)
		{
			lv_lock();
			lv_label_set_text(lv_obj_find_by_name(lv_screen_active(), "adcStatusLabel"), "Conf OK");
			lv_unlock();
		} else {
			lv_lock();
			lv_label_set_text(lv_obj_find_by_name(lv_screen_active(), "adcStatusLabel"), "Conf FAIL");
			lv_unlock();
		}
	}

	for (;;)
	{
		/*
		 * Check if it's time to poll the ADC
		 */
		if(HAL_GetTick() > lastAdcPollTime + adcPollInterval)
		{
			AdcConversionWaiting = 1;

			/*
			 * Set address pointer to 0x01 (config reg)
			 */
			ADC_CONFIG_VALUE[0] = 0x01;
			HAL_I2C_Master_Transmit(&hi2c1, (uint16_t ) (ADC_ADDRESS << 1), ADC_CONFIG_VALUE, 1, 10);

			while(AdcConversionWaiting)
			{
				if(HAL_I2C_Master_Receive(&hi2c1, (uint16_t) (ADC_ADDRESS << 1), AdcConfigRegister, 2, 10) == HAL_OK)
				{
					if(AdcConfigRegister[0] == 0x00)
					{
						AdcConversionWaiting = 0;

						/*
						 * Set address pointer to 0x00 (conv. reg)
						 * then read out conversion reg
						 */
						ADC_CONFIG_VALUE[0] = 0x00;
						HAL_I2C_Master_Transmit(&hi2c1, (uint16_t) (ADC_ADDRESS << 1), ADC_CONFIG_VALUE, 1, 10);
						HAL_I2C_Master_Receive(&hi2c1, (uint16_t) (ADC_ADDRESS << 1), AdcRawValue, 2, 10);

						/*
						 * Convert reading to voltage and multiply by two to
						 * account for resistor divider on input
						 */
						AdcVoltage = (float) ((((int16_t)( AdcRawValue[0] << 8 | AdcRawValue[1])) * 6.144f) / 32768.0f) * 2.0f;

						/*
						 * Simple sanity checking on bounds of ADC voltage measurement
						 */

						if(AdcVoltage < 0.0)
						{
							AdcVoltage = 0.0;
						}

						if(AdcVoltage > 10.0)
						{
							AdcVoltage = 10.0;
						}

						/*
						 * Convert voltage to force
						 */
						forceReading = (5000.0 / 10.0) * AdcVoltage;
						xQueueSendToBack(xAdcVoltageQueue, &AdcVoltage, 0);

						lv_lock();
						lv_label_set_text_fmt(lv_obj_find_by_name(lv_screen_active(), "forceLabel"), "F: %.1fN", forceReading);
						lv_unlock();
					} else {
						AdcReadTryCount++;
					}

					if(AdcReadTryCount == 10)
					{
						lv_lock();
						lv_label_set_text(lv_obj_find_by_name(lv_screen_active(), "adcStatusLabel"), "Read FAIL");
						lv_unlock();
						break;
					}
				} else {
					break;
				}
			}

			lastAdcPollTime = HAL_GetTick();
		}

		xQueueReceive(xRetractionDistanceQueue, &retractMessage, 0);

		/*
		 * Check for notification from TIM4 interrupt to then write a log line
		 */
		if(ulTaskNotifyTake(pdTRUE, 0))
		{
			/*
			 * Publish logger message
			 */
			logLine.force = forceReading;
			logLine.distance = retractMessage.distance;
			logLine.runtime = retractMessage.runtime;
			xQueueSendToBack(xLogLineQueue, &logLine, 0);
		}

		AdcReadTryCount = 0;
		vTaskDelay(pdMS_TO_TICKS(10));
	}
}

void vTaskProcessControl(void * pvParameters)
{
	MachineState_t operationalState = MACHINE_DISABLED;
	uint32_t homeStepCount = 0;  // how many steps it takes to reach home position
	uint16_t stepsPerRevolution = 400; // how many pulses it takes to get a complete revolution on the stepper motor
	uint8_t ballscrewPitch = 5; // distance travelled per revolution of the input (i.e. per stepper motor revolution)
	uint32_t totalRunTime = 0; // test run time in milliseconds (uint32_t gives a maximum value of approximately 49 days of runtime)
	uint32_t totalStepsToMove = 0; // how many steps need to be moved total
	uint64_t stepInterval = 0; // time in milliseconds between steps
	uint64_t lastStepTime = 0; // time in milliseconds since the last step was taken
	uint32_t currentStepCount = 0; // current step count in move
	float progressPercentage = 0; // test cycle percentage
	float currentPosition = 0.0; // current motor position from home in mm
	uint32_t uiButtonsCallbackValue = 0; // return value from UI buttons callback
	uint32_t retractStartTime = 0; // retract cycle start time, used as relative time for logging
	uint8_t loopCounter = 0; // loop counter to update things at a slower rate than loop (i.e. 20ms or even 200ms)

	RetractDistanceMessage_t retractMessage;

	bool retractHome = false;
	bool extendHome = false;
	bool moveWarning = false;
	bool isMoving = false;

	for(;;)
	{
		retractHome = !HAL_GPIO_ReadPin(LIMIT_SW_RETRACT_Port, LIMIT_SW_RETRACT_Pin);
		extendHome = !HAL_GPIO_ReadPin(LIMIT_SW_EXTEND_Port, LIMIT_SW_EXTEND_Pin);

		loopCounter++;
		if(loopCounter % 25 == 0)
		{
			currentPosition = (float)currentStepCount * ((float)(ballscrewPitch) / (float)(stepsPerRevolution));
			lv_lock();
			lv_label_set_text_fmt(lv_obj_find_by_name(lv_screen_active(), "distanceLabel"), "D: %.2fmm", currentPosition);
			lv_unlock();
		}

		/*
		 * Force disabled state if the enable machine button is unchecked
		 * notification is sent from the UI buttons callback
		 */
		xTaskNotifyWait(0, 0, &uiButtonsCallbackValue, 0);
		if(uiButtonsCallbackValue == ENABLE_BUTTON_UNCHECKED)
		{
			operationalState = MACHINE_DISABLED;
			ulTaskNotifyValueClear(xTaskProcessControlHandle, ULONG_MAX);

			/*
			 * Stop logger task
			 */
			xTaskNotify(xTaskLoggerHandle, (uint32_t) LOG_STOP, eSetValueWithOverwrite);
		}

		switch(operationalState)
		{
			case MACHINE_DISABLED:
				HAL_GPIO_WritePin(STEPPER_ENABLE_Port, STEPPER_ENABLE_Pin, GPIO_PIN_SET);
				HAL_GPIO_WritePin(STEPPER_DIRECTION_Port, STEPPER_DIRECTION_Pin, GPIO_PIN_SET);

				moveWarning = false;

				/*
				 * Check if enable button is pressed, then move to idle state
				 */

				if(uiButtonsCallbackValue == ENABLE_BUTTON_CHECKED)
				{
					operationalState = MACHINE_IDLE;
					ulTaskNotifyValueClear(xTaskProcessControlHandle, ULONG_MAX);
					lv_lock();
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "homeAxisButton"), LV_STATE_DISABLED);
					lv_unlock();

				} else {
					/*
					lv_lock();
					lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "homeAxisButton"), LV_STATE_DISABLED);
					lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "startCycleButton"), LV_STATE_DISABLED);
					lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "jogRetractButton"), LV_STATE_DISABLED);
					lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "jogExtendButton"), LV_STATE_DISABLED);
					lv_unlock();
					*/
				}
				break;

			case MACHINE_IDLE:
				/*
				 * Enable stepper motor driver
				 */
				HAL_GPIO_WritePin(STEPPER_ENABLE_Port, STEPPER_ENABLE_Pin, GPIO_PIN_RESET);

				if(uiButtonsCallbackValue == HOME_BUTTON)
				{
					operationalState = HOME_RETRACT;
					ulTaskNotifyValueClear(xTaskProcessControlHandle, ULONG_MAX);
					lv_lock();
					lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "homeAxisButton"), LV_STATE_DISABLED);
					lv_unlock();
				}
				break;

			case HOME_RETRACT:
				HAL_GPIO_WritePin(STEPPER_DIRECTION_Port, STEPPER_DIRECTION_Pin, GPIO_PIN_SET);
				TIM2->CR1 |= TIM_CR1_CEN;

				if(retractHome)
				{
					homeStepCount = 0;
					operationalState = HOME_EXTEND;
				}
				break;

			case HOME_EXTEND:
				HAL_GPIO_WritePin(STEPPER_DIRECTION_Port, STEPPER_DIRECTION_Pin, GPIO_PIN_RESET);
				TIM2->CR1 |= TIM_CR1_CEN;
				homeStepCount++;

				if(extendHome)
				{
					operationalState = HOME_IDLE;
					lv_lock();
					lv_label_set_text_fmt(lv_obj_find_by_name(lv_screen_active(), "counterLabel"), "Homing steps: %lu\ndistance: %.1f", homeStepCount, (((float)homeStepCount / (float)stepsPerRevolution) * (float)ballscrewPitch));
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "startCycleButton"), LV_STATE_DISABLED);
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "jogRetractButton"), LV_STATE_DISABLED);
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "jogExtendButton"), LV_STATE_DISABLED);
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "jogRetractMmButton"), LV_STATE_DISABLED);
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "jogRetractTenthButton"), LV_STATE_DISABLED);
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "jogExtendMmButton"), LV_STATE_DISABLED);
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "jogExtendTenthButton"), LV_STATE_DISABLED);
					lv_unlock();
				}
				break;

			case HOME_IDLE:
				if(uiButtonsCallbackValue == START_CYCLE_BUTTON)
				{
					ulTaskNotifyValueClear(xTaskProcessControlHandle, ULONG_MAX);
					lv_lock();
					const char* distanceString = lv_textarea_get_text(lv_obj_find_by_name(lv_screen_active(), "distanceTextArea"));
					const char* timeString = lv_textarea_get_text(lv_obj_find_by_name(lv_screen_active(), "timeTextArea"));
					sscanf(distanceString, "%lu", &totalStepsToMove);
					sscanf(timeString, "%lu", &totalRunTime);

					/*
					 * Sanity check values
					 */
					if(totalStepsToMove != 0 && totalRunTime != 0)
					{
						if(totalStepsToMove >  MAX_MOVE_DISTANCE)
						{
							lv_textarea_set_text(lv_obj_find_by_name(lv_screen_active(), "distanceTextArea"), (const char *)MAX_MOVE_DISTANCE);
							totalStepsToMove = MAX_MOVE_DISTANCE;
						}

						if(totalRunTime > MAX_RUN_TIME)
						{
							lv_textarea_set_text(lv_obj_find_by_name(lv_screen_active(), "timeTextArea"), (const char *)MAX_RUN_TIME);
							totalRunTime = MAX_RUN_TIME;
						}

						/*
						 * Calculate steps to take and the interval between steps
						 */
						currentStepCount = 0;
						totalRunTime = (totalRunTime * 60) * 1000; // Currently, runtime is entered as minutes so needs converting to ms
						totalStepsToMove = ((float)((totalStepsToMove) / ballscrewPitch)) * stepsPerRevolution;
						stepInterval = floor((float)(totalRunTime / totalStepsToMove));

						/*
						 * Disable UI controls
						 */
						lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "homeAxisButton"), LV_STATE_DISABLED);
						lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "startCycleButton"), LV_STATE_DISABLED);
						lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "jogRetractButton"), LV_STATE_DISABLED);
						lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "jogExtendButton"), LV_STATE_DISABLED);
						lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "jogRetractMmButton"), LV_STATE_DISABLED);
						lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "jogRetractTenthButton"), LV_STATE_DISABLED);
						lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "jogExtendMmButton"), LV_STATE_DISABLED);
						lv_obj_add_state(lv_obj_find_by_name(lv_screen_active(), "jogExtendTenthButton"), LV_STATE_DISABLED);

						/*
						 * Take note of start time when we move into RETRACT
						 * state to accurately log entries.
						 * Send item to log queue with
						 */
						retractStartTime = HAL_GetTick();

						/*
						 * Notify logger task that we should start logging
						 */
						xTaskNotify(xTaskLoggerHandle, (uint32_t) LOG_START, eSetValueWithOverwrite);

						/*
						 * Start TIM4 running to trigger ADC task
						 * The ADC task also drives the logger task by sending notifications
						 */
						HAL_TIM_Base_Start_IT(&htim4);

						/*
						 * Begin movement
						 */
						operationalState = RETRACT;

					} else {
						/*
						 * move to settings tab to prompt user to fill in values
						 */
						lv_tabview_set_active(lv_obj_find_by_name(lv_screen_active(), "tabview"), 1, LV_ANIM_ON);
					}
					lv_unlock();
				}

				if(uiButtonsCallbackValue == JOG_RETRACT_BUTTON_PRESSED || uiButtonsCallbackValue == JOG_RETRACT_BUTTON_RELEASED || uiButtonsCallbackValue ==  JOG_RETRACT_TENTH_BUTTON_CLICKED || uiButtonsCallbackValue == JOG_RETRACT_MM_BUTTON_CLICKED)
				{
					operationalState = JOG_RETRACT;
				}

				if(uiButtonsCallbackValue == JOG_EXTEND_BUTTON_PRESSED || uiButtonsCallbackValue == JOG_EXTEND_BUTTON_RELEASED || uiButtonsCallbackValue == JOG_EXTEND_TENTH_BUTTON_CLICKED || uiButtonsCallbackValue == JOG_EXTEND_MM_BUTTON_CLICKED)
				{
					operationalState = JOG_EXTEND;
				}
				break;

			case RETRACT:
				/*
				 * This function is used to apply force to the sample during a
				 * test cycle. It produces step pulses at the correct interval
				 * to move the specified distance in the time provided.
				 */
				HAL_GPIO_WritePin(STEPPER_DIRECTION_Port, STEPPER_DIRECTION_Pin, GPIO_PIN_SET);

				/*
				 * Check if it's time to take a step and we're not on the limit
				 */
				if(HAL_GetTick() > lastStepTime + stepInterval && !retractHome)
				{
					/*
					 * Check if we still have steps to move and then move
					 */
					if(currentStepCount < totalStepsToMove)
					{
						currentStepCount++;
						TIM2->CR1 |= TIM_CR1_CEN;
						lastStepTime = HAL_GetTick();

						/*
						 * Publish retraction distance message to the queue
						 */
						retractMessage.starttime = retractStartTime;
						retractMessage.runtime = (lastStepTime - retractStartTime);
						retractMessage.distance = (float)(currentStepCount * ((float)(ballscrewPitch) / (float)(stepsPerRevolution)));
						xQueueSendToBack(xRetractionDistanceQueue, &retractMessage, 0);

						/*
						 * Update distance label and progress bar
						 */
						progressPercentage = ((float)currentStepCount / (float)totalStepsToMove) * 100; // convert current step count into percentage

						lv_lock();
						lv_bar_set_value(lv_obj_find_by_name(lv_screen_active(), "testProgressBar"), (int32_t)progressPercentage, LV_ANIM_ON);
						lv_unlock();

					} else {
						/*
						 * ...otherwise we've completed the move
						 * Return to idle state, signal to user that the move
						 * has been completed by opening a dialog box.
						 * Also signals to logger task to close the currently
						 * open file handle.
						 */

						lv_lock();
						lv_bar_set_value(lv_obj_find_by_name(lv_screen_active(), "testProgressBar"), 100, LV_ANIM_OFF);
						createCycleCompleteMessageBox();
						lv_unlock();

						/*
						 * Stop TIM4 to pause the ADC task
						 */
						HAL_TIM_Base_Stop_IT(&htim4);

						/*
						 * Stop logger task
						 */
						xTaskNotify(xTaskLoggerHandle, (uint32_t) LOG_STOP, eSetValueWithOverwrite);

						operationalState = COMPLETED;
					}
				}

				/*
				 * Set warning flag in case we exceed the step count
				 * TODO: consider adding some kind of hysteresis to this as a
				 * software limit in case of sensor failure
				 */
				if(currentStepCount > homeStepCount)
				{
					moveWarning = true;
				}

				break;

			case EXTEND:
				/*
				 * This function is used to unload the sample after a test
				 * cycle has been completed. It moves the same amount of
				 * steps moved during the test, but in the opposite direction.
				 */
				HAL_GPIO_WritePin(STEPPER_DIRECTION_Port, STEPPER_DIRECTION_Pin, GPIO_PIN_RESET);

				/*
				 * Check if we still have steps to move and then move
				 */
				if(currentStepCount > 0 && !extendHome)
				{
					currentStepCount--;
					TIM2->CR1 |= TIM_CR1_CEN;
				} else {
					/*
					 * Delete the waiting message box, return to home idle as
					 * the actuator should be back in the home position
					 */
					lv_lock();
					lv_msgbox_close_async(lv_obj_find_by_name(lv_screen_active(), "unloadingMsgBox"));
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "startCycleButton"), LV_STATE_DISABLED);
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "jogRetractButton"), LV_STATE_DISABLED);
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "jogExtendButton"), LV_STATE_DISABLED);
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "jogRetractMmButton"), LV_STATE_DISABLED);
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "jogRetractTenthButton"), LV_STATE_DISABLED);
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "jogExtendMmButton"), LV_STATE_DISABLED);
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "jogExtendTenthButton"), LV_STATE_DISABLED);
					lv_unlock();
					operationalState = HOME_IDLE;
				}
				break;

			case JOG_EXTEND:
				HAL_GPIO_WritePin(STEPPER_DIRECTION_Port, STEPPER_DIRECTION_Pin, GPIO_PIN_RESET);

				/*
				 * Extend the actuator as long as the jog button is pressed
				 */
				if(uiButtonsCallbackValue == JOG_EXTEND_BUTTON_PRESSED)
				{
					if(currentStepCount > 0 && !extendHome)
					{
						currentStepCount--;
						TIM2->CR1 |= TIM_CR1_CEN;
					} else {
						ulTaskNotifyValueClear(xTaskProcessControlHandle, ULONG_MAX);
						lv_lock();
						createJogWarningMessageBox();
						lv_unlock();
					}
				}

				if(uiButtonsCallbackValue == JOG_EXTEND_BUTTON_RELEASED)
				{
					ulTaskNotifyValueClear(xTaskProcessControlHandle, ULONG_MAX);
					operationalState = HOME_IDLE;
				}

				/*
				 * Extend either 0.1mm or 1mm depending on which button was clicked
				 */
				if(uiButtonsCallbackValue == JOG_EXTEND_TENTH_BUTTON_CLICKED || uiButtonsCallbackValue == JOG_EXTEND_MM_BUTTON_CLICKED)
				{
					if(!isMoving)
					{
						if(uiButtonsCallbackValue == JOG_EXTEND_TENTH_BUTTON_CLICKED) totalStepsToMove = ((float)(0.1 / ballscrewPitch)) * stepsPerRevolution;
						if(uiButtonsCallbackValue == JOG_EXTEND_MM_BUTTON_CLICKED) totalStepsToMove = ((float)(1.0 / ballscrewPitch)) * stepsPerRevolution;

						/*
						 * Check that we can make the requested jog distance
						 */
						if(currentStepCount > totalStepsToMove)
						{
							isMoving = true;
						} else {
							lv_lock();
							createJogWarningMessageBox();
							lv_unlock();
							operationalState = HOME_IDLE;
						}
					}
					ulTaskNotifyValueClear(xTaskProcessControlHandle, ULONG_MAX);
				}

				if(isMoving && !extendHome && currentStepCount > 0 && totalStepsToMove > 0)
				{
					currentStepCount--;
					totalStepsToMove--;
					TIM2->CR1 |= TIM_CR1_CEN;
				} else {
					isMoving = false;
					operationalState = HOME_IDLE;
				}
				break;

			case JOG_RETRACT:
				HAL_GPIO_WritePin(STEPPER_DIRECTION_Port, STEPPER_DIRECTION_Pin, GPIO_PIN_SET);

				/*
				 * Retract the actuator as long as the jog button is pressed
				 */
				if(uiButtonsCallbackValue == JOG_RETRACT_BUTTON_PRESSED)
				{
					if(currentStepCount < homeStepCount && !retractHome)
					{
						currentStepCount++;
						TIM2->CR1 |= TIM_CR1_CEN;
					} else {
						ulTaskNotifyValueClear(xTaskProcessControlHandle, ULONG_MAX);
						lv_lock();
						createJogWarningMessageBox();
						lv_unlock();
					}
				}

				if(uiButtonsCallbackValue == JOG_RETRACT_BUTTON_RELEASED)
				{
					ulTaskNotifyValueClear(xTaskProcessControlHandle, ULONG_MAX);
					operationalState = HOME_IDLE;
				}

				/*
				 * Retract either 0.1mm or 1mm depending on which button was clicked
				 */
				if(uiButtonsCallbackValue == JOG_RETRACT_TENTH_BUTTON_CLICKED || uiButtonsCallbackValue == JOG_RETRACT_MM_BUTTON_CLICKED)
				{
					if(!isMoving)
					{
						if(uiButtonsCallbackValue == JOG_RETRACT_TENTH_BUTTON_CLICKED) totalStepsToMove = ((float)(0.1 / ballscrewPitch)) * stepsPerRevolution;
						if(uiButtonsCallbackValue == JOG_RETRACT_MM_BUTTON_CLICKED) totalStepsToMove = ((float)(1.0 / ballscrewPitch)) * stepsPerRevolution;

						/*
						 * Check that we can make the requested jog distance
						 */
						if(currentStepCount + totalStepsToMove < homeStepCount && !retractHome)
						{
							isMoving = true;
						} else {
							lv_lock();
							createJogWarningMessageBox();
							lv_unlock();
							operationalState = HOME_IDLE;
						}
					}
					ulTaskNotifyValueClear(xTaskProcessControlHandle, ULONG_MAX);
				}

				if(isMoving && totalStepsToMove > 0 && currentStepCount < homeStepCount && !retractHome)
				{
					currentStepCount++;
					totalStepsToMove--;
					TIM2->CR1 |= TIM_CR1_CEN;
				} else {
					isMoving = false;
					operationalState = HOME_IDLE;
				}
				break;

			case COMPLETED:
				/*
				 * Wait for notification from message box buttons and then
				 * begin to extend the cylinder to unload.
				 */
				if(uiButtonsCallbackValue == END_CYCLE_UNLOAD_BUTTON)
				{
					ulTaskNotifyValueClear(xTaskProcessControlHandle, ULONG_MAX);
					lv_lock();
					/*
					 * Delete the cycle complete message box
					 */
					lv_msgbox_close_async(lv_obj_find_by_name(lv_screen_active(), "cycleCompleteMsgBox"));

					/*
					 * Create a new message box advising user to wait for
					 * unloading process to complete
					 */
					lv_obj_t * unloadingMsgBox = lv_msgbox_create(lv_screen_active());
					lv_obj_set_name(unloadingMsgBox, "unloadingMsgBox");
					lv_msgbox_add_title(unloadingMsgBox, "Test cycle unloading");
					lv_msgbox_add_text(unloadingMsgBox, "Test cycle unloading, please wait.");
					lv_unlock();

					operationalState = EXTEND;
				}
				else if(uiButtonsCallbackValue == END_CYCLE_CANCEL_BUTTON)
				{
					ulTaskNotifyValueClear(xTaskProcessControlHandle, ULONG_MAX);
					lv_lock();
					lv_obj_remove_state(lv_obj_find_by_name(lv_screen_active(), "homeAxisButton"), LV_STATE_DISABLED);
					lv_unlock();
					operationalState = MACHINE_IDLE;
				}

				lv_lock();
				lv_bar_set_value(lv_obj_find_by_name(lv_screen_active(), "testProgressBar"), 0, LV_ANIM_OFF);
				lv_unlock();
				break;

			case MACHINE_ERROR:
				break;
		}

		vTaskDelay(pdMS_TO_TICKS(2));
	}
}

void vTaskLogger(void * pvParameters)
{
	FRESULT res; /* FatFs function common result code */
	DIR dir; /* directory handle */
	FILINFO fno; /* file info structure */
	uint32_t byteswritten; /* File write/read counts */
	int16_t i, index = -1; /* File name index */
	LogLine_t logLine; /* log line */
	uint8_t loggerState = LOG_IDLE; /* Logger state */
	uint32_t logControlMessage = LOG_IDLE;

	uint8_t csvHeader[] = "runtime(s),extension(mm),force(N)\n\0";
	uint8_t logFileExt[] = ".CSV";
	uint8_t logBuffer[128];
	char newFilename[13];

	MX_SDMMC1_SD_Init();
	MX_FATFS_Init();

	for(;;)
	{
		xTaskNotifyWait(0, ULONG_MAX, &logControlMessage, pdMS_TO_TICKS(50));

		switch(loggerState)
		{
			case LOG_IDLE:
				if(logControlMessage == LOG_START) loggerState = LOG_START;
				break;

			case LOG_START:
				res = f_mount(&SDFatFS, "", 1);

				if(res != FR_OK)
				{
					lv_lock();
					lv_label_set_text_fmt(lv_obj_find_by_name(lv_screen_active(), "loggerTaskStatusLabel"), "Could not mount SD card, %X\n\r", res);
					lv_unlock();

					loggerState = LOG_STOP;
				} else {

					/*
					 * Find next file name to create
					 */
					if(f_opendir(&dir, "") == FR_OK)
					{
						while(1)
						{
							/*
							 * check if we couldn't find any files or the file name is null
							 */
							if((f_readdir(&dir, &fno) != FR_OK) || (fno.fname[0] == 0))
							{
								break;
							}

							/*
							 * parse found filename to extract just the number
							 */
							if((strstr(fno.fname, logFileExt) != NULL) && (sscanf(fno.fname, "%hd", &i) == 1))
							{
								if(i > index) index = i;
							}
						}

						snprintf(newFilename, 13, "%03d%s", (index + 1), logFileExt);
					}

					res = f_open(&SDFile, newFilename, FA_CREATE_ALWAYS | FA_WRITE);
					if(res != FR_OK)
					{
						lv_lock();
						lv_label_set_text_fmt(lv_obj_find_by_name(lv_screen_active(), "loggerTaskStatusLabel"), "Could not open/create %s, %X\n\r", newFilename, res);
						lv_unlock();

						loggerState = LOG_STOP;
					} else {
						/*
						 * Write header to file
						 */
						byteswritten = f_puts(csvHeader, &SDFile);

						if(byteswritten == 0)
						{
							lv_lock();
							lv_label_set_text_fmt(lv_obj_find_by_name(lv_screen_active(), "loggerTaskStatusLabel"), "Could not write header to %s, %X\n\r", newFilename, res);
							lv_unlock();

							loggerState = LOG_STOP;
						} else {
							lv_lock();
							lv_label_set_text_fmt(lv_obj_find_by_name(lv_screen_active(), "logFilenameLabel"), "%s", newFilename);
							lv_label_set_text_fmt(lv_obj_find_by_name(lv_screen_active(), "loggerTaskStatusLabel"), "Started logger");
							lv_unlock();
							loggerState = LOG_RUNNING;
						}
					}
				}
				break;

			case LOG_RUNNING:
				if(xQueueReceive(xLogLineQueue, &logLine, 0) == pdPASS)
				{
					snprintf(logBuffer, 128, "%lu,%2.1f,%3.2f\n", (logLine.runtime / 1000), logLine.distance, logLine.force);

					byteswritten = f_puts(logBuffer, &SDFile);

					if(byteswritten == 0)
					{
						lv_lock();
						lv_label_set_text_fmt(lv_obj_find_by_name(lv_screen_active(), "loggerTaskStatusLabel"), "Could not write log entry to %s, %X\n\r", newFilename, res);
						lv_unlock();

						loggerState = LOG_STOP;
					}
				}

				if(logControlMessage == LOG_STOP) loggerState = LOG_STOP;
				break;

			case LOG_STOP:
				lv_lock();
				lv_label_set_text_fmt(lv_obj_find_by_name(lv_screen_active(), "loggerTaskStatusLabel"), "Stopped logger");
				lv_unlock();
				f_close(&SDFile);
				f_mount(NULL, "", 0);
				loggerState = LOG_IDLE;
				break;
		}
	}
}

void settingsTextAreaEventHandler(lv_event_t * e)
{
	lv_event_code_t code = lv_event_get_code(e);
	lv_obj_t * textArea = lv_event_get_target_obj(e);

	if(code == LV_EVENT_CLICKED || code == LV_EVENT_FOCUSED)
	{
		/*
		 * Move keyboard focus to selected text area
		 */
		if(lv_obj_find_by_name(lv_screen_active(), "settingsKeyboard") != NULL)
		{
			lv_obj_remove_flag(lv_obj_find_by_name(lv_screen_active(), "settingsKeyboard"), LV_OBJ_FLAG_HIDDEN);
			lv_keyboard_set_textarea(lv_obj_find_by_name(lv_screen_active(), "settingsKeyboard"), textArea);
		}
	}
	else if(code == LV_EVENT_READY)
	{
		const char* distanceString = lv_textarea_get_text(lv_obj_find_by_name(lv_screen_active(), "distanceTextArea"));;
		const char* timeString = lv_textarea_get_text(lv_obj_find_by_name(lv_screen_active(), "timeTextArea"));;
		uint16_t distanceValue;
		sscanf(distanceString, "%hu", &distanceValue);
		uint32_t timeValue;
		sscanf(timeString, "%lu", &timeValue);
		if(distanceValue > 0 && timeValue > 0)
		{
			lv_obj_add_flag(lv_obj_find_by_name(lv_screen_active(), "settingsKeyboard"), LV_OBJ_FLAG_HIDDEN);
			lv_tabview_set_active(lv_obj_find_by_name(lv_screen_active(), "tabview"), 0, LV_ANIM_ON);
		}
	}
}

void cycleCompleteMsgBoxBtnHandler(lv_event_t * e)
{
	lv_obj_t * btn = lv_event_get_target_obj(e);
	if(btn != NULL)
	{
		uint8_t *userData = (uint8_t *)lv_event_get_user_data(e);

		if(userData == END_CYCLE_CANCEL_BUTTON)
		{
			lv_obj_t * msgBoxHandle = lv_obj_find_by_name(lv_screen_active(), "cycleCompleteMsgBox");
			if(msgBoxHandle != NULL)
			{
				lv_msgbox_close_async(msgBoxHandle);
			}
		}

		/*
		 * Notify process control task of what button was clicked from the
		 * message box (unload or cancel)
		 */
		xTaskNotify(xTaskProcessControlHandle, (uint32_t) userData, eSetValueWithOverwrite);
	}
}

void uiButtonEventHandler(lv_event_t * e)
{
	lv_obj_t * btn = lv_event_get_target_obj(e);
	if(btn != NULL)
	{
		uint8_t *userData = (uint8_t *) lv_event_get_user_data(e);
		xTaskNotify(xTaskProcessControlHandle, (uint32_t) userData, eSetValueWithOverwrite);
	}

	/*
	 * Handle press/release events for jog buttons
	 */
}

void enableButtonEventHandler(lv_event_t * e)
{
	lv_obj_t * btn = lv_event_get_target_obj(e);
	if(lv_obj_has_state(btn, LV_STATE_CHECKED))
	{
		xTaskNotify(xTaskProcessControlHandle, (uint32_t) ENABLE_BUTTON_CHECKED, eSetValueWithOverwrite);
	}
	if(!lv_obj_has_state(btn, LV_STATE_CHECKED))
	{
		xTaskNotify(xTaskProcessControlHandle, (uint32_t) ENABLE_BUTTON_UNCHECKED, eSetValueWithOverwrite);
	}

}

void createCycleCompleteMessageBox()
{
	/*
	 * Message box for completion of test cycle
	 */
	lv_obj_t * cycleCompleteMsgBox = lv_msgbox_create(lv_screen_active());
	lv_obj_set_name(cycleCompleteMsgBox, "cycleCompleteMsgBox");
	lv_msgbox_add_title(cycleCompleteMsgBox, "Test cycle complete");
	lv_msgbox_add_text(cycleCompleteMsgBox, "Test cycle completed. Return to unloaded position?");
	uint8_t buttonData;

	lv_obj_t * cycleCompleteMsgBoxButton;
	cycleCompleteMsgBoxButton = lv_msgbox_add_footer_button(cycleCompleteMsgBox, "Unload");
	buttonData = END_CYCLE_UNLOAD_BUTTON;
	lv_obj_add_event_cb(cycleCompleteMsgBoxButton, cycleCompleteMsgBoxBtnHandler, LV_EVENT_CLICKED, (void *) buttonData);
	cycleCompleteMsgBoxButton = lv_msgbox_add_footer_button(cycleCompleteMsgBox, "Cancel");
	buttonData = END_CYCLE_CANCEL_BUTTON;
	lv_obj_add_event_cb(cycleCompleteMsgBoxButton, cycleCompleteMsgBoxBtnHandler, LV_EVENT_CLICKED, (void *) buttonData);
}

void createJogWarningMessageBox()
{
	lv_obj_t * mbox1 = lv_msgbox_create(NULL);
	lv_msgbox_add_title(mbox1, "Jog warning");
	lv_msgbox_add_text(mbox1, "Unable to jog the requested amount. This is due to the axis being close to the limits or an endstop being triggered.");
	lv_msgbox_add_close_button(mbox1);
}
uint32_t roundToMultiple(uint32_t value, uint32_t multiple)
{
	return (value + (multiple / 2)) / multiple * multiple;
}


/* USER CODE END Application */

