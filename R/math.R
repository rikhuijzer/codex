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

#' Returns Cohen's d
#'
#' @param n1 Sample size for group 1.
#' @param n2 Sample size for group 2.
#' @param m1 Mean for group 1.
#' @param m2 Mean for group 2.
#' @param s1 Standard deviation for group 1.
#' @param s2 Standard deviation for group 2.
#' @export
cohens.d <- function(n1, n2, m1, m2, s1, s2) {
	sp <- sqrt( ((n1-1)*s1^2 + (n2-1)*s2^2) / (n1+n2-2) )
	d <- (m1 - m2) / sp
	return(d)
}
