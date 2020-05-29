test_that("rounding is according to spec", {
	expect_equal(rn(1.234, 1), "1.2")
	expect_equal(r.2(1.234), "1.23")
})

test_that("out.format", {
	expect_equal(out.format(), "unknown-knit-format")
})
