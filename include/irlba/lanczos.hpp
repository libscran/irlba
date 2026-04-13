#ifndef IRLBA_LANCZOS_HPP
#define IRLBA_LANCZOS_HPP

#include <cmath>
#include <limits>
#include <stdexcept>
#include <utility>

#include "utils.hpp"
#include "Matrix/interface.hpp"

#include "Eigen/Dense"

namespace irlba {

template<class EigenMatrix_, class EigenVector_>
void orthogonalize_vector(const EigenMatrix_& mat, EigenVector_& vec, Eigen::Index ncols) {
    // Original package uses classical Gram Schmidt but modified GS is actually faster when we
    // sum the timing across all orthogonalization steps in the Lanczos process.
    // Possibly because it allows us to modify 'vec' for each of mat's progressive column vectors, 
    // rather than requiring a temporary space to store the projections from the original 'vec'.
    for (Eigen::Index c = 0; c < ncols; ++c) {
        // No need to divide by the norm of mat.col(c), as this is always 1.
        vec -= mat.col(c) * vec.dot(mat.col(c)); 
    }
}

template<class EigenVector_, class Matrix_>
struct LanczosWorkspace {
    LanczosWorkspace(const Matrix_& mat) : 
        F(mat.cols()), 
        W_next(mat.rows()), 
        work(mat.new_known_workspace()),
        awork(mat.new_known_adjoint_workspace())
    {}

    EigenVector_ F; 
    EigenVector_ W_next;

    I<decltype(std::declval<Matrix_>().new_known_workspace())> work;
    I<decltype(std::declval<Matrix_>().new_known_adjoint_workspace())> awork;
};

/*
 * W is a matrix with number of rows equal to `mat.rows()`.
 * The size of the working subspace is defined as the number of columns.
 * The first `start` columns should contain orthonormal column vectors with non-zero L2 norms.
 * On output, the rest of `W` is filled with orthonormal vectors.
 *
 * V is a matrix with number of rows equal to `mat.cols()` and number of columns equal to `W.cols()`.
 * The first `start + 1` columns should contain orthonormal column vectors with non-zero L2 norms.
 * On output, the rest of `V` is filled with orthonormal vectors.
 *
 * B is a square matrix with number of rows and columns equal to the size of the working subspace.
 * On output, B is filled with upper diagonal entries, starting from the `start`-th row/column.
 */
template<class Matrix_, class EigenMatrix_, class EigenVector_, class Engine_>
int run_lanczos_bidiagonalization(
    LanczosWorkspace<EigenVector_, Matrix_>& inter, 
    EigenMatrix_& W, 
    EigenMatrix_& V, 
    EigenMatrix_& B, 
    Engine_& eng, 
    const Eigen::Index start, 
    const typename EigenMatrix_::Scalar eps
) {
    typedef typename EigenMatrix_::Scalar Float;

    const Eigen::Index work = W.cols();
    auto& F = inter.F;
    auto& W_next = inter.W_next;

    F = V.col(start);
    inter.work->multiply(F, W_next); // i.e., W_next = mat * F;
    int mult = 1;

    // If start = 0, there's nothing to orthogonalize against.
    if (start) {
        orthogonalize_vector(W, W_next, start);
    }

    Float S = W_next.norm();
    if (S < eps) {
        throw std::runtime_error("starting vector near the null space of the input matrix");
    }
    W_next /= S;
    W.col(start) = W_next;
    B.coeffRef(start, start) = S;

    // The Lanczos iterations themselves, see algorithm 2.1 of Baglama and Reichel.
    for (Eigen::Index j = start; j < work; ++j) {
        // This step is equivalent to F = mat.adjoint() * W.col(j).
        // Remember that W_next is assigned into W.col(start) at the start, or W.col(j+1) from the previous iteration;
        // so W_next is equal to W.col(j) in the current iteration.
        inter.awork->multiply(W_next, F); 
        ++mult;

        F -= S * V.col(j); // equivalent to daxpy.
        orthogonalize_vector(V, F, j + 1);

        if (j + 1 == work) {
            // No need to do the rest if we're on the last iteration.
            // Indeed, the rest wouldn't be valid anyway because assignments to V and B would be out of bounds.
            // We still need to do the preceding multiplication, though, because 'F' now contains the residuals.
            break;
        }

        Float R_F = F.norm();
        if (R_F < eps) {
            fill_with_random_normals(F, eng);
            orthogonalize_vector(V, F, j + 1);
            R_F = F.norm();
            F /= R_F;
            R_F = 0;
        } else {
            F /= R_F;
        }

        V.col(j + 1) = F;
        B.coeffRef(j, j + 1) = R_F;

        inter.work->multiply(F, W_next); // i.e., W_next = mat * F;
        ++mult;
        W_next -= R_F * W.col(j); // equivalent to daxpy.

        // Full re-orthogonalization, using the left-most 'j + 1' columns of W.
        // Recall that W_next will be the 'j + 2'-th column, i.e., W.col(j + 1) in
        // 0-indexed terms, so we want to orthogonalize to all previous columns.
        orthogonalize_vector(W, W_next, j + 1);

        S = W_next.norm();
        if (S < eps) {
            fill_with_random_normals(W_next, eng);
            orthogonalize_vector(W, W_next, j + 1);
            S = W_next.norm();
            W_next /= S;
            S = 0;
        } else {
            W_next /= S;
        }

        B.coeffRef(j + 1, j + 1) = S;
        W.col(j + 1) = W_next;
    }

    return mult;
}

}

#endif
