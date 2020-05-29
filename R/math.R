#' Returns error for confidence interval.
#'
#' @param n Sample size.
#' @param s Standard deviation.
#' @param p Significance level.
#' @importFrom stats qt
#' @export
# TODO: Write test
calculate.ci.error <- function(n, s, p) {
	return(qt(p=p, df=n-1) * s)
}

#' Round a number to `n` digits and returns a string.
#'
#' @param x Number to be rounded.
#' @param n Number of digits after rounding.
#' @export
rn <- function(x, n) format(round(x, n), nsmall=n)

#' Round a number to 2 digits and returns a string.
#'
#' @param x Number to be rounded.
#' @export
r.2 <- function(x) rn(x, 2)
