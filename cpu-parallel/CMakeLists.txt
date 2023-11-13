cmake_minimum_required(VERSION 3.9)

project(phd-day-cpu-parallel)

set(PEDANTIC_COMPILE_FLAGS
    -pedantic-errors
    -Wall
    -Wextra
    -pedantic
)

set(OPTIMIZATION_COMPILE_FLAGS
    -Ofast
    -march=native
    -fopenmp
)

find_package(OpenMP REQUIRED)
include_directories(fmt/include)
file(GLOB EXAMPLES "*.cpp")

foreach (EXAMPLE ${EXAMPLES})
    get_filename_component(NAME ${EXAMPLE} NAME_WE)
    add_executable(${NAME} ${NAME}.cpp)
    target_compile_options(${NAME} PRIVATE ${PEDANTIC_COMPILE_FLAGS} ${OPTIMIZATION_COMPILE_FLAGS})
    target_link_libraries(${NAME} PRIVATE OpenMP::OpenMP_CXX)
endforeach()
