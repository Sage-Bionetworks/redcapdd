#' Get the column names of a REDCap data dictionary
#'
#' Provides a character vector of column names. Valid columns in a REDCap data
#' dictionary are:
#' * Variable / Field Name
#' * Form Name
#' * Section Header
#' * Field Type
#' * Field Label
#' * Choices, Calculations, OR Slider Labels
#' * Field Note
#' * Text Validation Type OR Show Slider Number
#' * Text Validation Min
#' * Text Validation Max
#' * Identifier?
#' * Branching Logic (Show field only if...)
#' * Required Field?
#' * Custom Alignment
#' * Question Number (surveys only)
#' * Matrix Group Name
#' * Matrix Ranking?
#' * Field Annotation
#'
#' @return A character vector containing the valid column names.
#' @export
#' @examples
#' dd_cols <- get_dd_cols()
get_dd_cols <- function() {
  dd_cols
}
