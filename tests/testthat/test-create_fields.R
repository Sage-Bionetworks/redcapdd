context("create_fields")

test_that("create_fields throws error when both ... and df are provided", {
  df <- tibble(`Field Type` = "text")
  expect_error(create_fields("Section Header" = "Part 1", df))
})

test_that("create_fields throws error when invalid columns are provided", {
  expect_error(create_fields(blah = 5))
  expect_error(create_fields(df = tibble(blah = 5)))
})

test_that("create_fields throws an error when df is not a data frame", {
  expect_error(create_fields(df = 8))
})

test_that("create_fields can take arbitrary arguments in ...", {
  df <- create_fields(
    `Variable / Field Name` = "patient_name",
    `Field Label` = "Patient name"
  )
  expect_true(all(dd_cols %in% names(df)))
  expect_is(df, "tbl_df")
  expect_equal(df$`Variable / Field Name`, "patient_name")
})

test_that("create_fields can take list in ...", {
  mylist <- list(
    `Variable / Field Name` = "patient_name",
    `Field Label` = "Patient name"
  )
  df <- create_fields(!!!mylist)
  expect_true(all(dd_cols %in% names(df)))
  expect_is(df, "tbl_df")
  expect_equal(df$`Variable / Field Name`, "patient_name")
})

test_that("create_fields can take tibble", {
  mydf <- tibble(
    `Variable / Field Name` = "patient_name",
    `Field Label` = "Patient name"
  )
  df <- create_fields(df = mydf)
  expect_true(all(dd_cols %in% names(df)))
  expect_is(df, "tbl_df")
  expect_equal(df$`Variable / Field Name`, "patient_name")
})
