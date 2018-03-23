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

test_that("create_fields creates a field with all NAs when no argument is passed", {
  df <- create_fields()
  expect_true(validate_columns(df))
  expect_true(all(is.na(df)))
})

test_that("create_fields_type throws an error when invalid type is passed", {
  expect_error(create_field_type(type = "paragraph"))
})

test_that("create_fields_type puts the right type in the result", {
  mytype <- "truefalse"
  df <- create_field_type(type = mytype)
  expect_true(df$`Field Type` == mytype)
})

test_that("create_fields_type throws a warning when overwriting type values", {
  x <- list(`Field Type` = "radio")
  expect_warning(create_field_type("text", x))
})
