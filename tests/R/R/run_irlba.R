#' @export
run_irlba <- function(x, number, init = rnorm(ncol(x)), work = 7, use.parallel.sparse = FALSE, num.threads = 1) {
    if (is.matrix(x)) {
        dense(x, init, number=number, work=work, num_threads=num.threads)
    } else if (use.parallel.sparse) {
        parallel(nrow(x), ncol(x), x=x@x, i=x@i, p=x@p, init=init, number=number, work=work, num_threads=num.threads)
    } else {
        sparse(nrow(x), ncol(x), x=x@x, i=x@i, p=x@p, init=init, number=number, work=work, num_threads=num.threads)
    }
}
