#include "Rcpp.h"
#include "irlba/irlba.hpp"
#include <algorithm>
#include "Eigen/Sparse"

//[[Rcpp::export(rng=false)]]
Rcpp::List sparse(
    int nrow,
    int ncol,
    Rcpp::NumericVector x,
    Rcpp::IntegerVector i,
    Rcpp::IntegerVector p,
    Rcpp::NumericVector init,
    int number,
    int work,
    double tol,
    int num_threads
) {
    irlba::Options opt;
    opt.extra_work = work;
    opt.convergence_tolerance = tol;
    irlba::EigenThreadScope ets(num_threads);

    Eigen::VectorXd v(init.size());
    std::copy(init.begin(), init.end(), v.data());
    opt.initial = std::move(v);

    Eigen::Map<Eigen::SparseMatrix<double> > A(
        nrow,
        ncol,
        x.size(),
        static_cast<int*>(p.begin()),
        static_cast<int*>(i.begin()),
        static_cast<double*>(x.begin())
    );
    auto res = irlba::compute(irlba::SimpleMatrix<Eigen::VectorXd, Eigen::MatrixXd, decltype(&A)>(&A), number, opt);

    Rcpp::NumericMatrix outU(res.U.rows(), res.U.cols());
    std::copy(res.U.data(), res.U.data() + res.U.size(), outU.begin());
    Rcpp::NumericMatrix outV(res.V.rows(), res.V.cols());
    std::copy(res.V.data(), res.V.data() + res.V.size(), outV.begin());
    Rcpp::NumericVector outD(res.D.size());
    std::copy(res.D.begin(), res.D.end(), outD.begin());
    
    return Rcpp::List::create(
        Rcpp::Named("U") = outU,
        Rcpp::Named("V") = outV,
        Rcpp::Named("D") = outD,
        Rcpp::Named("converged") = res.metrics.converged,
        Rcpp::Named("iterations") = res.metrics.iterations,
        Rcpp::Named("multiplications") = res.metrics.multiplications
    );
}

