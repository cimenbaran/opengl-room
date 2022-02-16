cmake_minimum_required(VERSION 3.12)

project(quake)

set(PROJECT_DIR ${CMAKE_SOURCE_DIR})
set(PROJECT_INCLUDE_DIR ${PROJECT_DIR}/Libraries/include)
set(PROJECT_SOURCE_DIR ${PROJECT_DIR}/ConsoleApplication1)
set(PATH_TO_GLFW ${PROJECT_DIR}/Libraries/source/glfw-3.3.5)
set(PATH_TO_RESOURCES ${PROJECT_DIR}/resources)
set(PATH_TO_SHADER ${PROJECT_DIR}/shader)
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)

add_subdirectory(${PATH_TO_GLFW})
add_subdirectory(${PATH_TO_ASSIMP})



aux_source_directory(${PROJECT_SOURCE_DIR} PROJECT_SOURCES)

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${ADDITIONAL_CFLAGS} -g")
set (CMAKE_CXX_STANDARD 11)

find_package(OpenGL REQUIRED)

include_directories(${PROJECT_INCLUDE_DIR})
include_directories(${PATH_TO_RESOURCES})
include_directories(${PATH_TO_SHADER})

add_executable(${PROJECT_NAME} ${PROJECT_SOURCES})

target_link_libraries(${PROJECT_NAME} glfw)

if (APPLE)
  target_link_libraries(${PROJECT_NAME} "-framework OpenGL")
endif()