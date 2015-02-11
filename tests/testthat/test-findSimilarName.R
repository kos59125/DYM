context("findSimilarName")

test_that("verifies findSimilarName", {
   a <- "xyz"
   b <- "Xyz"
   c <- "xYz"
   d <- "xYZ"
   actual <- DYM:::findSimilarName(a, c(b, c, d))
   expect_equal(actual, c(b, c))
})

test_that("verifies findSimilarName with threshold", {
   a <- "xyz"
   b <- "XYz"
   c <- "xYZ"
   d <- "XyZ"
   actual <- DYM:::findSimilarName(a, c(b, c, d), threshold=1)
   expect_equal(actual, character(0))
})

test_that("no result if x = NA", {
   actual <- DYM:::findSimilarName(NA, c("x", "y"))
   expect_equal(actual, character(0))
})

test_that("NA in names should be omitted", {
   actual <- DYM:::findSimilarName("N", c("x", NA, "y", "NA"))
   expect_equal(actual, c("x", "y", "NA"))
})
