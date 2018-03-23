context("create_choices")

test_that("create_choices concatenates choices", {
  v <- c("red", "green", "blue")
  output <- c("1, red | 2, green | 3, blue")
  expect_equal(create_choices(v), output)
})
