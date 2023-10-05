include(CMakeForceCompiler)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_CROSSCOMPILING 1)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_SYSROOT /usr/arm-none-eabi)
# set(CMAKE_STAGING_PREFIX /home/devel/stage)

set(tools /usr/bin/arm-none-eabi-)
set(CMAKE_C_COMPILER ${tools}gcc)
set(CMAKE_CXX_COMPILER ${tools}g++)

#set(ARCH_CPU_FLAGS "-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -DUSE_HAL_DRIVER -DSTM32F407xx -Og -Wall -fdata-sections -ffunction-sections")
set(ARCH_CPU_FLAGS "-mcpu=arm926ej-s -march=armv5tej -O0 ")
set(ARCH_OPT_FLAGS "")

#set(ARCH_CPU_FLAGS -mcpu=cortex-m4)
#set(ARCH_OPT_FLAGS -mthumb)

#set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
#set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_C_FLAGS "${ARCH_CPU_FLAGS} ${ARCH_OPT_FLAGS}" CACHE STRING "" FORCE)
#set(CMAKE_EXE_LINKER_FLAGS "-T${port_ws}/@LINKER_SCRIPT@")

if(FALSE)
set(CMAKE_EXE_LINKER_FLAGS "-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -specs=nano.specs -T/workspaces/freertos-olimex-e407-port/STM32F407ZGTx_FLASH.ld  -lc -lm -lnosys  -Wl,-Map=/workspaces/freertos-olimex-e407-port/build/freertos_lwip.map,--cref -Wl,--gc-sections")
set(CMAKE_C_STANDARD_LIBRARIES "-lc -lm -lnosys")

set(CMAKE_CXX_FLAGS_INIT "-std=c++14 ${ARCH_CPU_FLAGS} ${ARCH_OPT_FLAGS} " CACHE STRING "" FORCE)
endif()

#set(CMAKE_CXX_STANDARD_LIBRARIES "-lstdc++")


include_directories(
    ./arm_port/FreeRTOS
    ./arm_port/FreeRTOS/include
    ./arm_port/lwip
    #/usr/arm-none-eabi/include
)
set(__BIG_ENDIAN__ 0)