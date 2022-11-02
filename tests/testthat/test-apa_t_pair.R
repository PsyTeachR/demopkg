x <- 1:5
y <- c(2,3,2,5,6)

test_that("defaults", {
  result <- apa_t_pair(x, y)
  expected <- "A paired-samples t-test was conducted to compare the DV between level 1 (M = 3.0, SD = 1.6) and level 2 (M = 3.6, SD = 1.8). There was a non-significant difference; t(4) = -1.50, p = 0.208."

  expect_equal(result, expected)
})

test_that("non-defaults", {
  result <- apa_t_pair(x, y,
                       dv = "the score",
                       level1 = "Group A",
                       level2 = "Group B")

  expected <- "A paired-samples t-test was conducted to compare the score between Group A (M = 3.0, SD = 1.6) and Group B (M = 3.6, SD = 1.8). There was a non-significant difference; t(4) = -1.50, p = 0.208."

  expect_equal(result, expected)
})


test_that("same x and y", {
  expect_error( apa_t_pair(x, x),
                "x and y cannot be identical",
                fixed = TRUE)
})

test_that("non-numeric x or y", {
  x <- LETTERS[1:5]
  y <- 1:5

  expect_error( apa_t_pair(x, y),
                "x must be a numeric vector",
                fixed = TRUE)

  expect_error( apa_t_pair(y, x),
                "y must be a numeric vector",
                fixed = TRUE)
})
