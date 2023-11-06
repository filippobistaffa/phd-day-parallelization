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

set(EXAMPLES "basic-loop" "basic-loop-openmp" "dynamic-scheduling")

foreach (EXAMPLE ${EXAMPLES})
    add_executable(${EXAMPLE} ${EXAMPLE}.cpp)
    target_compile_options(${EXAMPLE} PRIVATE ${PEDANTIC_COMPILE_FLAGS} ${OPTIMIZATION_COMPILE_FLAGS})
    target_link_libraries(${EXAMPLE} PRIVATE OpenMP::OpenMP_CXX)
endforeach()
