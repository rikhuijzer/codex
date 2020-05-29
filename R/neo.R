#' Add factors to array of NEO domains; useful for sorting.
#' 
#' Allows Asterisk `*` as wildcard.
#' @param x A vector of distinct values.
#' @export
factor.neo <- function(x) factor(x, levels=c("*", "N", "E", "O", "A", "C"))
