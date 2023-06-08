GCC		  = gcc
GXX		  = g++

export OS = $(shell uname)
# 向子目录输出全局变量
export ROOT_DIR = $(shell pwd)
$(info OS: $(OS), ROOT_DIR: $(ROOT_DIR)) 	# 打印信息，@echo只能在目标后使用，且前面是TAB键

SUBDIRS = src/shared_lib src/static_lib src/static_shared_lib src/main

all:
	@echo start build... 
	mkdir -p "./bin"
	@for d in $(SUBDIRS);  do  cd $$d; make -j32 $@ || exit; cd ../..; done 

clean:
	@for d in $(SUBDIRS);  do  cd $$d; make clean $@; cd ../..; done
