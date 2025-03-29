# Makefile for opencv + mpi programs
NVCC=nvcc

# names of programs to create (from driver programs that have a function main())
# put Lab_2_Part_1 Lab_2_Part_2 etc... here
# CUDAFLAGS=-arch=sm_35
programs=Program_26a_CUDAMatrixMatrixProduct#Program_23b_GameOfLife 

# find all .cpp files in current directory
cu_files=$(wildcard *.cu)
# list of objects to compile
cu_objects=$(cu_files:%.cu=%.o)

pkg_name=opencv
# for opencv in ubuntu package manager
Includes= $(shell pkg-config --cflags $(pkg_name))
LDLIBS= $(shell pkg-config --libs $(pkg_name))
FLAGS += -O3 #-mtune=native -ffast-math
CUDAFLAGS=$(Includes) $(FLAGS) $(LDLIBS)

all: $(programs)

$(programs): $(cu_objects)
	$(NVCC) $(CUDAFLAGS) -o $@ $^

%.o: %.cu
	$(NVCC) $(CUDAFLAGS) -c $< -o $@

clean:
	rm -f $(programs) $(cu_objects)