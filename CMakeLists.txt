cmake_minimum_required(VERSION 3.14 FATAL_ERROR)
project(ProjectBuilder)

############################################# Variable Definitions ####################################################




############################################# Project Settings ####################################################

include(cmake/CPM.cmake)

# Define the base output directory
set(OUTPUT_BASE "${CMAKE_BINARY_DIR}/output")

# Use generator expressions to append configuration-specific subdirectories
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${OUTPUT_BASE}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${OUTPUT_BASE}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${OUTPUT_BASE}/bin")

set(SRC_DIR "${CMAKE_SOURCE_DIR}/src")

include(cmake/dependencies.cmake)

# Iterate over all subdirectories in `src/` and add them as subprojects
file(GLOB SUBDIRECTORIES RELATIVE ${SRC_DIR} ${SRC_DIR}/*)

foreach(SUBDIR ${SUBDIRECTORIES})
    if(IS_DIRECTORY "${SRC_DIR}/${SUBDIR}" AND EXISTS "${SRC_DIR}/${SUBDIR}/CMakeLists.txt")
        # Each folder is treated as an independent project
        add_subdirectory("${SRC_DIR}/${SUBDIR}")
    endif()
endforeach()