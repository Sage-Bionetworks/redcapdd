#' Create one or more fields in a REDCap data dictionary
#'
#' @param x An object (list or data frame) containing information for the fields
#'   to be added.
#' @return A tibble containing one or more fields in the data dictionary with
#'   all required columns.
#' @export
#'
#' @examples
#'
#' x <- list(
#'   "Variable / Field Name" = "patient_name",
#'   "Field Label" = "Patient name"
#' )
#' create_fields(x)
#'
#' x <- tibble::tibble(
#' `Variable / Field Name` = "patient_name",
#' `Field Label` = "Patient name"
#' )
#' create_fields(x)
create_fields <- function(x) {
  UseMethod("create_fields")
}

#' @export
create_fields.data.frame <- function(x) {
  if (!validate_columns(x)) {
    stop(
      "Invalid column names found. See `?get_dd_cols` for allowable column names.",
      call. = FALSE
    )
  }

  add_missing_columns(x)
}

#' @export
create_fields.list <- function(x) {
  if (!validate_columns(x)) {
    stop(
      "Invalid column names found. See `?get_dd_cols` for allowable column names.",
      call. = FALSE
    )
  }
  df <- as_tibble(x)
  add_missing_columns(df)
}

#' @export
create_fields.default <- function(x) {
  stop("`x` must be a list or data frame.", call. = FALSE)
}
