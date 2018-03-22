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
#'   "Field Label" = "Patient name"
#' )
#' create_fields(!!!x)
create_fields <- function(..., df = NULL) {
  if (!missing(...) & !is.null(df)) {
    stop("Use either `...` or `df` but not both.")
  }

  if (!missing(df) & !is.null(df)) {
    if(!"data.frame" %in% class(df)) {
      stop("`df` must be a data frame.")
    }
    
    if(!validate_columns(df)) {
      stop("Invalid column names found. See `?get_dd_cols` for allowable column names.")
    }
    
    add_missing_columns(df)
  } else {
    dots <- list2(...)
    
    if (!validate_columns(dots)) {
      stop("Invalid column names found. See `?get_dd_cols` for allowable column names.")
    }
    
    df <- as_tibble(dots)
    add_missing_columns(df)
  }  
}
