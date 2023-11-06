// import from standard library
#include <vector>
#include <numeric>
#include <chrono>

// fmt library
#define FMT_HEADER_ONLY
#include <fmt/core.h>
#include <fmt/chrono.h>

// 2 billion elements
constexpr std::size_t n = 2e9; 

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
    // Start loop timer
    auto loop = std::chrono::system_clock::now();
    // Element-wise sum
    for (std::size_t i = 0; i < n; ++i) {
        c[i] = a[i] + b[i];
    }
    // Print runtime
    fmt::print("Loop : {:%T}\n", std::chrono::system_clock::now() - loop);
    fmt::print("Total: {:%T}\n", std::chrono::system_clock::now() - total);
    return EXIT_SUCCESS;
}
