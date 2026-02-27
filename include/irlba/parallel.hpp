#ifndef IRLBA_PARALLEL_HPP
#define IRLBA_PARALLEL_HPP

#include "utils.hpp"
#include <vector>
#include "Eigen/Dense"

#ifndef IRLBA_CUSTOM_PARALLEL
#include "subpar/subpar.hpp"
#endif

/**
 * @file parallel.hpp
 *
 * @brief Classes for parallelized multiplication.
 */

namespace irlba {

/**
 * @tparam Task_ Integer type for the number of tasks.
 * @tparam Run_ Function to execute each task.
 *
 * @param num_tasks Number of tasks.
 * @param run_task Function to execute each task for each worker.
 *
 * By default, this is an alias to `subpar::parallelize_simple()`.
 * Its purpose is to enable **irlba**-specific customization to the parallelization scheme without affecting other libraries that use **subpar**.
 * If the `IRLBA_CUSTOM_PARALLEL` macro is defined, it will be used instead of `subpar::parallelize_simple()` whenever `parallelize()` is called.
 * Any user-defined macro should follow the same requirements as the `SUBPAR_CUSTOM_PARALLELIZE_SIMPLE` override for `subpar::parallelize_simple()`.
 */
template<typename Task_, class Run_>
void parallelize(Task_ num_tasks, Run_ run_task) {
#ifndef IRLBA_CUSTOM_PARALLEL
    // Use cases here don't allocate or throw, so nothrow_ = true is fine.
    subpar::parallelize_simple<true>(num_tasks, std::move(run_task));
#else
    IRLBA_CUSTOM_PARALLEL(num_tasks, run_task);
#endif
}

/**
 * @brief Restrict the number of available threads for Eigen.
 *
 * @details
 * Creating an instance of this class will call `Eigen::setNbThreads()` to control the number of available OpenMP threads in Eigen operations.
 * Destruction will then reset the number of available threads to its prior value.
 *
 * If OpenMP is available but is not the current parallelization scheme,
 * `num_threads` is ignored and the number of Eigen threads is always set to 1 when an instance of this class is created.
 * This is done to avoid unintended parallelization via OpenMP when another scheme has already been specified.
 * We assume that OpenMP is not the current parallelization scheme if:
 * - `IRLBA_CUSTOM_PARALLEL` is defined (see `parallelize()`) and the `IRLBA_CUSTOM_PARALLEL_USES_OPENMP` macro is not defined.
 * - `IRLBA_CUSTOM_PARALLEL` is not defined and OpenMP was not chosen by `subpar::parallelize_simple()`.
 *
 * If OpenMP is not available, the creation/destruction of an instance of this class has no effect.
 */ 
class EigenThreadScope {
#ifndef _OPENMP
public:
    /**
     * @param num_threads Number of threads to be used by Eigen.
     */
    EigenThreadScope([[maybe_unused]] int num_threads) {}

#else
public:
    /**
     * @param num_threads Number of threads to be used by Eigen.
     */
    EigenThreadScope([[maybe_unused]] int num_threads) : my_previous(Eigen::nbThreads()) {
#ifdef IRLBA_CUSTOM_PARALLEL
#ifdef IRLBA_CUSTOM_PARALLEL_USES_OPENMP
        Eigen::setNbThreads(num_threads);
#else
        Eigen::setNbThreads(1);
#endif
#else
#ifdef SUBPAR_USES_OPENMP_SIMPLE
        Eigen::setNbThreads(num_threads);
#else
        Eigen::setNbThreads(1);
#endif
#endif
    }

private:
    int my_previous;

public:
    ~EigenThreadScope() { 
        Eigen::setNbThreads(my_previous);
    }
#endif

public:
    /**
     * @cond
     */
    EigenThreadScope(const EigenThreadScope&) = delete;
    EigenThreadScope(EigenThreadScope&&) = delete;
    EigenThreadScope& operator=(const EigenThreadScope&) = delete;
    EigenThreadScope& operator=(EigenThreadScope&&) = delete;
    /**
     * @endcond
     */
};

}

#endif
