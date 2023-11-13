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
    // Allocate vectors
    std::vector<int> a(n);
    std::vector<int> b(n);
    std::vector<int> c(n);
    // Fill vectors with 0, 1, ...
    std::iota(std::begin(a), std::end(a), 0);
    std::iota(std::begin(b), std::end(b), 0);
    busy_wait(std::chrono::seconds(10));
    // Start loop timer
    auto loop = std::chrono::system_clock::now();
    // Element-wise sum (parallel)
    //omp_set_num_threads(4);
    fmt::print("Threads: {}\n", omp_get_max_threads());
    #pragma omp parallel for
    for (int i = 0; i < n; ++i) {
        c[i] = a[i] + b[i];
        busy_wait(std::chrono::seconds(1));
    }
    // Print runtime
    fmt::print("Loop   : {:%T}\n", std::chrono::system_clock::now() - loop);
    fmt::print("Total  : {:%T}\n", std::chrono::system_clock::now() - total);
    return EXIT_SUCCESS;
}
