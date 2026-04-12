#include "Rcpp.h"
#include "irlba/irlba.hpp"
#include <algorithm>

//[[Rcpp::export(rng=false)]]
Rcpp::List parallel(
    int nrow,
    int ncol,
    Rcpp::NumericVector x,
    Rcpp::IntegerVector i,
    Rcpp::IntegerVector p,
    Rcpp::NumericVector init,
    int number,
    int work,
    int num_threads
) {
    irlba::Options opt;
    opt.extra_work = work;
    irlba::EigenThreadScope ets(num_threads);

    Eigen::VectorXd v(init.size());
    std::copy(init.begin(), init.end(), v.data());
    opt.initial = std::move(v);

    // Make a copy for the time being as we don't have C++20 support to make a span.
    std::vector<double> copy_x(x.begin(), x.end());
    std::vector<int> copy_i(i.begin(), i.end());
    std::vector<int> copy_p(p.begin(), p.end());

    irlba::ParallelSparseMatrix<Eigen::VectorXd, Eigen::MatrixXd, std::vector<double>, std::vector<int>, std::vector<int> > A(
        nrow,
        ncol,
        std::move(copy_x),
        std::move(copy_i),
        std::move(copy_p),
        true,
        num_threads
    );
    auto res = irlba::compute(A, number, opt);

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


