#' Add a new field.
#'
#' Adds a new field to a tibble containing existing fields.
#'
#' @inheritParams tibble::add_row
#' @param .type A field type. One of: "calc", "checkbox", "descriptive",
#'   "dropdown", "file", "notes", "radio", "slider", "sql", "text", "truefalse",
#'   "yesno".
#' @export
add_field <- tibble::add_row

#' @rdname add_field
#' @export
add_field_type <- function(.data, ..., .type) {
  dots <- list2(...)
  if ("Field Type" %in% names(dots) & !all(dots$`Field Type` == .type)) {
    dots$`Field Type` <- NULL
    warning(
      "Other values present in `Field Type` column have been overwritten",
      call. = FALSE
    )
  }
  add_field(.data, !!!dots, `Field Type` = .type)
}

#' @rdname add_field
#' @export
add_calc_field <- function(.data, ...) {
  add_field_type(.data, ..., .type = "calc")
}

#' @rdname add_field
#' @export
add_checkbox_field <- function(.data, ...) {
  add_field_type(.data, ..., .type = "checkbox")
}

#' @rdname add_field
#' @export
add_descriptive_field <- function(.data, ...) {
  add_field_type(.data, ..., .type = "descriptive")
}

#' @rdname add_field
#' @export
add_dropdown_field <- function(.data, ...) {
  add_field_type(.data, ..., .type = "dropdown")
}

#' @rdname add_field
#' @export
add_file_field <- function(.data, ...) {
  add_field_type(.data, ..., .type = "file")
}

#' @rdname add_field
#' @export
add_notes_field <- function(.data, ...) {
  add_field_type(.data, ..., .type = "notes")
}

#' @rdname add_field
#' @export
add_radio_field <- function(.data, ...) {
  add_field_type(.data, ..., .type = "radio")
}

#' @rdname add_field
#' @export
add_slider_field <- function(.data, ...) {
  add_field_type(.data, ..., .type = "slider")
}

#' @rdname add_field
#' @export
add_sql_field <- function(.data, ...) {
  add_field_type(.data, ..., .type = "sql")
}

#' @rdname add_field
#' @export
add_text_field <- function(.data, ...) {
  add_field_type(.data, ..., .type = "text")
}

#' @rdname add_field
#' @export
add_truefalse_field <- function(.data, ...) {
  add_field_type(.data, ..., .type = "truefalse")
}

#' @rdname add_field
#' @export
add_yesno_field <- function(.data, ...) {
  add_field_type(.data, ..., .type = "yesno")
}
