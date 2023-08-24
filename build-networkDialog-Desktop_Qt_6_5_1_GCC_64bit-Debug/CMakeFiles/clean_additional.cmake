# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appnetworkDialog_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appnetworkDialog_autogen.dir/ParseCache.txt"
  "appnetworkDialog_autogen"
  )
endif()
