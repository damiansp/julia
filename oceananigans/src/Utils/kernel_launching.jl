# Utils for launching kernels
using CUDA
using KernelAbstractions

using Oceananigans.Architecture
using Oceananigans.Grids


const MAX_THREADS_PER_BLOCK = 256