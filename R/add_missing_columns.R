#' Add missing columns
#'
#' Given a data frame containing some columns for a data dictionary, add the
#' remaining (populated with NAs).
#' 
#' @param df Data frame to which columns should be added.
#' @export
#' @examples
#' df <- tibble::tibble(`Variable / Field Name` = "patient_name")
#' add_missing_columns(df)
add_missing_columns <- function(df) {
  missing_cols <- setdiff(dd_cols, names(df))
  df[missing_cols] <- NA
  df[dd_cols]
}
