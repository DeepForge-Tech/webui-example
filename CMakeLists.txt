# Download zip archive from this URL
cmake_minimum_required(VERSION 3.18)
project(WebUI)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# Set parametrs
include(ExternalProject)
if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    set(compiler clang)
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
    set(compiler clang)
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(compiler gcc)
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    set(compiler msvc)
endif()
message(${CMAKE_SYSTEM_PROCESSOR})
if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86_64") # for desktop
    set(architecture "x64")
elseif(${CMAKE_SYSTEM_PROCESSOR} MATCHES "AMD64")
    set(architecture "x64")
elseif(${CMAKE_SYSTEM_PROCESSOR} MATCHES "aarch64") # for tx2
    set(architecture "arm64")
endif()
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(OS_NAME "windows")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(OS_NAME "linux")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    set(OS_NAME "macos")
endif()
set(NameFolder webui-${OS_NAME})
set(ZIP_URL https://github.com/webui-dev/webui/releases/download/nightly/${NameFolder}-${compiler}-${architecture}.zip)


# Specify the directory to download the zip archive
set(DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}/downloads)

# Specify the directory to extract the zip archive
set(EXTRACT_DIR ${CMAKE_BINARY_DIR}/)
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
link_directories(${EXTRACT_DIR}/src/${NameFolder}/)
link_directories(${CMAKE_SOURCE_DIR}/lib)
include_directories(${CMAKE_SOURCE_DIR}/include)
include_directories(${CMAKE_SOURCE_DIR}/src/${NameFolder}/include)
set(SOURCE_FILES main.cpp)
if(WIN32)
    add_executable(WebUI WIN32 ${SOURCE_FILES})
else()
    add_executable(WebUI ${SOURCE_FILES})
endif()
target_link_libraries(WebUI webui-2-static winmm)