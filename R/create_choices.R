#' Create choices for a radio, dropdown, or checkbox question
#'
#' Choices should take the format '1, option1 | 2, option2' etc.
#' `create_choices()` takes a vector and returns a string in the required
#' format.
#'
#' @param v A character vector of choice labels.
#' @export
#' @examples
#' v <- c("red", "green", "blue")
#' create_choices(v)
create_choices <- function(v) {
  paste(seq_along(v), v, sep = ", ", collapse = " | ")
}
