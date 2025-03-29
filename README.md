# Game-of-Life

## Overview
This project builds upon the serial implementation of Conway's Game of Life by leveraging CUDA for GPU acceleration. The goal is to optimize performance by utilizing global memory and parallel computing techniques.

## Requirements
- NVIDIA GPU with CUDA capability
- CUDA Toolkit installed
- OpenCV library for visualization 

## Implementation Steps
1. **Extract Update Logic**: Move the update equations from the main routine to a CUDA kernel function.
2. **Handle OpenCV Matrices**: Convert OpenCV matrices to raw `uchar*` arrays for CUDA compatibility.
3. **Memory Access Optimization**: Store and access the 2D grid using row-major order indexing (`data[m*row + col]`).
4. **GPU Memory Allocation**: Allocate GPU buffers at program start and minimize memory transfers between host and device.
5. **Visualization Control**: Implement a user-controlled parameter to adjust visualization frequency or disable it for better performance.
6. **Compilation Optimization**: Compile with optimization flags for fair performance comparison.
