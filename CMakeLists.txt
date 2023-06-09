# cmake ../.. -DCMAKE_BUILD_TYPE=Release
# cmake ../.. -DCMAKE_BUILD_TYPE=Release -G "Visual Studio 16 2019 Win64"
# cmake -DCMAKE_TOOLCHAIN_FILE=../../cmake/armv8.cmake ../.. 

cmake_minimum_required(VERSION 3.22)

project()(cxx_examples)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -fPIC")
if (BUILD_CHECK_MEMORY)
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive -std=c++17 -fsanitize=address -fno-omit-frame-pointer -fsanitize=leak -ggdb")
endif()

set(MY_SYSTEM_NAME "unknown")
set(MY_SYSTEM_PROCESSOR "unknown")
string(TOLOWER ${CMAKE_SYSTEM_NAME} MY_SYSTEM_NAME)
string(TOLOWER ${CMAKE_SYSTEM_PROCESSOR} MY_SYSTEM_PROCESSOR)

if (CMAKE_SYSTEM_NAME MATCHES "Linux")
	message(STATUS "current platform: Linux")
else ()
	message(STATUS "other platform: ${CMAKE_SYSTEM_NAME}")
endif()

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib/${MY_SYSTEM_NAME}/${MY_SYSTEM_PROCESSOR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib/${MY_SYSTEM_NAME}/${MY_SYSTEM_PROCESSOR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin/${MY_SYSTEM_NAME}/${MY_SYSTEM_PROCESSOR})
set(CMAKE_PDB_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin/${MY_SYSTEM_NAME}/${MY_SYSTEM_PROCESSOR})

ADD_SUBDIRECTORY(src/shared_lib)
ADD_SUBDIRECTORY(src/static_lib)
ADD_SUBDIRECTORY(src/static_shared_lib)
ADD_SUBDIRECTORY(src/main)
