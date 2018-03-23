
<!-- README.md is generated from README.Rmd. Please edit that file -->

# redcapdd

[![Travis-CI Build
Status](https://travis-ci.org/Sage-Bionetworks/redcapdd.svg?branch=master)](https://travis-ci.org/Sage-Bionetworks/redcapdd)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

The goal of redcapdd is to generate properly formatted data dictionaries
for upload to REDCap.

## Installation

``` r
devtools::install_github("Sage-Bionetworks/redcapdd")
```

## Creating data dictionaries

You can create a new field with `create_fields()`. The result will have
all of the columns required in a REDCap data dictionary.

When called with no arguments, `create_fields()` provides a one-row data
frame containing all NAs.

``` r
library("redcapdd")
create_fields()
#> # A tibble: 1 x 18
#>   `Variable / Fie… `Form Name` `Section Header` `Field Type` `Field Label`
#> * <lgl>            <lgl>       <lgl>            <lgl>        <lgl>        
#> 1 NA               NA          NA               NA           NA           
#> # ... with 13 more variables: `Choices, Calculations, OR Slider
#> #   Labels` <lgl>, `Field Note` <lgl>, `Text Validation Type OR Show
#> #   Slider Number` <lgl>, `Text Validation Min` <lgl>, `Text Validation
#> #   Max` <lgl>, `Identifier?` <lgl>, `Branching Logic (Show field only
#> #   if...)` <lgl>, `Required Field?` <lgl>, `Custom Alignment` <lgl>,
#> #   `Question Number (surveys only)` <lgl>, `Matrix Group Name` <lgl>,
#> #   `Matrix Ranking?` <lgl>, `Field Annotation` <lgl>
```

You can provide as much information as you want to populate the field;
`create_fields()` will fill out the rest of the columns with NAs.

``` r
x <- list(
  `Variable / Field Name` = "patient_name",
  `Field Label` = "Patient name",
  `Identifier?` = "y"
)

create_fields(x)
#> # A tibble: 1 x 18
#>   `Variable / Fie… `Form Name` `Section Header` `Field Type` `Field Label`
#>   <chr>            <lgl>       <lgl>            <lgl>        <chr>        
#> 1 patient_name     NA          NA               NA           Patient name 
#> # ... with 13 more variables: `Choices, Calculations, OR Slider
#> #   Labels` <lgl>, `Field Note` <lgl>, `Text Validation Type OR Show
#> #   Slider Number` <lgl>, `Text Validation Min` <lgl>, `Text Validation
#> #   Max` <lgl>, `Identifier?` <chr>, `Branching Logic (Show field only
#> #   if...)` <lgl>, `Required Field?` <lgl>, `Custom Alignment` <lgl>,
#> #   `Question Number (surveys only)` <lgl>, `Matrix Group Name` <lgl>,
#> #   `Matrix Ranking?` <lgl>, `Field Annotation` <lgl>
```

There are a number of aliases to `create_fields()` that support the
creation of specific field types. These include
`create_checkbox_field()`, `create_text_field()`, and others. See
`?create_fields` for more information.

redcapdd also supports chaining operations with `%>%` and the
`add_field()` function. Like `create_fields()`, `add_field()` has
aliases for different field types.

``` r
create_dd_template() %>%
  add_text_field(
    `Variable / Field Name` = "patient_name",
    `Field Label` = "Patient name",
    `Identifier?` = "y"
  ) %>%
  add_truefalse_field(
    `Variable / Field Name` = "given_birth",
    `Field Label` = "Patient has given birth?"
  )
#> # A tibble: 2 x 18
#>   `Variable / Fie… `Form Name` `Section Header` `Field Type` `Field Label`
#>   <chr>            <lgl>       <lgl>            <chr>        <chr>        
#> 1 patient_name     NA          NA               text         Patient name 
#> 2 given_birth      NA          NA               truefalse    Patient has …
#> # ... with 13 more variables: `Choices, Calculations, OR Slider
#> #   Labels` <lgl>, `Field Note` <lgl>, `Text Validation Type OR Show
#> #   Slider Number` <lgl>, `Text Validation Min` <lgl>, `Text Validation
#> #   Max` <lgl>, `Identifier?` <chr>, `Branching Logic (Show field only
#> #   if...)` <lgl>, `Required Field?` <lgl>, `Custom Alignment` <lgl>,
#> #   `Question Number (surveys only)` <lgl>, `Matrix Group Name` <lgl>,
#> #   `Matrix Ranking?` <lgl>, `Field Annotation` <lgl>
```

## Other functionality

Certain field types such as dropdown, radio, and checkbox can take
multiple options in the `Choices, Calculations, OR Slider Labels`
column. These options need to be in a specific format to be accepted by
REDCap’s data dictionary validator: `1, option1 | 2, option2` and so on.
You can create a string in this format from a character vector with the
`create_choices()` function.

``` r
x <- c("red", "green", "blue")
create_choices(x)
#> [1] "1, red | 2, green | 3, blue"
```

## Exporting your data dictionary

`write_dd()` will export your data dictionary with the correct fields
quoted. Some must be quoted, but others cannot be or the REDCap
validator will complain that the empty strings are invalid values;
`write_dd()` takes care of this for you.

``` r
dd <- create_fields(x)
write_dd(x, "data_dictionary.csv")
```
