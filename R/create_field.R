#' Create one or more fields in a REDCap data dictionary
#'
#' 
#' 
#' @param ... Elements of the data dictionary to be populated. Can be passed as
#'   individual arguments, or as a list. All columns not described will be
#'   populated with `NA`. If passing a list, it must be unquote-spliced (see
#'   examples).
#' @param df Optionally, a data frame containing one or more fields.
#' @return A tibble containing one or more fields in the data dictionary.
#' @export
#'
#' @examples
#' create_fields(
#'   "Variable / Field Name" = "patient_name",
#'   "Field Label" = "Patient name"
#' )
#' 
#' # When passing a list, it must be unquote-spliced
#' x <- list(
#'   "Variable / Field Name" = "patient_name",
#'   "Field Label" = "Ptient name"
#' )
#' create_fields(!!!x)

create_fields <- function(..., df = NULL) {
  if (!missing(...) & !is.null(df)) {
    stop("Use either `...` or `df` but not both.")
  }

  dots <- rlang::list2(...)

  if (!all(names(dots) %in% dd_cols)) {
    stop("Invalid column names found. See `?dd_cols` for allowable column names.")
  }
  
  tibble::as_tibble(dots)
}


