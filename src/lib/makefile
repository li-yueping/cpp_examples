GCC = gcc
GXX = g++
AR  = ar
RM  = rm

# Define the resource compiler
RC = windres

# debug flag
DBG_ENABLE := 0
OS = $(shell uname)

###############################################################################
# 目标文件                                                                      #
###############################################################################
# target file name
TARGET := libmy_math
TARGET_EXT := .so

###############################################################################
# 源文件                                                                       #
###############################################################################
# source file path
SRC_PATH := ./

# get all source files  
SRCS := $(foreach spath, $(SRC_PATH), $(wildcard $(spath)*.c) $(wildcard $(spath)*.cpp) $(wildcard $(spath)*.cc))

## all .o based on all .c/.cc/.cpp
OBJS = $(SRCS:.c=.o)
OBJS := $(OBJS:.cc=.o)
OBJS := $(OBJS:.cpp=.o)

###############################################################################
# 头文件                                                                       #
###############################################################################
## used headers  file path
INC_PATH := ./

# get all include path  
INC_FLAGS  += $(foreach dir, $(INC_PATH), -I$(dir))  

###############################################################################
# 库文件及路径                                                                  #
###############################################################################
## need libs, add at here 
LIBS := 

## used include librarys file path
LIBRARY_PATH := ../../bin

ifeq ($(OS), Linux)
LIBS += rt
LIBRARY_PATH += 
endif

# get all library path  
LIB_PATH_FLAGS += $(foreach lib, $(LIBRARY_PATH), -L$(lib))
  
# get all librarys  
LIB_FLAGS += $(foreach lib, $(LIBS), -l$(lib))

###############################################################################
# 是否使用debug                                                                #
###############################################################################
## debug for debug info, when use gdb to debug  
ifeq (1, ${DBG_ENABLE})   
CFLAGS += -g -D_DEBUG -DDEBUG=1
else
CFLAGS += -O3 -DNDEBUG
endif

###############################################################################
# 系统关联参数                                                                  #
###############################################################################
ifeq ($(OS), Linux)
CFLAGS += -fPIC
LIB_FLAGS += -Wl,--rpath=
endif

###############################################################################
# 宏定义                                                                       #
###############################################################################
DEFS := __LINUX__ OS_LINUX _FILE_OFFSET_BITS=64
CFLAGS += -msse4.2 -march=core2 -pipe $(foreach m, $(DEFS), -D$(m))
GXXFLAGS += -shared -std=c++17 -fpermissive -Wno-deprecated-declarations $(CFLAGS) # 动态库
#GXXFLAGS += -std=c++17 -fpermissive -Wno-deprecated-declarations $(CFLAGS) # 可执行程序 
RCFLAGS ?= -DNDEBUG
OBJS_EXT := 

default: all

%.o: %.c
	$(GCC) $(CFLAGS) $(INC_FLAGS) -c $< -o $@

%.o: %.cc
	$(GXX) $(GXXFLAGS) $(INC_FLAGS) -c $< -o $@

%.o: %.cpp
	$(GXX) $(GXXFLAGS) $(INC_FLAGS) -c $< -o $@
    
all: $(OBJS)
	$(AR) -r ../../bin/$(TARGET)$(TARGET_EXT) $(OBJS) $(OBJS_EXT) $(CFLAGS) $(INC_FLAGS) $(LIB_PATH_FLAGS) $(LIB_FLAGS)
#	$(GXX) -o ../../bin/$(TARGET)$(TARGET_EXT) $(OBJS) $(OBJS_EXT) $(GXXFLAGS) $(INC_FLAGS) $(LIB_PATH_FLAGS) $(LIB_FLAGS)
#    $(RM) $(OBJS)

clean:  
	$(RM) $(OBJS) ../../bin/$(TARGET)$(TARGET_EXT)