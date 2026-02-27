# library(testthat); library(irlba.tests); source("test-run.R")

# Creating a comparator function, as decompositions are not identifiable by the sign of the vectors.
compare <- function(left, right) {
    expect_equal(abs(left), abs(right))
    expect_equal(abs(colSums(left)), abs(colSums(right)))
}

library(irlba)

test_that("simple", {
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
})

test_that("exact", {
    set.seed(20)
    mat <- matrix(rnorm(40), 5, 8)
    set.seed(200)
    v <- rnorm(ncol(mat))

    ref <- irlba::irlba(mat, nv=2, work=10, v=v)
    out <- run_irlba(mat, v, number=2, work=2)

    compare(ref$u, out$U)
    compare(ref$v, out$V)
    expect_equal(ref$s, out$d)
})
