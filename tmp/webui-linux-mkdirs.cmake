# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/mnt/e/Blackflame/webui/src/webui-linux"
  "/mnt/e/Blackflame/webui/src/webui-linux-build"
  "/mnt/e/Blackflame/webui"
  "/mnt/e/Blackflame/webui/tmp"
  "/mnt/e/Blackflame/webui/src/webui-linux-stamp"
  "/mnt/e/Blackflame/webui/build/downloads"
  "/mnt/e/Blackflame/webui/src/webui-linux-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/mnt/e/Blackflame/webui/src/webui-linux-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/mnt/e/Blackflame/webui/src/webui-linux-stamp${cfgdir}") # cfgdir has leading slash
endif()
