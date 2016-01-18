context("findSimilarName")

test_that("verifies findSimilarName", {
   x <- "xyz"
   dist1 <- "Ayz"
   dist2 <- "ABz"
   dist3 <- "ABC"
   actual <- DYM:::findSimilarName(x, c(dist1, dist2, dist3))
   # threshold defaults to 2
   expect_equal(actual, c(dist1, dist2))
})

test_that("verifies findSimilarName with threshold = 3", {
   x <- "xyz"
   dist1 <- "Ayz"
   dist2 <- "ABz"
   dist3 <- "ABC"
   actual <- DYM:::findSimilarName(x, c(dist1, dist2, dist3), threshold=3)
   expect_equal(actual, c(dist1, dist2, dist3))
})

test_that("verifies findSimilarName with threshold = 1", {
   x <- "xyz"
   dist1 <- "Ayz"
   dist2 <- "ABz"
   dist3 <- "ABC"
   actual <- DYM:::findSimilarName(x, c(dist1, dist2, dist3), threshold=1)
   expect_equal(actual, dist1)
})

test_that("verifies findSimilarName with threshold = 0", {
   x <- "xyz"
   dist1 <- "Ayz"
   dist2 <- "ABz"
   dist3 <- "ABC"
   actual <- DYM:::findSimilarName(x, c(dist1, dist2, dist3), threshold=0)
   expect_equal(actual, character())
})

test_that("no result if x = NA", {
   actual <- DYM:::findSimilarName(NA, c("x", "y"))
   expect_equal(actual, character(0))
})

test_that("NA in names should be omitted", {
   actual <- DYM:::findSimilarName("N", c("x", NA, "y", "NA"))
   expect_equal(actual, c("x", "y", "NA"))
})
