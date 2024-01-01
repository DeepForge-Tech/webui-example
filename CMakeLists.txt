# Download zip archive from this URL
cmake_minimum_required(VERSION 3.18)
project(WebUI)
include(ExternalProject)
if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    set(compiler clang)
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(compiler gcc)
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    set(compiler msvc)
endif()
if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86_64") # for desktop
  set(architecture "x64")
else(${CMAKE_SYSTEM_PROCESSOR} MATCHES "aarch64") # for tx2
  set(architecture "arm64")
endif()
if(WIN32)
    set(OS_NAME "windows")
elseif(UNIX)
    set(OS_NAME "linux")
elseif(APPLE)
    set(OS_NAME "macos")
endif()
set(NameFolder webui-${OS_NAME})
set(ZIP_URL https://github.com/webui-dev/webui/releases/download/nightly/${NameFolder}-${compiler}-${architecture}.zip)


# Specify the directory to download the zip archive
set(DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}/downloads)

# Specify the directory to extract the zip archive
set(EXTRACT_DIR ${CMAKE_SOURCE_DIR}/)
# Define the external project to download the zip archive
ExternalProject_Add(
    ${NameFolder}
    URL ${ZIP_URL}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    DOWNLOAD_NAME "${NameFolder}-${compiler}-${architecture}.zip"
    PREFIX ${EXTRACT_DIR}
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)
            
link_directories(${CMAKE_SOURCE_DIR}/src/${NameFolder}/)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
include_directories(${CMAKE_SOURCE_DIR}/include)
add_executable(WebUI main.cpp)
target_link_libraries(WebUI webui-2-static)