GCC		  = gcc
GXX		  = g++

CXXFLAGS := -std=c++17 -fpermissive -w
INCLUDES := 

export WEBRTC_DIR = /home/ping/code/third_party/webrtc_src/src

SUBDIRS 	= src/lib #src/main

all:
	mkdir -p "./bin"
	@for d in $(SUBDIRS);  do  cd $$d; make -j32 $@ || exit; cd ..; done 

clean:
	@for d in $(SUBDIRS);  do  cd $$d; make clean $@; cd ..; done
