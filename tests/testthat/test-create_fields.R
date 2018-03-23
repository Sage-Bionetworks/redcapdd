context("create_fields")

test_that("create_fields throws error when invalid columns are provided", {
  expect_error(create_fields(blah = 5))
  expect_error(create_fields(tibble(blah = 5)))
})

test_that("create_fields can take list in ...", {
  mylist <- list(
    `Variable / Field Name` = "patient_name",
    `Field Label` = "Patient name"
  )
  df <- create_fields(mylist)
  expect_true(all(dd_cols %in% names(df)))
  expect_is(df, "tbl_df")
  expect_equal(df$`Variable / Field Name`, "patient_name")
})

test_that("create_fields can take tibble", {
  mydf <- tibble(
    `Variable / Field Name` = "patient_name",
    `Field Label` = "Patient name"
  )
  df <- create_fields(mydf)
  expect_true(all(dd_cols %in% names(df)))
  expect_is(df, "tbl_df")
  expect_equal(df$`Variable / Field Name`, "patient_name")
})
