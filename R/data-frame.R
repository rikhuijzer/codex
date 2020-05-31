#' Change the column type for one or more columns.
#'
#' This function ignores columns specified in `cols` which are unavailable in the dataframe.
#' @param df Data frame.
#' @param cols Data frame columns.
#' @param func Function to apply to the columns.
#' @importFrom magrittr %>%
#' @export
change.column.type <- function(df, cols, func) {
	only.available <- cols[cols %in% names(df)]
	df %>% dplyr::mutate_at(dplyr::vars(only.available), func)
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
