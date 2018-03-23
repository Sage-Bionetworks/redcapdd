# Validate column names
#
# @param obj A named list or data frame.
# @return A Boolean value: TRUE if all column names are valid components of a
#   REDCap data dictionary; FALSE otherwise.
validate_columns <- function(obj) {
  all(names(obj) %in% dd_cols)
}

#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL
