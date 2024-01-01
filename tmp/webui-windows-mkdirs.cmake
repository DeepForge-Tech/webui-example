# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "E:/Blackflame/webui/src/webui-windows"
  "E:/Blackflame/webui/src/webui-windows-build"
  "E:/Blackflame/webui"
  "E:/Blackflame/webui/tmp"
  "E:/Blackflame/webui/src/webui-windows-stamp"
  "E:/Blackflame/webui/build/downloads"
  "E:/Blackflame/webui/src/webui-windows-stamp"
)

set(configSubDirs Debug;Release;MinSizeRel;RelWithDebInfo)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "E:/Blackflame/webui/src/webui-windows-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "E:/Blackflame/webui/src/webui-windows-stamp${cfgdir}") # cfgdir has leading slash
endif()
