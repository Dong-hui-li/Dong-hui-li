# ./taichi/rhi/amdgpu/CMakeLists.txt

set(AMDGPU_RHI amdgpu_rhi)
add_library(${AMDGPU_RHI})
target_sources(${AMDGPU_RHI}
  PRIVATE
    amdgpu_device.cpp
    amdgpu_context.cpp
    amdgpu_driver.cpp
    amdgpu_profiler.cpp
  )
#syy 20241005 添加库文件
target_include_directories(${AMDGPU_RHI}
  PRIVATE
    ${PROJECT_SOURCE_DIR}
    ${PROJECT_SOURCE_DIR}/external/eigen
    ${PROJECT_SOURCE_DIR}/external/spdlog/include
    ${PROJECT_SOURCE_DIR}/external/isl/isl-0.22/include
    ${LLVM_INCLUDE_DIRS}
  )
