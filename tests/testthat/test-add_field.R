context("add_field")

test_that("add_field adds a new row and result has the right columns", {
  df <- create_dd_template()
  df2 <- add_field(df)
  expect_true(nrow(df2) - nrow(df) == 1)
  expect_true(all.equal(names(df2), dd_cols))
})

test_that("add_field_type throws a warning and overwrites other field type values", {
  df <- create_dd_template()
  expect_warning(add_field_type(df, `Field Type` = "radio", .type = "checkbox"))

  df2 <- suppressWarnings(
    add_field_type(df, `Field Type` = "radio", .type = "checkbox")
  )
  expect_true(df2$`Field Type` == "checkbox")
})
