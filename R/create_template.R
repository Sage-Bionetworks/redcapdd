#' Create empty data dictionary template
#'
#' 
#' @return An empty (0-row) data frame with columns corresponding to the column
#'   names required in a REDCap data dictionary.
#' @export
#' @author Kara Woo
create_dd_template <- function() {
  cols <- .pkg_env$dd_cols
  cols <- rlang::enquo(cols)
  tibble::tribble(cols)
}
