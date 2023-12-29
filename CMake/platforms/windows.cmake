set(ASAN OFF)
set(UBSAN OFF)
set(DIST ON)

list(APPEND DEVILUTIONX_PLATFORM_LINK_LIBRARIES
  find_steam_game
  shlwapi
  wsock32
  ws2_32
  wininet
)

add_definitions(-DWINVER=0x0601 -D_WIN32_WINDOWS=0x0601 -D_WIN32_WINNT=0x0601)

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  list(APPEND DEVILUTIONX_PLATFORM_COMPILE_OPTIONS "/W3" "/Zc:__cplusplus" "/utf-8")
else()
  list(APPEND DEVILUTIONX_PLATFORM_COMPILE_OPTIONS $<$<CONFIG:Debug>:-gstabs>)
endif()

if(MINGW_CROSS)
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/mingw")
endif()
