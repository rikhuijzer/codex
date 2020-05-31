test_that("rounding is according to spec", {
	expect_equal(rn(1.234, 1), "1.2")
	expect_equal(r.2(1.234), "1.23")
})

test_that("cohens.d", {
	actual <- cohens.d(13, 16, 1.062, 0.528, 0.382, 0.339)
	expect_equal(round(actual, 1), 1.5)
})
