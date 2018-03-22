context("create_dd_template")

test_that("create_dd_template() creates a tibble with the right columns", {
  expect_true("tbl_df" %in% class(create_dd_template()))
  expect_equal(names(create_dd_template()), .pkg_env$dd_cols)
})
