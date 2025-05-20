# ./taichi/runtime/cuda/CMakeLists.txt

add_library(cuda_runtime)
target_sources(cuda_runtime
  PRIVATE
    jit_cuda.cpp
    kernel_launcher.cpp
  )

target_include_directories(cuda_runtime
  PRIVATE
    ${PROJECT_SOURCE_DIR}
    ${PROJECT_SOURCE_DIR}/external/eigen
    ${PROJECT_SOURCE_DIR}/external/spdlog/include
    ${PROJECT_SOURCE_DIR}/external/isl/isl-0.22/include
    ${LLVM_INCLUDE_DIRS}
  )
