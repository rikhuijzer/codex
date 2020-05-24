source("../math.R", chdir = T)
library(testthat)

test_that("single number", {
  expect_equal(increment(-1), 0)
  expect_equal(increment(0), 1)
})

test_that("it fails", {
	expect_equal(increment(0), 9)
})
