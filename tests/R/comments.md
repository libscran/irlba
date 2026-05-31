# Miscellaneous notes

## Performance testing 

I usually do something like the following:

```r
set.seed(1999)
y <- Matrix::rsparsematrix(10000, 5000, density=0.1)

n <- 200
init <- rnorm(ncol(y))

library(irlba.tests)
system.time(iout <- irlba.tests::run_irlba(y, number=n, work=n, init=init))
system.time(iout <- irlba.tests::run_irlba(y, number=n, work=n, init=init, use.parallel.sparse=TRUE))
system.time(iout <- irlba.tests::run_irlba(y, number=n, work=n, init=init, num.threads=2))
system.time(iout <- irlba.tests::run_irlba(y, number=n, work=n, init=init, use.parallel.sparse=TRUE, num.threads=2))
```

## Compilation

For performance testing, don't rely on the shared libraries generated via **devtools**.
Something in their stack decided to add `-O0` to the compilation flags, and unoptimized binaries are not representative of actual performance.

## OpenMP

Compiling with OpenMP gives a modest speed boost over the default PThreads scheme when `num.threads > 1`.
We can test this by modifying `src/Makevars` to use the following:

```
PKG_CPPFLAGS += ${STUFF} -I../../../include/ $(SHLIB_OPENMP_CFLAGS)
PKG_LIBS = $(SHLIB_OPENMP_CFLAGS)
```

Presumably this is because more Eigen operations can actually be parallelized, instead of just the matrix multiplication.
Indeed, modifying the C++ code to `EigenThreadScope ets(1)` eliminates this discrepancy with PThreads.
