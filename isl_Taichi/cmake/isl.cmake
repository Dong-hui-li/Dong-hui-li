# function(isl_add_pkg pkg_name)
#     set(options )
#     set(oneValueArgs URL MD5 GIT_REPOSITORY GIT_TAG VER EXE DIR CMAKE_PATH CUSTOM_CMAKE)
#     set(multiValueArgs CMAKE_OPTION  CONFIGURE_COMMAND LIBS PATCHES)
#     cmake_parse_arguments(PKG "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )
#     #{${pkg_name}_BASE_DIR??}
#     # 获取当前 CMakeLists.txt 所在目录的父目录
#     get_filename_component(PARENT_DIR ${CMAKE_CURRENT_SOURCE_DIR} DIRECTORY)
#     # 输出父目录路径
#     message("The parent directory is: ${PARENT_DIR}")
#     set(${pkg_name}_INC ${PARENT_DIR}/external/isl/isl-0.22/include PARENT_SCOPE)
#     if(NOT PKG_LIB_PATH)
#         set(PKG_LIB_PATH lib)
#     endif()
#     if(${pkg_name}_SOURCE_DIR)
#         if(PKG_CMAKE_OPTION)
#             # in cmake
#             file(MAKE_DIRECTORY ${${pkg_name}_SOURCE_DIR}/_build)
#             if(${pkg_name}_CFLAGS)
#                 set(${pkg_name}_CMAKE_CFLAGS "-DCMAKE_C_FLAGS=${${pkg_name}_CFLAGS}")
#             endif()
#             if (${pkg_name}_CXXFLAGS)
#                 set(${pkg_name}_CMAKE_CXXFLAGS "-DCMAKE_CXX_FLAGS=${${pkg_name}_CXXFLAGS}")
#             endif()
#             if (${pkg_name}_LDFLAGS)
#                 if (${pkg_name}_USE_STATIC_LIBS)
#                     set(${pkg_name}_CMAKE_LDFLAGS "-DCMAKE_STATIC_LINKER_FLAGS=${${pkg_name}_LDFLAGS}")
#                 else()
#                     set(${pkg_name}_CMAKE_LDFLAGS "-DCMAKE_SHARED_LINKER_FLAGS=${${pkg_name}_LDFLAGS}")
#                 endif()
#             endif()
#             __exec_cmd(COMMAND ${CMAKE_COMMAND} ${PKG_CMAKE_OPTION} -G ${CMAKE_GENERATOR}
#                     ${${pkg_name}_CMAKE_CFLAGS} ${${pkg_name}_CMAKE_CXXFLAGS} ${${pkg_name}_CMAKE_LDFLAGS}
#                     ${${pkg_name}_CONFIG_FILE_DIR} ${${pkg_name}_DEPEND_INCLUDE_DIR} ${${pkg_name}_DEPEND_LIB_DIR}
#                     -DCMAKE_INSTALL_PREFIX=${${pkg_name}_BASE_DIR} ${${pkg_name}_SOURCE_DIR}/${PKG_CMAKE_PATH}
#                     WORKING_DIRECTORY ${${pkg_name}_SOURCE_DIR}/_build)
#             __exec_cmd(COMMAND ${CMAKE_COMMAND} --build . --target install -- -j${THNUM}
#                     WORKING_DIRECTORY ${${pkg_name}_SOURCE_DIR}/_build)
#         elseif(PKG_CONFIGURE_COMMAND)
#            __exec_cmd(COMMAND ${PKG_CONFIGURE_COMMAND}
#                       ${${pkg_name}_MAKE_CFLAGS} ${${pkg_name}_MAKE_CXXFLAGS} ${${pkg_name}_MAKE_LDFLAGS}
#                       --prefix=${${pkg_name}_BASE_DIR}
#                       WORKING_DIRECTORY ${${pkg_name}_SOURCE_DIR})
#            __exec_cmd(COMMAND ${CMAKE_MAKE_PROGRAM} ${${pkg_name}_BUILD_OPTION} -j${THNUM}
#                       WORKING_DIRECTORY ${${pkg_name}_SOURCE_DIR})
#            __exec_cmd(COMMAND ${CMAKE_MAKE_PROGRAM} install
#                       WORKING_DIRECTORY ${${pkg_name}_SOURCE_DIR})
#         endif()
#     endif()
# endfunction()

# set(ISL_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
# set(isl_USE_STATIC_LIBS ON)
# set(isl_CONFIG_FILE_DIR "-DISL_WRAP_DIR=${ISL_SOURCE_DIR}/external/isl/isl_wrap")
# isl_add_pkg(isl
#             VER 0.22
#             LIBS isl_fixed
#             CUSTOM_CMAKE ${ISL_SOURCE_DIR}/external/isl/isl_wrap
#             PATCHES ${ISL_SOURCE_DIR}/external/isl/patch/isl/isl.patch
#             CMAKE_OPTION " ")
# include_directories("${ISL_SOURCE_DIR}/external/isl/isl_wrap/include")
# include_directories("${isl_INC}/include")
# include_directories("${isl_INC}")                           
# link_directories("${isl_LIBPATH}")

#获取当前 CMakeLists.txt 所在目录的父目录
get_filename_component(PARENT_DIR ${CMAKE_CURRENT_SOURCE_DIR} DIRECTORY)
# 输出父目录路径
message("The parent directory is: ${PARENT_DIR}")
set(ISL_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(isl_USE_STATIC_LIBS ON)
set(isl_CONFIG_FILE_DIR "-DISL_WRAP_DIR=${ISL_SOURCE_DIR}/external/isl/isl_wrap")

isl_add_pkg(isl
        VER 0.22
        DIR ${ISL_SOURCE_DIR}/external/isl/isl-0.22.tar.gz
        LIBS isl_fixed
        CUSTOM_CMAKE ${ISL_SOURCE_DIR}/external/isl/isl_wrap
        PATCHES ${ISL_SOURCE_DIR}/external/isl/patch/isl/isl.patch
        CMAKE_OPTION " ")
message(STATUS "_MS_LIB_CACHE = ${_MS_LIB_CACHE}")
message(STATUS "ARGN_STRIPPED = ${ARGN_STRIPPED}")

include_directories("${ISL_SOURCE_DIR}/external/isl/isl_wrap/include")
include_directories("${isl_INC}/include")
include_directories("${isl_INC}")
link_directories("${isl_LIBPATH}")