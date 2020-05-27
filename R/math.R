#' An example function
#'
#' @param x Number to be incremented.
#' @export
increment <- function(x) return(x + 1)

#' Returns error for confidence interval.
#'
#' @param n Sample size.
#' @param s Standard deviation.
#' @param p Significance level.
#' @export
calculate.ci.error <- function(n, s, p) (qt(p=p, df=n-1) * s)
# TODO: Write test
