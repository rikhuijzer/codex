example.df <- function() tibble::tibble(x=c(1, 2), y=c("a", "b"))

test_that("change.column.type", {
	expected <- "integer"
	actual <- change.column.type(example.df(), c("x", "z"), as.integer)
	expect_equal(as.character(sapply(actual, class)[1]), expected)
})
