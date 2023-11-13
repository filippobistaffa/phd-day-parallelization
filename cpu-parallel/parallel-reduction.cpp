// import from standard library
#include <vector>
#include <numeric>
#include <chrono>
#include <thread>
#include <omp.h>

// fmt library
#define FMT_HEADER_ONLY
#include <fmt/core.h>
#include <fmt/chrono.h>

// 2 billion elements
constexpr int n = 24; 

void busy_wait(std::chrono::duration<int> duration) {

    auto start = std::chrono::system_clock::now();
    volatile int x;
    while (std::chrono::system_clock::now() - start < duration) {
        ++x;
    }
}

int main() {

    // Start total timer
    auto total = std::chrono::system_clock::now();
    // Start loop timer
    auto loop = std::chrono::system_clock::now();
    // Parallel reduction
    fmt::print("Threads: {}\n", omp_get_max_threads());
    int sum = 0;
    #pragma omp parallel for reduction(+:sum)
    for (int i = 0; i < n; ++i) {
        sum += i;
        busy_wait(std::chrono::seconds(1));
    }
    // Print runtime
    fmt::print("Sum    : {}\n", sum);
    fmt::print("Loop   : {:%T}\n", std::chrono::system_clock::now() - loop);
    fmt::print("Total  : {:%T}\n", std::chrono::system_clock::now() - total);
    return EXIT_SUCCESS;
}
