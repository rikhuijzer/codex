test_that("increment increments", {
  expect_equal(increment(-1), -1)
  expect_equal(increment(0), 1)
})
