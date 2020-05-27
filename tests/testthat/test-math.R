test_that("increment increments", {
  expect_equal(increment(-1), 0)
  expect_equal(increment(0), 1)
})
