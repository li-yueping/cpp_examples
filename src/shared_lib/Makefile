GCC = gcc
GXX = g++

USE_DEBUG = 0

# 目标文件
TARGET := libshared_lib
TARGET_EXT := .so

# 源文件路径
SRC_PATH := ./
SRCS := $(foreach path, $(SRC_PATH), $(wildcard $(path)*.c) $(wildcard $(path)*.cpp) $(wildcard $(path)*.cc))

OBJS = $(SRCS:.c=.o)
OBJS := $(OBJS:.cc=.o)
OBJS := $(OBJS:.cpp=.o)

# 头文件路径
INC_PATH := ./
INC_FLAGS := $(foreach dir, $(INC_PATH), -I$(dir))

# 库文件及路径
LIBS := pthread dl
LIB_PATHS := .

LDFLAGS += $(foreach lib, $(LIB_PATHS), -L$(lib))
LDFLAGS += $(foreach lib, $(LIBS), -l$(lib))

# 调试信息
ifeq (${USE_DEBUG}, 1)   
    CFLAGS += -D_DEBUG -g -DDEBUG=1
else
    CFLAGS += -O3 -DNDEBUG
endif

# 系统编译参数
ifeq ($(OS), Linux)
    CFLAGS += -fPIC -DWEBRTC_POSIX -DWEBRTC_LINUX
    LDFLAGS += -Wl,--rpath=
endif

# 宏定义
DEFS := __LINUX__ OS_LINUX _FILE_OFFSET_BITS=64
DEF_FLAGS := $(foreach def, $(DEFS), -D$(def))

# 编译器flags
CFLAGS += -msse4.2 -march=core2 -pipe $(DEF_FLAGS)
CXXFLAGS += -std=c++17 -fPIC -fpermissive -Wno-deprecated-declarations $(CFLAGS)

# 编译目标
default: all
%.o: %.c
	$(GCC) $(CFLAGS) $(INC_FLAGS) -c $< -o $@
%.o: %.cc
	$(GXX) $(CXXFLAGS) $(INC_FLAGS) -c $< -o $@
%.o: %.cpp
	$(GXX) $(CXXFLAGS) $(INC_FLAGS) -c $< -o $@

all: $(OBJS)
	$(GXX) -shared -o $(ROOT_DIR)/bin/$(TARGET)$(TARGET_EXT) $^ $(CXXFLAGS) $(INC_FLAGS) $(LDFLAGS)

clean: 
	$(RM) $(OBJS) $(ROOT_DIR)/bin/$(TARGET)$(TARGET_EXT)