#ifndef IRLBA_OPTIONS_HPP
#define IRLBA_OPTIONS_HPP

#include <random>
#include <optional>
#include "Eigen/Dense"

/**
 * @file Options.hpp
 * @brief Options for IRLBA.
 */

namespace irlba {

/**
 * @brief Options for running IRLBA in `compute()` and `pca()`.
 *
 * @tparam EigenVector_ A floating-point `Eigen::Vector` class to store the initial values.
 */
template<class EigenVector_ = Eigen::VectorXd>
struct Options {
    /**
     * Tolerance for defining invariant subspaces.
     * This is used as the lower bound for the L2 norm for the subspace vectors;
     * below this bound, vectors are treated as all-zero and are instead filled with random draws from a normal distribution.
     * 
     * Any user-provided value should be non-negative.
     * If unset, this defaults to the machine epsilon to the power of 0.8.
     */
    std::optional<double> invariant_subspace_tolerance;

    /**
     * Tolerance on the approximation error of the singular triplets.
     * Lower values improve the accuracy of the decomposition.
     * (See Equation 2.13 of Baglama and Reichel.)
     *
     * Any user-provided value should be non-negative.
     */
    double convergence_tolerance = 1e-5; 

    /**
     * Tolerance on the relative differences between singular values across iterations.
     * Lower values improve the accuracy of the decomposition.
     *
     * Any user-provided value should be non-negative.
     * If unset, the value in `Options::convergence_tolerance` is used.
     */
    std::optional<double> singular_value_ratio_tolerance; 

    /**
     * Number of extra dimensions to define the working subspace.
     * Larger values can speed up convergence at the cost of increased memory usage.
     * If unset, it defaults to the larger of 7 (the original default from the R package)
     * and the requested number of singular triplets (for `compute()`) or principal components (for `pca()`).
     */
    std::optional<Eigen::Index> extra_work;

    /**
     * Maximum number of restart iterations.
     * Larger values improve the chance of convergence.
     */
    int max_iterations = 1000;

    /**
     * Whether to perform an exact SVD if the matrix is too small (fewer than 6 elements in any dimension).
     * This is more efficient and avoids inaccuracies from an insufficient workspace.
     */
    bool exact_for_small_matrix = true;

    /**
     * Whether to perform an exact SVD if the requested number of singular values is too large (greater than or equal to half the smaller matrix dimension).
     * This is more efficient and avoids inaccuracies from an insufficient workspace.
     */
    bool exact_for_large_number = true;

    /**
     * Whether to automatically cap the requested number of singular values to the smaller dimension of the input matrix.
     * If false, an error is thrown instead.
     */
    bool cap_number = false;

    /**
     * Seed for the creation of random vectors, primarily during initialization of the IRLBA algorithm.
     */
    typename std::mt19937_64::result_type seed = std::mt19937_64::default_seed;

    /**
     * Pointer to the initial values of the first right singular vector.
     * This should have length equal to the number of columns of the input `matrix` in `compute()` or `pca()`.
     */
    std::optional<EigenVector_> initial;
};

/**
 * @cond
 */
template<typename Float_, class EigenVector_>
Float_ choose_invariant_tolerance(const Options<EigenVector_>& options) {
    const auto& tol = options.invariant_subspace_tolerance;
    if (tol.has_value() && *tol >= 0) { // check it's non-negative for back-compatibility.
        return *tol;
    } else {
        return std::pow(std::numeric_limits<Float_>::epsilon(), 0.8);
    }
}

template<class EigenVector_>
double choose_singular_value_tolerance(const Options<EigenVector_>& options) {
    const auto& svtol = options.singular_value_ratio_tolerance;
    if (svtol.has_value() && *svtol >= 0) {
        return *svtol;
    } else {
        return options.convergence_tolerance;
    }
}
/**
 * @endcond
 */

}

#endif

