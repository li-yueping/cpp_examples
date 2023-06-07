GCC		  = gcc
GXX		  = g++

# 向子目录输出全局变量
export ROOT_DIR = $(shell pwd)

SUBDIRS = src/shared_lib src/static_lib src/static_shared_lib src/main

all:
	mkdir -p "./bin"
	@for d in $(SUBDIRS);  do  cd $$d; make -j32 $@ || exit; cd ..; done 

clean:
	@for d in $(SUBDIRS);  do  cd $$d; make clean $@; cd ..; done
