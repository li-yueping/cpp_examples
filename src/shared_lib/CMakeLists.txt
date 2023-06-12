cmake_minimum_required(VERSION 3.15)

set(BUILD_PROJECT_NAME "shared_lib")
project(${BUILD_PROJECT_NAME} VERSION 1.0 LANGUAGES CXX)

message(STATUS "CMAKE_BUILD_TYPE='${CMAKE_BUILD_TYPE}'")
message(STATUS "Start build project, BUILD_PROJECT_NAME = '${BUILD_PROJECT_NAME}'")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

#-------------------------宏定义-------------------------
if(WIN32)
    add_definitions()
else()
    add_definitions(-DLinux)
endif()

#-------------------------头文件路径-------------------------
# 设置头文件路径
if(CMAKE_SYSTEM_NAME MATCHES "Windows")
    include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../include)
else()
    include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../third_party/jsoncpp/include)
endif()

# 打印头文件路径
get_property(INC_DIRS DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
foreach(INC_DIR ${INC_DIRS})
    message(STATUS "    include directory='${INC_DIR}'")
endforeach()

#-------------------------库文件路径-------------------------
# 设置库文件路径
if(CMAKE_SYSTEM_NAME MATCHES "Windows")
    if(CMAKE_BUILD_TYPE MATCHES Debug)
    else()
    endif()
else() # not windows
    link_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../third_party/jsoncpp/lib)
    #LINK_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/../../third_party/jsoncpp/lib/${CMAKE_SYSTEM_PROCESSOR})
    if(CMAKE_BUILD_TYPE MATCHES Debug)
    else()
    endif()
endif()

# 打印库文件路径
get_property(LINK_DIRS DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY LINK_DIRECTORIES)
foreach(LINK_DIR ${LINK_DIRS})
    message(STATUS "    link directory='${LINK_DIR}'")
endforeach()

#-------------------------工程源文件-------------------------
#[[
# 自动查找当前文件夹中的所有相关文件
file(GLOB SOURCE_FILES "./*.cpp") 
file(GLOB HEADER_FILES "./*.h") 
add_extcutable(${PROJECT_NAME} ${SOURCE_FILES } ${HEADER_FILES})
]]
set(SRC_LIST
    ${CMAKE_CURRENT_SOURCE_DIR}/shared_lib.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/shared_lib.h
)

# 头文件
source_group(Header Files FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/shared_lib.h
)

# 源文件
source_group(Src Files FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/shared_lib.cc
)

#-------------------------生成目标-------------------------
# 设置目标文件输出位置
if (WIN32)
	set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../../bin)
	set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../../bin)
	set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../../lib)
elseif (CMAKE_SYSTEM_NAME MATCHES "Linux")
	set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../../bin)
	set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../../lib)
	set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../../lib)
endif()

# link_libraries(jsoncpp) 必须放在生成目标后面
# 设置Debug|Release目标后缀，Debug模式下将在${BUILD_PROJECT_NAME}后加'd'，即文件名为'${BUILD_PROJECT_NAME}d'
set(CMAKE_DEBUG_POSTFIX "d")
add_library(${BUILD_PROJECT_NAME} SHARED ${SRC_LIST})

# 为动态库添加版本号
set_target_properties(${BUILD_PROJECT_NAME} PROPERTIES VERSION 1.1 SOVERSION 1)

# target_link_libraries 必须放在生成目标后面
# target_link_libraries(${BUILD_PROJECT_NAME} jsoncpp)
