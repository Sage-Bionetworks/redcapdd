# Validate column names
#
# @param obj A named list or data frame.
# @return A Boolean value: TRUE if all column names are valid components of a
#   REDCap data dictionary; FALSE otherwise.
validate_columns <- function(obj) {
  all(names(obj) %in% dd_cols)
}
