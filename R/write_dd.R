#' Export data dictionary as a CSV file
#'
#' @param df Tibble containing the data dictionary.
#' @param filename File name to write to.
#' @export
write_dd <- function(df, filename = "data_dictionary.csv") {
  # Numeric vector of column positions to quote in the resulting CSV
  # (unfortunately they can't just all be quoted or the REDCap validator will
  # complain that the empty strings in some columns are invalid values)
  to_quote <- which(
    names(df) %in% c(
      "Field Label",
      "Field Note",
      "Choices, Calculations, OR Slider Labels",
      "Branching Logic (Show field only if...)"
    )
  )

  write.csv(df, filename, na = "", quote = to_quote, row.names = FALSE)
}
