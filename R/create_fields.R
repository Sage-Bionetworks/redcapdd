#' Create one or more fields in a REDCap data dictionary
#'
#' @param x An object (list or data frame) containing information for the fields
#'   to be added.
#' @param type A field type. One of: "calc", "checkbox", "descriptive",
#'   "dropdown", "file", "notes", "radio", "slider", "sql", "text", "truefalse",
#'   "yesno".
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
create_fields.NULL <- function(x) {
  df <- create_dd_template()
  df[1, ] <- NA
  df
}

#' @export
create_fields.default <- function(x) {
  stop("`x` must be a list or data frame.", call. = FALSE)
}

#' @rdname create_fields
#' @export
create_field_type <- function(type, x) {
  if (!type %in% c("checkbox", "dropdown", "notes", "radio", "text", "truefalse")) {
    stop(
      paste0(
        "Invalid field type. Options are: 'checkbox', 'dropdown', ",
        "'notes', 'radio', 'text', 'truefalse'"
      ),
      call. = FALSE
    )
  }
  if (missing(x)) {
    df <- create_fields()
  } else {
    df <- create_fields(x)
  }
  if (!all(is.na(df$`Field Type`)) & !all(df$`Field Type` == type)) {
    warning(
      "Other values present in `Field Type` column have been overwritten",
      call. = FALSE
    )
  }
  df$`Field Type` <- type
  df
}

#' @rdname create_fields
#' @export
create_calc_field <- function(x) {
  create_field_type("calc", x)
}

#' @rdname create_fields
#' @export
create_checkbox_field <- function(x) {
  create_field_type("checkbox", x)
}

#' @rdname create_fields
#' @export
create_descriptive_field <- function(x) {
  create_field_type("descriptive", x)
}

#' @rdname create_fields
#' @export
create_dropdown_field <- function(x) {
  create_field_type("dropdown", x)
}

#' @rdname create_fields
#' @export
create_file_field <- function(x) {
  create_field_type("file", x)
}

#' @rdname create_fields
#' @export
create_notes_field <- function(x) {
  create_field_type("notes", x)
}

#' @rdname create_fields
#' @export
create_radio_field <- function(x) {
  create_field_type("radio", x)
}

#' @rdname create_fields
#' @export
create_slider_field <- function(x) {
  create_field_type("slider", x)
}

#' @rdname create_fields
#' @export
create_sql_field <- function(x) {
  create_field_type("sql", x)
}

#' @rdname create_fields
#' @export
create_text_field <- function(x) {
  create_field_type("text", x)
}

#' @rdname create_fields
#' @export
create_truefalse_field <- function(x) {
  create_field_type("truefalse", x)
}

#' @rdname create_fields
#' @export
create_yesno_field <- function(x) {
  create_field_type("yesno", x)
}
