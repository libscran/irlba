# library(testthat); library(irlba.tests); source("test-run.R")

# Creating a comparator function, as decompositions are not identifiable by the sign of the vectors.
compare <- function(left, right) {
    expect_equal(abs(left), abs(right))
    expect_equal(abs(colSums(left)), abs(colSums(right)))
}

library(irlba)

test_that("dense", {
    set.seed(10)
    mat <- matrix(rnorm(50000), 250, 200)
    set.seed(100)
    v <- rnorm(ncol(mat))

    ref <- irlba::irlba(mat, nv=3, work=10, v=v)
    out <- run_irlba(mat, v, number=3, work=7)

    compare(ref$u, out$U)
    compare(ref$v, out$V)
    expect_equal(ref$s, out$d)

    # Another one, just for good measure. 
    ref <- irlba::irlba(mat, nv=9, work=14, v=rev(v))
    out <- run_irlba(mat, rev(v), number=9, work=5)

    compare(ref$u, out$U)
    compare(ref$v, out$V)
    expect_equal(ref$d, out$D)

    # As DJ Khaled says, another one.
    ref <- irlba::irlba(mat, nv=30, work=50, v=-v)
    out <- run_irlba(mat, -v, number=30, work=20)

    compare(ref$u, out$U)
    compare(ref$v, out$V)
    expect_equal(ref$d, out$D)
})

test_that("sparse", {
    set.seed(20)
    mat <- Matrix::rsparsematrix(100, 500, density=0.1)
    set.seed(200)
    v <- rnorm(ncol(mat))

    ref <- irlba::irlba(mat, nv=5, work=15, v=v)
    out <- run_irlba(mat, v, number=5, work=10)

    compare(ref$u, out$U)
    compare(ref$v, out$V)
    expect_equal(ref$s, out$d)

    # Another one, just for good measure. 
    ref <- irlba::irlba(mat, nv=20, work=36, v=rev(v))
    out <- run_irlba(mat, rev(v), number=20, work=16)

    compare(ref$u, out$U)
    compare(ref$v, out$V)
    expect_equal(ref$d, out$D)

    # As DJ Khaled says, another one.
    ref <- irlba::irlba(mat, nv=40, work=70, v=-v)
    out <- run_irlba(mat, -v, number=40, work=30)

    compare(ref$u, out$U)
    compare(ref$v, out$V)
    expect_equal(ref$d, out$D)
})

test_that("exact small", {
    set.seed(20)
    mat <- matrix(rnorm(40), 5, 8)
    set.seed(200)
    v <- rnorm(ncol(mat))

    out <- run_irlba(mat, v, number=2, work=2)
    expect_identical(out$iterations, 0L)
    expect_identical(out$multiplications, 0L)

    ref <- irlba::irlba(mat, nv=2, work=10, v=v)
    compare(ref$u, out$U)
    compare(ref$v, out$V)
    expect_equal(ref$s, out$d)
})

test_that("exact large", {
    set.seed(30)
    mat <- matrix(rnorm(4000), 50, 80)
    set.seed(200)
    v <- rnorm(ncol(mat))

    out <- run_irlba(mat, v, number=30, work=30)
    expect_identical(out$iterations, 0L)
    expect_identical(out$multiplications, 0L)

    ref <- svd(mat)
    compare(ref$u[,1:30], out$U)
    compare(ref$v[,1:30], out$V)
    expect_equal(ref$d[1:30], out$D)
})
