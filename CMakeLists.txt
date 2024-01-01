# Download zip archive from this URL
cmake_minimum_required(VERSION 3.18)
project(WebUI)
include(ExternalProject)
if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    if(Linux)
        if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86_64") # for desktop
            set(ZIP_URL "https://github.com/webui-dev/webui/releases/download/nightly/webui-linux-clang-x64.zip")
            
            
            # Specify the directory to download the zip archive
            set(DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}/downloads)

            # Specify the directory to extract the zip archive
            set(EXTRACT_DIR ${CMAKE_SOURCE_DIR}/)

            # Define the external project to download the zip archive
            ExternalProject_Add(
                webui-linux
                URL ${ZIP_URL}
                DOWNLOAD_DIR ${DOWNLOAD_DIR}
                DOWNLOAD_NAME "webui-linux-clang-x64.zip"
                PREFIX ${EXTRACT_DIR}
                CONFIGURE_COMMAND ""
                BUILD_COMMAND ""
                INSTALL_COMMAND ""
            )
            
            link_directories(${CMAKE_SOURCE_DIR}/src/webui-linux/)
        # else(${CMAKE_SYSTEM_PROCESSOR} MATCHES "aarch64") # for tx2
            # message("2")
        else()
            message(FATAL_ERROR "Unknown System Architecture: ${CMAKE_SYSTEM_PROCESSOR}")
        endif()
    elseif(Apple)
        if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86_64") # for desktop
            set(ZIP_URL "https://github.com/webui-dev/webui/releases/download/nightly/webui-macos-clang-x64.zip")
            
            
            # Specify the directory to download the zip archive
            set(DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}/downloads)

            # Specify the directory to extract the zip archive
            set(EXTRACT_DIR ${CMAKE_SOURCE_DIR}/)

            # Define the external project to download the zip archive
            ExternalProject_Add(
                webui-linux
                URL ${ZIP_URL}
                DOWNLOAD_DIR ${DOWNLOAD_DIR}
                DOWNLOAD_NAME "webui-macos-clang-x64.zip"
                PREFIX ${EXTRACT_DIR}
                CONFIGURE_COMMAND ""
                BUILD_COMMAND ""
                INSTALL_COMMAND ""
            )
            
            link_directories(${CMAKE_SOURCE_DIR}/src/webui-macos/)
            # else(${CMAKE_SYSTEM_PROCESSOR} MATCHES "aarch64") # for tx2
                # message("2")
        else()
            message(FATAL_ERROR "Unknown System Architecture: ${CMAKE_SYSTEM_PROCESSOR}")
        endif()
    endif()
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86_64") # for desktop
        set(ZIP_URL "https://github.com/webui-dev/webui/releases/download/nightly/webui-linux-gcc-x64.zip")
        
        
        # Specify the directory to download the zip archive
        set(DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}/downloads)

        # Specify the directory to extract the zip archive
        set(EXTRACT_DIR ${CMAKE_SOURCE_DIR}/)

        # Define the external project to download the zip archive
        ExternalProject_Add(
            webui-linux
            URL ${ZIP_URL}
            DOWNLOAD_DIR ${DOWNLOAD_DIR}
            DOWNLOAD_NAME "webui-linux-gcc-x64.zip"
            PREFIX ${EXTRACT_DIR}
            CONFIGURE_COMMAND ""
            BUILD_COMMAND ""
            INSTALL_COMMAND ""
        )
        
        link_directories(${CMAKE_SOURCE_DIR}/src/webui-linux/)
    else(${CMAKE_SYSTEM_PROCESSOR} MATCHES "aarch64") # for tx2
        set(ZIP_URL "https://github.com/webui-dev/webui/releases/download/nightly/webui-linux-gcc-arm64.zip")
        
        
        # Specify the directory to download the zip archive
        set(DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}/downloads)

        # Specify the directory to extract the zip archive
        set(EXTRACT_DIR ${CMAKE_SOURCE_DIR}/)

        # Define the external project to download the zip archive
        ExternalProject_Add(
            webui-linux
            URL ${ZIP_URL}
            DOWNLOAD_DIR ${DOWNLOAD_DIR}
            DOWNLOAD_NAME "webui-linux-gcc-arm64.zip"
            PREFIX ${EXTRACT_DIR}
            CONFIGURE_COMMAND ""
            BUILD_COMMAND ""
            INSTALL_COMMAND ""
        )
        
        link_directories(${CMAKE_SOURCE_DIR}/src/webui-linux/)
    # else()
        # message(FATAL_ERROR "Unknown System Architecture: ${CMAKE_SYSTEM_PROCESSOR}")
    endif()
# elseif (CMAKE_CXX_COMPILER_ID STREQUAL "Intel")
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    set(ZIP_URL "https://github.com/webui-dev/webui/releases/download/nightly/webui-windows-msvc-x64.zip")
    
    
    # Specify the directory to download the zip archive
    set(DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}/downloads)

    # Specify the directory to extract the zip archive
    set(EXTRACT_DIR ${CMAKE_SOURCE_DIR}/)

    # Define the external project to download the zip archive
    ExternalProject_Add(
        webui-windows
        URL ${ZIP_URL}
        DOWNLOAD_DIR ${DOWNLOAD_DIR}
        DOWNLOAD_NAME "webui-windows-msvc-x64.zip"
        PREFIX ${EXTRACT_DIR}
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ""
    )
    
    link_directories(${CMAKE_SOURCE_DIR}/src/webui-windows/)
endif()
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
include_directories(${CMAKE_SOURCE_DIR}/include)
add_executable(WebUI main.cpp)
target_link_libraries(WebUI webui-2-static)